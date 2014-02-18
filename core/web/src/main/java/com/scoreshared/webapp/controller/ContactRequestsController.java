package com.scoreshared.webapp.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.scoreshared.business.bo.GraphBo;
import com.scoreshared.domain.entity.Profile;
import com.scoreshared.domain.entity.User;
import com.scoreshared.scaffold.LoggedUser;
import com.scoreshared.scaffold.NotificationStatsHelper;

@Controller
public class ContactRequestsController extends BaseController {

    @Inject
    private GraphBo graphBo;
    
    @Inject
    private NotificationStatsHelper notificationStatsHelper;

    @RequestMapping(value = "/notifications/contactRequests", method = RequestMethod.GET)
    public ModelAndView list(@LoggedUser User loggedUser) {
        ModelAndView mav = new ModelAndView("notifications/contact-requests");
        List<Object[]> pendingInvitations = graphBo.findPendingInvitations(loggedUser.getId());
        for (Object[] pendingInvitation : pendingInvitations) {
            if (pendingInvitation[0] != null) {
                pendingInvitation[0] = ((Profile) pendingInvitation[0]).getAvatarHash();
            } else {
                pendingInvitation[0] = "default";
            }
        }

        mav.addObject("contacts", pendingInvitations);
        return mav;
    }

    @RequestMapping(value = "/accept/invitation/", method = RequestMethod.POST)
    @ResponseStatus(value = HttpStatus.OK)
    public void acceptInvitation(@LoggedUser User loggedUser, @ModelAttribute("user2Id") Integer user2Id, HttpServletRequest request) {
        graphBo.acceptRegisteredUserInvitation(loggedUser, user2Id);

        notificationStatsHelper.updateNotificationStats(request);
    }

    @RequestMapping(value = "/ignore/invitation/", method = RequestMethod.POST)
    @ResponseStatus(value = HttpStatus.OK)
    public void ignoreInvitation(@LoggedUser User loggedUser, @ModelAttribute("user2Id") Integer user2Id, HttpServletRequest request) {
        graphBo.ignoreRegisteredUserInvitation(loggedUser, user2Id);

        notificationStatsHelper.updateNotificationStats(request);
    }
}