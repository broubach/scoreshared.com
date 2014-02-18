package com.scoreshared.scaffold;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.scoreshared.business.bo.UserBo;
import com.scoreshared.domain.entity.File;
import com.scoreshared.domain.entity.User;
import com.scoreshared.webapp.dto.ProfileAvatarForm;

@Component
public class AvatarHelper {

    @Inject
    private UserBo bo;

    @Inject
    private ConnectionRepository connectionRepository;

    public void updateAvatarInSession(HttpSession session) {
        String hash = (String) session.getAttribute(UserLoggedListener.LOGGED_USER_AVATAR_HASH);
        if (!hash.equals("default")) {
            List<File> avatars = bo.findAvatarByHash(hash);
            if (!avatars.isEmpty()) {
                saveAvatar(session, avatars.get(0));
            }
        }
    }

    public void getProfileAvatar(ModelMap modelMap, @LoggedUser User loggedUser, HttpSession session, SessionStatus status) {
        ProfileAvatarForm step3Form = new ProfileAvatarForm();
        if (!modelMap.containsAttribute("profileAvatarForm")) {
            modelMap.addAttribute(step3Form);
        }

        Connection<Facebook> facebookConnection = connectionRepository.findPrimaryConnection(Facebook.class);
        if (facebookConnection != null && loggedUser.getProfile() != null
                && StringUtils.isEmpty(loggedUser.getProfile().getAvatarHash())) {
            try {
                MultipartFile multipartFile = new CustomMultipartFile(facebookConnection.getImageUrl());
                step3Form.setFile(multipartFile);
                step3Form.setAvatarUploaded(Boolean.TRUE);
                postProfileAvatar(step3Form, loggedUser, session, status);

            } catch (MalformedURLException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public void postProfileAvatar(@ModelAttribute ProfileAvatarForm step3Form, @LoggedUser User loggedUser,
            HttpSession session, SessionStatus status) {
        try {
            if (Boolean.TRUE.equals(step3Form.getAvatarUploaded())) {
                createFileAndSaveAvatar(loggedUser, session, step3Form.getFile());
                step3Form.setAvatarUploaded(Boolean.FALSE);
                return;
            }
            if (getSavedAvatar(session) != null) {
                bo.cropResizeAndSaveAvatars(loggedUser, getSavedAvatar(session), step3Form.getX().intValue(), step3Form
                        .getY().intValue(), step3Form.getX2().intValue(), step3Form.getY2().intValue());
                session.setAttribute(UserLoggedListener.LOGGED_USER_AVATAR_HASH, loggedUser.getProfile().getAvatarHash());
            }

            status.setComplete();

            cleanSavedAvatar(session);
        } catch (IOException e) {
            throw new RuntimeException();
        }
    }

    private File createFileAndSaveAvatar(User loggedUser, HttpSession session, MultipartFile avatar) throws IOException {
        File file = new File();
        file.setDate(new Date());
        if (avatar.getOriginalFilename().length() > 45) {
            file.setName(avatar.getOriginalFilename().substring(avatar.getOriginalFilename().length() - 45,
                    avatar.getOriginalFilename().length()));
        } else {
            file.setName(avatar.getOriginalFilename());
        }
        file.setSize(avatar.getSize());
        file.setData(avatar.getBytes());
        file.setOwner(loggedUser);

        saveAvatar(session, file);

        return file;
    }

    private void saveAvatar(HttpSession session, File file) {
        session.setAttribute("savedFile", file);
    }

    private File getSavedAvatar(HttpSession session) {
        return (File) session.getAttribute("savedFile");
    }

    private void cleanSavedAvatar(HttpSession session) {
        session.removeAttribute("savedFile");
    }
}
