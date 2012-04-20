package com.scoreshared.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/home")
public class HomeController {

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView home() {
        ModelAndView mav = new ModelAndView("homeNewUser");
        mav.addObject("userFirstName", "Bernardo");
        return mav;
    }
}