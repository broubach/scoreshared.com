package com.scoreshared.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.scoreshared.webapp.view.dto.ScoreModel;

@Controller
@RequestMapping(value = "/score")
public class ScoreController {

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView show() {
        ModelAndView mav = new ModelAndView("score");
        mav.addObject("score", new ScoreModel());
        return mav;
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView save(@ModelAttribute ScoreModel score) {
        ModelAndView mav = new ModelAndView("score");
        mav.addObject("score", score);
        return mav;
    }
}