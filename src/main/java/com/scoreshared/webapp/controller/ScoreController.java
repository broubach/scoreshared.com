package com.scoreshared.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/score")
public class ScoreController {

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView show() {
        return new ModelAndView("score");
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView save() {
        return new ModelAndView("score");
    }
}