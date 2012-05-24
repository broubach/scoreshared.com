package com.scoreshared.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.scoreshared.webapp.view.dto.WelcomeStep1Form;

@Controller
@RequestMapping(value = "/welcome")
public class WelcomeController {

    @RequestMapping(value = "/step1", method = RequestMethod.GET)
    public ModelAndView getStep1() {
        ModelAndView mav = new ModelAndView("welcome/step1");
        mav.addObject(new WelcomeStep1Form());
        return mav;
    }

    @RequestMapping(value = "/step1", method = RequestMethod.POST)
    public ModelAndView validateAndSaveStep1(@ModelAttribute WelcomeStep1Form form) {
        ModelAndView mav = new ModelAndView("welcome/step2");
        return mav;
    }
}
