package com.scoreshared.webapp.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.scoreshared.business.persistence.User;
import com.scoreshared.scaffold.ConnectionsHelper;
import com.scoreshared.scaffold.LoggedUser;

@Controller
@SessionAttributes({ "profileAvatarForm" })
public class ProfileSocialConnectionsController {

    @Inject
    private ConnectionsHelper connectionsHelper;

    @RequestMapping(value = "/profile/social-networks", method = RequestMethod.GET)
    public String getProfileAvatar(ModelMap modelMap, @LoggedUser User loggedUser, HttpSession session, SessionStatus status) {
        connectionsHelper.populateModelMapWithConnections(modelMap);

        return "/profile/social-networks";
    }
}