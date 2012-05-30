package com.scoreshared.webapp.controller;

import java.security.Principal;

import javax.inject.Inject;
import javax.validation.Valid;

import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.twitter.api.Twitter;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.scoreshared.webapp.dto.WelcomeStep1Form;
import com.scoreshared.webapp.validation.WelcomeStep1FormValidator;

@Controller
@RequestMapping(value = "/welcome")
public class WelcomeController {

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.setValidator(new WelcomeStep1FormValidator());
    }

    @Inject
    private ConnectionRepository connectionRepository;

    @RequestMapping(value = "/step1", method = RequestMethod.GET)
    public ModelAndView getStep1() {
        ModelAndView mav = new ModelAndView("welcome/step1");
        mav.addObject(new WelcomeStep1Form());
        return mav;
    }

    @RequestMapping(value = "/step1", method = RequestMethod.POST)
    public ModelAndView validateAndSaveStep1(Principal currentUser, @Valid WelcomeStep1Form form, BindingResult result) {
        return getStep2();
    }

    @RequestMapping(value = "/step2", method = RequestMethod.GET)
    public ModelAndView getStep2() {
        ModelAndView mav = new ModelAndView("welcome/step2");
        Connection<Twitter> connection = connectionRepository.findPrimaryConnection(Twitter.class);
        if (connection != null) {
            mav.addObject("twitterAccount", connection.fetchUserProfile().getUsername());
            mav.addObject("twitterConnected", true);
        } else {
            mav.addObject("twitterConnected", false);
        }
        return mav;
    }

    @RequestMapping(value = "/step3", method = RequestMethod.GET)
    public String getStep3() {
        return "welcome/step3";
    }
}
