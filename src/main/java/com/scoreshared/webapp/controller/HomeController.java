package com.scoreshared.webapp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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
import com.scoreshared.business.persistence.Player;
import com.scoreshared.business.persistence.PlayerInstance;
import com.scoreshared.business.persistence.Score;
import com.scoreshared.business.persistence.User;
import com.scoreshared.scaffold.ConnectionsHelper;
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
        ModelAndView mav = new ModelAndView();
        mav.addObject("messages", getMessages(loggedUser));

        List<ScoreItemModel> scores = getScores(loggedUser, localeResolver.resolveLocale(request));
        mav.addObject("scores", scores);

        loggedUser.setProfile(userBo.markSignupProcessAsCompleted(loggedUser).getProfile());
        request.getSession().setAttribute(ConnectionsHelper.IS_USER_IN_WELCOME_STEPS, Boolean.FALSE);

        if (!scores.isEmpty()) {
            Integer[] winLoss = scoreBo.calculateWinLoss(loggedUser.getId());
            mav.addObject("win", winLoss[0]);
            mav.addObject("loss", winLoss[1]);

            mav.setViewName("home/home");

        } else {
            mav.addObject("search", new SearchModel());
            mav.addObject("players", listPlayersNameAndIdFromPlayers(userBo
                    .listPlayersNameExceptLoggedUser(loggedUser)));

            mav.setViewName("home/homeNewUser");
        }
        return mav;
    }

    private List<Object[]> listPlayersNameAndIdFromPlayers(List<Player> players) {
        List<Object[]> result = new ArrayList<Object[]>();
        for (Player player : players) {
            result.add(new Object[] { player.getId(), player.getName() });
        }
        return result;
    }

    private List<ScoreItemModel> getScores(User loggedUser, Locale locale) {
        List<Score> scores = scoreBo.findScores(0, null, ScoreOutcomeEnum.ALL, false, loggedUser.getId());

        List<ScoreItemModel> result = new ArrayList<ScoreItemModel>();
        for (Score score : scores) {
            result.add(new ScoreItemModel(score, score.getComment(), loggedUser, messageResource, locale));
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
            for (PlayerInstance playerInstance : score.getAllPlayers()) {
                if (playerInstance.getRevisionMessage() != null) {
                    item.put("senderName", playerInstance.getName());
                    item.put("scoreText",
                            score.hasWinner(loggedUser.getId()) ? score.getFinalScore(true) : score.getFinalScore(false));
                    item.put("scoreId", score.getId());
                    item.put("playerInstanceId", playerInstance.getId());
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