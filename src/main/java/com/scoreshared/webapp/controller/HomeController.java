package com.scoreshared.webapp.controller;

import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

import com.scoreshared.business.bo.GraphBo;
import com.scoreshared.business.bo.ScoreBo;
import com.scoreshared.business.bo.UserBo;
import com.scoreshared.business.persistence.Comment;
import com.scoreshared.business.persistence.PlayerPermission;
import com.scoreshared.business.persistence.Score;
import com.scoreshared.business.persistence.User;
import com.scoreshared.scaffold.LoggedUser;
import com.scoreshared.webapp.dto.ScoreItemModel;

@Controller
@RequestMapping(value = "/home")
public class HomeController extends BaseController {

    @Inject
    private ScoreBo scoreBo;
    
    @Inject
    private GraphBo graphBo;

    @Inject
    private UserBo userBo;

    @Inject
    private MessageSource messageResource;

    @Inject
    private LocaleResolver localeResolver;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView home(@LoggedUser User loggedUser, HttpServletRequest request) {
        try {
            ModelAndView mav = new ModelAndView();
            mav.addObject("messages", getMessages(loggedUser));

            List<ScoreItemModel> scores = getScores(loggedUser, localeResolver.resolveLocale(request));
            mav.addObject("scores", scores);

            StringWriter jsonPlayers = new StringWriter();
            ObjectMapper mapper = new ObjectMapper();

            loggedUser.setProfile(userBo.markSignupProcessAsCompleted(loggedUser).getProfile());

            if (!scores.isEmpty()) {
                Integer[] winLoss = scoreBo.calculateWinLoss(loggedUser.getId());
                mav.addObject("win", winLoss[0]);
                mav.addObject("loss", winLoss[1]);

                mapper.writeValue(jsonPlayers, listPlayersNameAndId(scores));
                mav.addObject("players", jsonPlayers.toString());

                mav.setViewName("home/home");

            } else {
                List<Object[]> globalScores = scoreBo.findScores(0, false);

                mav.addObject("scores", getScores(globalScores, localeResolver.resolveLocale(request)));

                mapper.writeValue(jsonPlayers, listGlobalPlayersNameAndId(globalScores));
                mav.addObject("players", jsonPlayers.toString());

                mav.setViewName("home/homeNewUser");
            }
            return mav;
        } catch (JsonGenerationException e) {
            throw new RuntimeException(e);
        } catch (JsonMappingException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private List<Object[]> listGlobalPlayersNameAndId(List<Object[]> globalScores) {
        List<Object[]> result = new ArrayList<Object[]>();
        Score score = null;
        for (Object[] item : globalScores) {
            score = (Score) item[0];
            for (PlayerPermission player : score.getAllPlayers()) {
                if (player.isConnected()) {
                    result.add(new Object[] { player.getAssociation().getId(), player.getName() });
                }
            }
        }
        return result;
    }

    private List<Object[]> listPlayersNameAndId(List<ScoreItemModel> scores) {
        List<Object[]> result = new ArrayList<Object[]>();
        Set<Integer> ids = new HashSet<Integer>();
        for (ScoreItemModel score : scores) {
            for (PlayerPermission player : score.getScore().getAllPlayers()) {
                if (player.isConnected() && !ids.contains(player.getAssociation().getId())) {
                    ids.add(player.getAssociation().getId());
                    result.add(new Object[] { player.getAssociation().getId(), player.getName() });
                }
            }
        }
        return result;
    }

    private List<ScoreItemModel> getScores(User loggedUser, Locale locale) {
        List<Object[]> scores = scoreBo.findScores(0, false, loggedUser);

        List<ScoreItemModel> result = new ArrayList<ScoreItemModel>();
        for (Object[] score : scores) {
            result.add(new ScoreItemModel((Score)score[0], (Comment)score[1], loggedUser, messageResource, locale));
        }

        return result;
    }

    private List<Map<String, Object>> getScores(List<Object[]> scores, Locale locale) {
        List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
        Map<String, Object> item = null;
        Score score = null;
        for (Object[] scoreObj : scores) {
            item = new HashMap<String, Object>();
            score = (Score) scoreObj[0];

            item.put("leftPlayerAvatar", score.getSampleLeftPlayer().getAvatar());
            item.put("leftPlayerName", score.getLeftPlayerNames());
            item.put("scoreText", score.getFinalScore());
            item.put("rightPlayerName", score.getRightPlayerNames());
            item.put("rightPlayerAvatar", score.getSampleRightPlayer().getAvatar());

            result.add(item);
        }
        
        return result;
    }

    private List<Map<String, Object>> getMessages(User loggedUser) {
        List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
        Map<String, Object> item = null;

        // get contact requests
        for (Object[] obj : graphBo.findPendingInvitations(loggedUser.getId())) {
            item = new HashMap<String, Object>();
            item.put("senderName", new StringBuilder().append(obj[1]).append(" ").append(obj[2]).toString());
            item.put("senderId", (Integer) obj[3]);
            item.put("type", "CONTACT");
            result.add(item);
        }

        // get pending score approvals
        for (Score score : scoreBo.findPendingScoreApprovals(loggedUser.getId())) {
            item = new HashMap<String, Object>();
            item.put("senderName", score.getOwner().getFullName());
            item.put("scoreText", score.hasWinner(loggedUser.getId()) ? score.getFinalScore(true) : score.getFinalScore(false));
            item.put("scoreId", score.getId());
            item.put("type", "APPROVAL");
            result.add(item);
        }

        // get pending score revisions
        for (Score score : scoreBo.findPendingScoreRevisions(loggedUser.getId())) {
            item = new HashMap<String, Object>();
            for (PlayerPermission playerPermission : score.getAllPlayers()) {
                if (playerPermission.getRevisionMessage() != null) {
                    item.put("senderName", playerPermission.getName());
                    item.put("scoreText",
                            score.hasWinner(loggedUser.getId()) ? score.getFinalScore(true) : score.getFinalScore(false));
                    item.put("scoreId", score.getId());
                    item.put("playerPermissionId", playerPermission.getId());
                    item.put("type", "REVISION");
                    result.add(item);
                }
            }
        }

        // TODO: get pending comments
        return result;
    }
}