package com.scoreshared.webapp.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

import com.scoreshared.business.bo.ScoreBo;
import com.scoreshared.domain.entity.Score;
import com.scoreshared.domain.entity.User;
import com.scoreshared.scaffold.LoggedUser;
import com.scoreshared.scaffold.NotificationStatsHelper;
import com.scoreshared.webapp.dto.ScoreConverter;
import com.scoreshared.webapp.dto.ScoreItemModel;
import com.scoreshared.webapp.dto.ScoreModelConverter;

@Controller
public class PendingScoreApprovalsController extends BaseController {

    @Inject
    private ScoreBo scoreBo;
    
    @Inject
    private NotificationStatsHelper notificationStatsHelper;

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
    public void acceptScore(@LoggedUser User loggedUser, @ModelAttribute("scoreId") Integer scoreId, HttpServletRequest request) {
        scoreBo.acceptScore(loggedUser.getId(), scoreId);

        notificationStatsHelper.updateNotificationStats(request);
    }

    @RequestMapping(value = "/ignore/score/", method = RequestMethod.POST)
    @ResponseStatus(value=HttpStatus.OK)
    public void ignoreScore(@LoggedUser User loggedUser, @ModelAttribute("scoreId") Integer scoreId, HttpServletRequest request) {
        scoreBo.ignoreScore(loggedUser.getId(), scoreId);

        notificationStatsHelper.updateNotificationStats(request);
    }

    @RequestMapping(value = "/review/score/", method = RequestMethod.GET)
    @ResponseStatus(value=HttpStatus.OK)
    @ResponseBody
    public Map<String, Object> getScoreForRevision(@LoggedUser User loggedUser,
            @ModelAttribute("scoreId") Integer scoreId, HttpServletRequest request) {
        ScoreModelConverter fromEntityConverter = new ScoreModelConverter();
        fromEntityConverter.setLocaleResolver(localeResolver);
        fromEntityConverter.setMessageResource(messageResource);
        fromEntityConverter.setRequest(request);
        
        Map<String, Object> result = new HashMap<String, Object>();
        Score score = scoreBo.findById(scoreId);
        result.put("scoreId", scoreId);
        result.put("playersLeft", score.getLeftPlayerNames());
        result.put("playersRight", score.getRightPlayerNames());
        result.put("sets", score.getFinalScore());
        try {
            result.put("date", fromEntityConverter.getDate(score.getDate()));
            if (score.getTime() != null) {
                result.put("time", fromEntityConverter.getTime(score.getTime()));
            } else {
                result.put("time", "");
            }
        } catch (ParseException e) {
            // there will never be an exception here, but I rethrow it anyways
            throw new RuntimeException(e);
        }
        return result;
    }

    @RequestMapping(value = "/review/score/", method = RequestMethod.POST)
    @ResponseStatus(value=HttpStatus.OK)
    @ResponseBody
    public Map<String, Object> postScoreRevision(@LoggedUser User loggedUser, @ModelAttribute("scoreId") Integer scoreId,
            @ModelAttribute("date") String dateAsText, @ModelAttribute("time") String timeAsText,
            @ModelAttribute("sets") String setsStr, @ModelAttribute("message") String message,
            HttpServletRequest request) {
        ScoreConverter toEntityConverter = new ScoreConverter();
        toEntityConverter.setLocaleResolver(localeResolver);
        toEntityConverter.setMessageResource(messageResource);
        toEntityConverter.setRequest(request);

        Map<String, Object> result = new HashMap<String, Object>();
        Date date = null;
        Date time = null;
        try {
            date = toEntityConverter.getDate(dateAsText);
            if (!StringUtils.isEmpty(timeAsText)) {
                time = toEntityConverter.getTime(timeAsText);
            }
        } catch (ParseException e) {
            result.put("errorMessage", messageResource.getMessage(
                    "error.date_and_time_should_follow_dd_mm_yyyy_and_hh_mm_patterns_respectively", null,
                    localeResolver.resolveLocale(request)));
        }

        try {
            Integer[][] sets = toEntityConverter.getSets(setsStr);
            scoreBo.reviewScore(loggedUser.getId(), scoreId, date, time, message, sets[0][0], sets[0][1], sets[1][0],
                    sets[1][1], sets[2][0], sets[2][1], sets[3][0], sets[3][1], sets[4][0], sets[4][1]);

            notificationStatsHelper.updateNotificationStats(request);
        } catch (ParseException e) {
            if (result.get("errorMessage") == null) {
                result.put("errorMessage", messageResource.getMessage(
                        "error.sets_pattern_do_not_match_for_example_use_6x4_6x3", null,
                        localeResolver.resolveLocale(request)));
            } else {
                result.put(
                        "errorMessage",
                        new Object[] {
                                result.get("errorMessage"),
                                messageResource.getMessage("error.sets_pattern_do_not_match_for_example_use_6x4_6x3",
                                        null, localeResolver.resolveLocale(request)) });
            }
        }
        return result;
    }
}