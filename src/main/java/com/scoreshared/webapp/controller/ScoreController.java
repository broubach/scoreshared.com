package com.scoreshared.webapp.controller;

import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.context.MessageSource;
import org.springframework.core.convert.ConversionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
import com.scoreshared.webapp.dto.ScoreModel;
import com.scoreshared.webapp.dto.SearchModel;

@Controller
@RequestMapping(value = "/score")
public class ScoreController extends BaseController {

    @Inject
    private ConversionService conversionService;

    @Inject
    private ScoreBo scoreBo;

    @Inject
    private UserBo userBo;

    @Inject
    private MessageSource messageResource;

    @Inject
    private LocaleResolver localeResolver;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView show(@LoggedUser User loggedUser) {
        try {
            ModelAndView mav = new ModelAndView("score");
            mav.addObject("score", new ScoreModel());
            mav.addObject("search", new SearchModel());

            StringWriter playersList = new StringWriter();
            ObjectMapper mapper = new ObjectMapper();
            mapper.writeValue(playersList, scoreBo.listPlayersName(loggedUser));
            mav.addObject("playersList", playersList.toString());
            return mav;
        } catch (JsonGenerationException e) {
            throw new RuntimeException(e);
        } catch (JsonMappingException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @RequestMapping(method = RequestMethod.POST)
    public String save(@LoggedUser User loggedUser, @ModelAttribute ScoreModel scoreModel) {
        Score score = conversionService.convert(scoreModel, Score.class);
        Comment comment = conversionService.convert(scoreModel, Comment.class);
        scoreBo.save(loggedUser, score, comment);

        return "home";
    }

    @RequestMapping(value = "/newUser", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> postNewUser(@LoggedUser User loggedUser,
            @ModelAttribute(value = "player") String player, HttpServletRequest request) {
        Map<String, String> result = new HashMap<String, String>();
        if (scoreBo.userHas(loggedUser, player)) {
            result.put("proceedWithConfirmation", "false");
        } else {
            result.put("proceedWithConfirmation", "true");
            result.put("title", messageResource.getMessage("label.associate_to_anyone_registered",
                    new String[] { player }, localeResolver.resolveLocale(request)));
        }
        return result;
    }

    @RequestMapping(value = "/searchNewUser", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> searchNewUser(@ModelAttribute SearchModel search, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("playerFound", Boolean.FALSE);
        if (!search.getEmail().isEmpty()) {

            User user = userBo.findUserByEmailFetchProfile(search.getEmail());

            if (user != null) {
                result.put("playerFound", Boolean.TRUE);
                result.put("playerName", user.getFullName());
                result.put("playerLocation", user.getProfile().getLocation());
                result.put("playerAvatarUrl", user.getProfile().getAvatarHash());
                result.put("requestMessage", messageResource.getMessage("label.association_request",
                        new Object[] { user.getFirstName() }, localeResolver.resolveLocale(request)));
            }

        } else {
            // search by other fields
        }

        if (search.getEmail().isEmpty()) {
            // not found
            result.put("playerName", "Felipe Freitas");
            result.put("invitationMessage",
                    "Olá Felipe! Quero compartilhar meus resultados com você! Junte-se a mim no ScoreShared!");
        }
        return result;
    }

    @RequestMapping(value = "/newFriendRequest", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> postFriendRequest(@ModelAttribute(value = "message") String friendRequestMessage) {
        Map<String, String> result = new HashMap<String, String>();
        return result;
    }

    @RequestMapping(value = "/newInvitation", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> postInvitation(@ModelAttribute(value = "message") String invitationMessage) {
        Map<String, String> result = new HashMap<String, String>();
        return result;
    }
}