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
import com.scoreshared.business.persistence.PlayerInstance;
import com.scoreshared.business.persistence.Score;
import com.scoreshared.business.persistence.User;
import com.scoreshared.scaffold.LoggedUser;
import com.scoreshared.webapp.dto.ScoreItemWithPlayerInstanceModel;

@Controller
public class PendingScoreRevisionsController extends BaseController {

    @Inject
    private ScoreBo scoreBo;
 
    @Inject
    private MessageSource messageResource;

    @Inject
    private LocaleResolver localeResolver;

    @RequestMapping(value = "/notifications/pendingScoreRevisions", method = RequestMethod.GET)
    public ModelAndView list(@LoggedUser User loggedUser, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("notifications/pending-score-revisions");
        List<Score> scores = scoreBo.findPendingScoreRevisions(loggedUser.getId());
        List<ScoreItemWithPlayerInstanceModel> scoreModels = new ArrayList<ScoreItemWithPlayerInstanceModel>();
        for (Score score : scores) {
            for (PlayerInstance playerInstance : score.getAllPlayers()) {
                if (playerInstance.getRevisionMessage() != null) {
                    scoreModels.add(new ScoreItemWithPlayerInstanceModel(score, null, loggedUser, messageResource, localeResolver.resolveLocale(request), playerInstance));
                }
            }
        }
        mav.addObject("pendingRevisions", scoreModels);

        return mav;
    }

    @RequestMapping(value = "/review/revision", method = RequestMethod.POST)
    public String reviewRevision(@ModelAttribute("scoreId") Integer scoreId) {
        scoreBo.reviewRevision(scoreId);

        return "redirect:/app/score/" + scoreId;
    }

    @RequestMapping(value = "/ignore/revision", method = RequestMethod.POST)
    @ResponseStatus(value=HttpStatus.OK)
    public void ignoreRevision(@ModelAttribute("playerInstanceId") Integer playerInstanceId) {
        scoreBo.ignoreRevision(playerInstanceId);
    }
}
