package com.scoreshared.webapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

import com.scoreshared.business.bo.ScoreBo;
import com.scoreshared.business.persistence.Score;
import com.scoreshared.business.persistence.User;
import com.scoreshared.scaffold.LoggedUser;
import com.scoreshared.webapp.dto.ScoreItemModel;

@Controller
public class PendingScoreApprovalsController extends BaseController {

    @Inject
    private ScoreBo scoreBo;
    
    @Inject
    private MessageSource messageResource;

    @Inject
    private LocaleResolver localeResolver;

    @RequestMapping(value = "/notifications/pendingScoreApprovals", method = RequestMethod.GET)
    public ModelAndView list(@LoggedUser User loggedUser, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("notifications/pending-score-approvals");
        List<Score> scores = scoreBo.findPendingScoreApprovals(loggedUser.getId());
        List<ScoreItemModel> scoreModels = new ArrayList<ScoreItemModel>();
        for (Score score : scores) {
            scoreModels.add(new ScoreItemModel(score, null, loggedUser, messageResource, localeResolver.resolveLocale(request)));
        }
        mav.addObject("pendingScores", scoreModels);

        return mav;
    }

    @RequestMapping(value = "/accept/score/", method = RequestMethod.POST)
    @ResponseStatus(value=HttpStatus.OK)
    public void acceptScore(@LoggedUser User loggedUser, @ModelAttribute("scoreId") Integer scoreId) {
        scoreBo.acceptScore(loggedUser.getId(), scoreId);
    }

    @RequestMapping(value = "/ignore/score/", method = RequestMethod.POST)
    @ResponseStatus(value=HttpStatus.OK)
    public void ignoreScore(@LoggedUser User loggedUser, @ModelAttribute("scoreId") Integer scoreId) {
        scoreBo.ignoreScore(loggedUser.getId(), scoreId);
    }

    @RequestMapping(value = "/review/score/", method = RequestMethod.POST)
    @ResponseStatus(value=HttpStatus.OK)
    public void reviewScore(@LoggedUser User loggedUser, @ModelAttribute("scoreId") Integer scoreId, @ModelAttribute("message") String message) {
        scoreBo.reviewScore(loggedUser.getId(), scoreId, message);
    }
}
