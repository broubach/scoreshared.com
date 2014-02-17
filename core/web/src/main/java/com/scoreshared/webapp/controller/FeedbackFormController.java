package com.scoreshared.webapp.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scoreshared.business.bo.FeedbackBo;
import com.scoreshared.business.persistence.User;
import com.scoreshared.scaffold.LoggedUser;

@Controller
public class FeedbackFormController extends BaseController {

    @Inject
    private FeedbackBo bo;

    @RequestMapping(value = "/feedbackForm", method = RequestMethod.POST)
    @ResponseBody
    public void sendFeedback(@LoggedUser User loggedUser, @ModelAttribute("message") String message) {
        bo.sendFeedback(loggedUser, message);
    }
}
