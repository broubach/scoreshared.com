package com.scoreshared.webapp.controller;

import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.scoreshared.business.bo.FileBo;
import com.scoreshared.business.persistence.File;

@Controller
@SessionAttributes({ "savedFile" })
public class AvatarController {

    @Inject
    private FileBo bo;

    @RequestMapping(value = "/avatar", method = RequestMethod.POST)
    public ModelAndView handleAvatarUpload(Principal loggedUser, @RequestParam("file") MultipartFile uploadedFile) {
        // TODO: put authenticated user in the session
        try {
            File file = new File();
            file.setDate(new Date());
            if (uploadedFile.getName().length() > 45) {
                file.setName(uploadedFile.getName().substring(0, 44));
            } else {
                file.setName(uploadedFile.getName());
            }
            file.setSize(uploadedFile.getSize());
            file.setData(uploadedFile.getBytes());
            file.setOwner(bo.getUserByEmail(loggedUser.getName()));
            ModelAndView mav = new ModelAndView("welcome/step3");
            mav.addObject("savedFile", file);
            return mav;
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * This method may return different images depending on the combination of the following variables: hash value passed (1), 
     * whether an small sized image was requested (2):
     * 
     * 1 (true, equals to 'default'), 2 (true): a small image of the default avatar representation is returned;
     * 1 (true, equals to 'default'), 2 (false): a regular image of the default avatar representation is returned;
     * 1 (true), 2 (true): a small image of the user represented by the hash is returned;
     * 1 (true), 2 (false): a regular image of the user represented by the hash is returned;
     * 1 (false), 2 (true|false|non existent): the last image uploaded stored into the user's session is returned, if there is any.
     */
    @RequestMapping(value = "/avatar", method = RequestMethod.GET)
    public ResponseEntity<byte[]> showAvatar(@RequestParam(required = false, value = "hash") String hash,
            @RequestParam(required = false, value = "small") String smallSizeRequestedParam, HttpSession session,
            ModelMap model) {
        boolean smallSizeRequested = smallSizeRequestedParam != null;

        try {
            HttpHeaders httpHeaders = createCacheHeaders(hash, smallSizeRequested);
            if ("default".equals(hash)) {
                if (smallSizeRequested) {
                    return outputAvatar(httpHeaders, getSmallDefaultAvatar(session.getServletContext()));
                } else {
                    return outputAvatar(httpHeaders, getDefaultAvatar(session.getServletContext()));
                }
            } else if (StringUtils.hasText(hash)) {
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
                        File avatar = bo.findByPk(avatarIds.get(0));
                        return outputAvatar(httpHeaders, avatar);
                    }
                }
            } else if (model.get("savedFile") != null) {
                File avatar = (File) model.get("savedFile");
                return outputAvatar(httpHeaders, avatar);
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
        return (File) context.getAttribute(FileBo.DEFAULT_AVATAR_KEY);
    }

    private File getSmallDefaultAvatar(ServletContext context) {
        return (File) context.getAttribute(FileBo.SMALL_DEFAULT_AVATAR_KEY);
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