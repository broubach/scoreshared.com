package com.scoreshared.webapp.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scoreshared.business.bo.GraphBo;
import com.scoreshared.business.persistence.User;
import com.scoreshared.scaffold.LoggedUser;

@Controller
public class InvitationController extends BaseController {

    @Inject
    private GraphBo bo;

    @ResponseBody
    @RequestMapping(value = "/accept/invitation/", method = RequestMethod.POST)
    public String acceptInvitation(@LoggedUser User loggedUser, @ModelAttribute("user2Id") Integer user2Id) {
        bo.acceptRegisteredUserInvitation(loggedUser, user2Id);
        return "ok";
    }

    @ResponseBody
    @RequestMapping(value = "/ignore/invitation/", method = RequestMethod.POST)
    public String ignoreInvitation(@LoggedUser User loggedUser, @ModelAttribute("user2Id") Integer user2Id) {
        bo.ignoreRegisteredUserInvitation(loggedUser, user2Id);
        return "ok";
    }
}
