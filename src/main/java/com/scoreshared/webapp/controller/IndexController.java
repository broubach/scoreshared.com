package com.scoreshared.webapp.controller;

import java.util.Calendar;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.scoreshared.business.bo.UserBo;

@Controller
public class IndexController {

    @Inject
    private UserBo userBo;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView("index");
        mav.addObject("thisYear", Calendar.getInstance().get(Calendar.YEAR));
        return mav;
    }

    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public ModelAndView signup() {
        ModelAndView mav = new ModelAndView("index");
        mav.addObject("thisYear", Calendar.getInstance().get(Calendar.YEAR));
        return mav;
    }

}
