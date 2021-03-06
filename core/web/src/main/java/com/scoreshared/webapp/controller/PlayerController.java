package com.scoreshared.webapp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.tuple.Pair;
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

import com.scoreshared.business.bo.GraphBo;
import com.scoreshared.business.bo.ScoreBo;
import com.scoreshared.business.bo.UserBo;
import com.scoreshared.domain.entity.Player;
import com.scoreshared.domain.entity.Score;
import com.scoreshared.domain.entity.User;
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
    private GraphBo graphBo;

    @Inject
    private MessageSource messageResource;

    @Inject
    private LocaleResolver localeResolver;

    @RequestMapping(value = "{userId}", method = RequestMethod.GET)
    public ModelAndView show(@LoggedUser User loggedUser, HttpServletRequest request, @PathVariable Integer userId) {
        ModelAndView mav = new ModelAndView("player/player");

        User user = userBo.findByPk(userId);
        Player associatedPlayer = graphBo.findPlayerByAssociationAndOwner(user.getId(), loggedUser.getId());
        mav.addObject("player", new PlayerModel(user, associatedPlayer, messageResource, localeResolver.resolveLocale(request)));

        Pair<List<Score>, Integer> scoresAndCount = scoreBo.findScores(0, null, ScoreOutcomeEnum.ALL, false, user.getId());
        List<ScoreItemModel> items = new ArrayList<ScoreItemModel>();
        for (Score score : scoresAndCount.getLeft()) {
            items.add(new ScoreItemModel(score, score.getComment(), user, messageResource, localeResolver.resolveLocale(request)));
        }
        mav.addObject("scores", items);

        Integer[] winLossTiesAndPractices = scoreBo.countWinLossTiesAndPractices(null, userId);
        mav.addObject("win", winLossTiesAndPractices[0]);
        mav.addObject("loss", winLossTiesAndPractices[1]);
        mav.addObject("tie", winLossTiesAndPractices[2]);
        mav.addObject("practice", winLossTiesAndPractices[3]);

        return mav;
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
    @RequestMapping(value ="/connect/", method = RequestMethod.POST)
    public Boolean connect(@LoggedUser User loggedUser, HttpServletRequest request,
            @ModelAttribute("playerId") String playerId, @ModelAttribute("userId") Integer userId,
            @ModelAttribute("message") String invitationMessage) {
        graphBo.inviteRegisteredUser(loggedUser, userId, StringUtils.isEmpty(playerId) ? null : Integer.valueOf(playerId),
                invitationMessage, localeResolver.resolveLocale(request));
        return true;
    }
}