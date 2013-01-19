package com.scoreshared.webapp.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.scoreshared.business.bo.UserBo;
import com.scoreshared.business.persistence.File;

@Controller
public class AvatarController extends BaseController {

    @Inject
    private UserBo bo;

    /**
     * This method may return different images depending on the combination of the following variables: hash value passed (1), 
     * whether an small sized image was requested (2):
     * 
     * 1 (true, equals to 'default' or empty), 2 (true): a small image of the default avatar representation is returned;
     * 1 (true, equals to 'default' or empty), 2 (false): a regular image of the default avatar representation is returned;
     * 1 (true), 2 (true): a small image of the user represented by the hash is returned;
     * 1 (true), 2 (false): a regular image of the user represented by the hash is returned;
     * 1 (false), 2 (true|false|non existent): the last image uploaded stored into the user's session is returned, if there is any.
     */
    @RequestMapping(value = "/avatar", method = RequestMethod.GET)
    public ResponseEntity<byte[]> showAvatar(@RequestParam(required = false, value = "hash") String hash,
            @RequestParam(required = false, value = "small") String smallSizeRequestedParam, HttpSession session) {
        boolean smallSizeRequested = smallSizeRequestedParam != null;

        try {
            HttpHeaders httpHeaders = createCacheHeaders(hash, smallSizeRequested);
            if (StringUtils.hasText(hash) && !hash.equals("default")) {
                List<Integer> avatarIds = null;
                if (smallSizeRequested) {
                    avatarIds = bo.getSmallAvatarIdsByHash(hash);
                } else {
                    avatarIds = bo.getAvatarIdsByHash(hash);
                }
                if (avatarIds.size() > 0) {
                    if (avatarIds.get(0).equals(getDefaultAvatar(session.getServletContext()).getId())) {
                        return outputAvatar(httpHeaders, getDefaultAvatar(session.getServletContext()));

                    } else if (avatarIds.get(0).equals(getSmallDefaultAvatar(session.getServletContext()).getId())) {
                        return outputAvatar(httpHeaders, getSmallDefaultAvatar(session.getServletContext()));

                    } else {
                        File avatar = bo.findAvatarByPk(avatarIds.get(0));
                        return outputAvatar(httpHeaders, avatar);
                    }
                }
            } else if (session.getAttribute("savedFile") != null) {
                File avatar = (File) session.getAttribute("savedFile");
                return outputAvatar(httpHeaders, avatar);
            }

            if (smallSizeRequested) {
                return outputAvatar(httpHeaders, getSmallDefaultAvatar(session.getServletContext()));
            }

            return outputAvatar(httpHeaders, getDefaultAvatar(session.getServletContext()));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private ResponseEntity<byte[]> outputAvatar(HttpHeaders httpHeaders, File avatar) throws IOException {
        return new ResponseEntity<byte[]>(avatar.getData(), httpHeaders, HttpStatus.OK);
    }

    private File getDefaultAvatar(ServletContext context) {
        return (File) context.getAttribute(UserBo.DEFAULT_AVATAR_KEY);
    }

    private File getSmallDefaultAvatar(ServletContext context) {
        return (File) context.getAttribute(UserBo.SMALL_DEFAULT_AVATAR_KEY);
    }

    private HttpHeaders createCacheHeaders(String hash, boolean smallSizeRequested) {
        HttpHeaders result = new HttpHeaders();
        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("GMT-3"));
        calendar.add(Calendar.YEAR, 1);
        result.add("Expires",
                new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss Z", Locale.ENGLISH).format(calendar.getTime()));
        result.add("ETag", hash + smallSizeRequested);
        return result;
    }
}