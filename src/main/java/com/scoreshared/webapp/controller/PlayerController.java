package com.scoreshared.webapp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.MessageSource;
import org.springframework.core.convert.ConversionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

import com.scoreshared.business.bo.ScoreBo;
import com.scoreshared.business.bo.UserBo;
import com.scoreshared.business.persistence.Comment;
import com.scoreshared.business.persistence.Score;
import com.scoreshared.business.persistence.User;
import com.scoreshared.scaffold.LoggedUser;
import com.scoreshared.webapp.dto.PlayerModel;
import com.scoreshared.webapp.dto.ScoreItemModel;

@Controller
@RequestMapping("/player")
public class PlayerController extends BaseController {

    @Inject
    private ConversionService conversionService;

    @Inject
    private UserBo userBo;

    @Inject
    private ScoreBo scoreBo;

    @Inject
    private MessageSource messageResource;

    @Inject
    private LocaleResolver localeResolver;

    @RequestMapping(value = "{userId}", method = RequestMethod.GET)
    public ModelAndView show(@LoggedUser User loggedUser, HttpServletRequest request, @PathVariable Integer userId) {
        ModelAndView mav = new ModelAndView("player");
        User user = userBo.findByPk(userId);
        boolean isConnected = userBo.hasConnection(loggedUser.getId(), user.getId());
        mav.addObject("player", new PlayerModel(user, isConnected, messageResource, localeResolver.resolveLocale(request)));

        List<Object[]> scores = scoreBo.findScores(null, false, user);
        List<ScoreItemModel> items = new ArrayList<ScoreItemModel>();
        for (Object[] score : scores) {
            items.add(new ScoreItemModel((Score)score[0], (Comment)score[1], user, messageResource, localeResolver.resolveLocale(request)));
        }
        mav.addObject("scores", items);

        Integer[] winLoss = scoreBo.calculateWinLoss(userId);
        mav.addObject("win", winLoss[0]);
        mav.addObject("loss", winLoss[1]);

        return mav;
    }

    @ResponseBody
    @RequestMapping(value ="/remove/{userToRemoveId}", method = RequestMethod.DELETE)
    public Boolean remove(@LoggedUser User loggedUser, @PathVariable Integer userToRemoveId) {
        userBo.removeConnection(loggedUser.getId(), userToRemoveId);
        return Boolean.TRUE;
    }

    @ResponseBody
    @RequestMapping(value ="/userInfo/{userToAddId}", method = RequestMethod.GET)
    public Map<String, Object> getUserInfo(@LoggedUser User loggedUser, @PathVariable Integer userToAddId, HttpServletRequest request) {
        User user = userBo.findByPk(userToAddId);
        Map<String, Object> result = new HashMap<String, Object>();
        List<Object[]> playerListContent = new ArrayList<Object[]>();
        playerListContent.add(conversionService.convert(user, Object[].class));
        result.put("playerList", playerListContent);
        result.put("playerNameInScore", playerListContent.get(0)[2]);
        result.put("invitationMessage", messageResource.getMessage("label.association_request",
                new Object[] { playerListContent.get(0)[2] }, localeResolver.resolveLocale(request)));
        return result;
    }

    @ResponseBody
    @RequestMapping(value ="/connect", method = RequestMethod.POST)
    public Boolean connect(@LoggedUser User loggedUser, HttpServletRequest request,
            @ModelAttribute("playerName") String playerName, @ModelAttribute("email") String invitationMail,
            @ModelAttribute("message") String invitationMessage) {
        userBo.inviteUser(loggedUser, playerName, invitationMail, invitationMessage, localeResolver.resolveLocale(request));
        return true;
    }
}