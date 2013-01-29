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
import com.scoreshared.business.persistence.PlayerPermission;
import com.scoreshared.business.persistence.Score;
import com.scoreshared.business.persistence.User;
import com.scoreshared.scaffold.LoggedUser;
import com.scoreshared.webapp.dto.ScoreItemWithPlayerPermissionModel;

@Controller
public class PendingScoreRevisionsController extends BaseController {

    @Inject
    private ScoreBo scoreBo;
 
    @Inject
    private MessageSource messageResource;

    @Inject
    private LocaleResolver localeResolver;

    @RequestMapping(value = "/messages/pendingScoreRevisions", method = RequestMethod.GET)
    public ModelAndView list(@LoggedUser User loggedUser, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("messages/pendingScoreRevisions");
        List<Score> scores = scoreBo.findPendingScoreRevisions(loggedUser.getId());
        List<ScoreItemWithPlayerPermissionModel> scoreModels = new ArrayList<ScoreItemWithPlayerPermissionModel>();
        for (Score score : scores) {
            for (PlayerPermission playerPermission : score.getAllPlayers()) {
                if (playerPermission.getRevisionMessage() != null) {
                    scoreModels.add(new ScoreItemWithPlayerPermissionModel(score, null, loggedUser, messageResource, localeResolver.resolveLocale(request), playerPermission));
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
    public void ignoreRevision(@ModelAttribute("playerPermissionId") Integer playerPermissionId) {
        scoreBo.ignoreRevision(playerPermissionId);
    }
}
