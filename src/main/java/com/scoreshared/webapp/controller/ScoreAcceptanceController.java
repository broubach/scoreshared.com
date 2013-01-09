package com.scoreshared.webapp.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scoreshared.business.bo.ScoreBo;
import com.scoreshared.business.persistence.User;
import com.scoreshared.scaffold.LoggedUser;

@Controller
public class ScoreAcceptanceController extends BaseController {
    
    @Inject
    private ScoreBo bo;

    @ResponseBody
    @RequestMapping(value = "/accept/score/", method = RequestMethod.POST)
    public String acceptScore(@LoggedUser User loggedUser, @ModelAttribute("scoreId") Integer scoreId) {
        bo.acceptScore(scoreId);
        return "ok";
    }

    @ResponseBody
    @RequestMapping(value = "/ignore/score/", method = RequestMethod.POST)
    public String ignoreScore(@LoggedUser User loggedUser, @ModelAttribute("scoreId") Integer scoreId) {
        bo.ignoreScore(scoreId);
        return "ok";
    }

    @ResponseBody
    @RequestMapping(value = "/review/score/", method = RequestMethod.POST)
    public String reviewScore(@LoggedUser User loggedUser, @ModelAttribute("scoreId") Integer scoreId, @ModelAttribute("message") String message) {
        bo.reviewScore(scoreId, message);
        return "ok";
    }
}
