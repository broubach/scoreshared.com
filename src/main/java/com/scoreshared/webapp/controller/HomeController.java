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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

import com.scoreshared.business.bo.GraphBo;
import com.scoreshared.business.bo.ScoreBo;
import com.scoreshared.business.bo.UserBo;
import com.scoreshared.business.persistence.Comment;
import com.scoreshared.business.persistence.Player;
import com.scoreshared.business.persistence.PlayerPermission;
import com.scoreshared.business.persistence.Score;
import com.scoreshared.business.persistence.User;
import com.scoreshared.scaffold.LoggedUser;
import com.scoreshared.webapp.dto.ScoreItemModel;
import com.scoreshared.webapp.dto.SearchModel;

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

                mapper.writeValue(jsonPlayers, listPlayersNameAndIdFromScoreItemModel(scores));
                mav.addObject("players", jsonPlayers.toString());

                mav.setViewName("home/home");

            } else {
                mav.addObject("search", new SearchModel());
                mav.addObject("players", listPlayersNameAndIdFromPlayers(userBo
                        .listPlayersNameExceptLoggedUser(loggedUser)));

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

    private List<Object[]> listPlayersNameAndIdFromPlayers(List<Player> players) {
        List<Object[]> result = new ArrayList<Object[]>();
        for (Player player : players) {
            result.add(new Object[] { player.getId(), player.getName() });
        }
        return result;
    }

    private List<Object[]> listPlayersNameAndIdFromScoreItemModel(List<ScoreItemModel> scores) {
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

        return result;
    }

    @RequestMapping(value= "/player", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> createPlayer(@ModelAttribute("playerName") String playerName, @LoggedUser User loggedUser, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<String, Object>();
        Integer id = userBo.createPlayer(loggedUser, playerName);
        result.put("playerId", id);
        result.put("playerName", playerName);
        return result;
    }

    @RequestMapping(value= "/buildDataWithI18n", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> buildDataWithI18n(@ModelAttribute("playerName") String playerName, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("proceedWithConfirmation", "true");
        result.put("title", messageResource.getMessage("label.invite_to_your_contacts",
                new String[] { playerName }, localeResolver.resolveLocale(request)));
        return result;
    }
}