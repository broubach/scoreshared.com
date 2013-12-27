package com.scoreshared.webapp.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import com.scoreshared.business.persistence.User;
import com.scoreshared.scaffold.AvatarHelper;
import com.scoreshared.scaffold.LoggedUser;
import com.scoreshared.webapp.dto.ProfileAvatarForm;

@Controller
public class ProfileAvatarController {

    @Inject
    private AvatarHelper avatarHelper;

    @RequestMapping(value = "/profile/avatar", method = RequestMethod.GET)
    public String getProfileAvatar(ModelMap modelMap, @LoggedUser User loggedUser, HttpSession session, SessionStatus status) {
        avatarHelper.updateAvatarInSession(session);
        avatarHelper.getProfileAvatar(modelMap, loggedUser, session, status);

        return "profile/avatar";
    }

    @RequestMapping(value = "/profile/avatar", method = RequestMethod.POST)
    public String postProfileAvatar(ModelMap modelMap, @ModelAttribute ProfileAvatarForm profileAvatarForm, @LoggedUser User loggedUser,
            HttpServletRequest request, SessionStatus status) {
        boolean avatarJustUploaded = false;
        if (Boolean.TRUE.equals(profileAvatarForm.getAvatarUploaded())) {
            avatarJustUploaded = true;
        }
        avatarHelper.postProfileAvatar(profileAvatarForm, loggedUser, request.getSession(), status);
        if (!avatarJustUploaded) {
            avatarHelper.updateAvatarInSession(request.getSession());
        }

        request.setAttribute("avatarJustUploaded", avatarJustUploaded);

        return "profile/avatar";
    }
}