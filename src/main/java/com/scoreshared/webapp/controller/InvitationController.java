package com.scoreshared.webapp.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scoreshared.business.bo.UserBo;
import com.scoreshared.business.persistence.User;
import com.scoreshared.scaffold.LoggedUser;

@Controller
public class InvitationController extends BaseController {

    @Inject
    private UserBo bo;

    @ResponseBody
    @RequestMapping(value = "/invitation/accept/{invitationHash}", method = RequestMethod.GET)
    public String acceptInvitation(@LoggedUser User loggedUser, @PathVariable String invitationHash) {
        bo.acceptInvitation(loggedUser, invitationHash);
        return "ok";
    }

    @ResponseBody
    @RequestMapping(value = "/invitation/ignore/{invitationHash}", method = RequestMethod.GET)
    public String ignoreInvitation(@LoggedUser User loggedUser, @PathVariable String invitationHash) {
        bo.ignoreInvitation(loggedUser, invitationHash);
        return "ok";
    }
}
