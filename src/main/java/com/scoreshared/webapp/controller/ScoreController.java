package com.scoreshared.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.scoreshared.webapp.view.dto.ScoreModel;
import com.scoreshared.webapp.view.dto.StepModel;

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
    @ResponseBody
    public StepModel save(@ModelAttribute ScoreModel score) {
        // validate model
        // persist model
        // check if users already exist
        StepModel model = new StepModel();
        model.setName("confirmation");
        model.setSubject("Felipe Freitas");
        model.setMessage("Associar {0} à alguém cadastrado?");
        return model;
    }
}