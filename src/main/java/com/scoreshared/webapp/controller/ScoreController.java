package com.scoreshared.webapp.controller;

import java.io.IOException;
import java.io.StringWriter;
import java.text.MessageFormat;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.core.convert.ConversionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.scoreshared.business.bo.ScoreBo;
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
    public ModelAndView save(@LoggedUser User loggedUser, @ModelAttribute ScoreModel scoreModel) {
        // TODO: validate model
        Score score = conversionService.convert(scoreModel, Score.class);
        Comment comment = conversionService.convert(scoreModel, Comment.class);
        scoreBo.save(loggedUser, score, comment);

        ModelAndView mav = new ModelAndView("score");
        mav.addObject("score", scoreModel);
        mav.addObject("search", new SearchModel());

        return mav;
    }

    @RequestMapping(value = "/newUser", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> postNewUser(@LoggedUser User loggedUser, @ModelAttribute(value = "player") String player) {
        Map<String, String> result = new HashMap<String, String>();
        if (scoreBo.userHas(loggedUser, player)) {
            result.put("proceedWithConfirmation", "false");
        } else {
            result.put("proceedWithConfirmation", "true");
            result.put("title", MessageFormat.format("Associar {0} a alguem cadastrado?", player));
        }
        return result;
    }

    @RequestMapping(value = "/searchNewUser", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> searchNewUser(@ModelAttribute SearchModel search) {
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("playerFound", Boolean.FALSE);
        if (!search.getEmail().isEmpty()) {
            // search by email
            if (search.getEmail().equalsIgnoreCase("fdfreitas8@hotmail.com")) {
                result.put("playerFound", Boolean.TRUE);
                result.put("playerName", "Felipe Freitas");
                result.put("playerLocation", "Belo Horizonte, Brasil");
                result.put("playerAvatarUrl", "/player/avatar/url");
                result.put("requestMessage", "Olá Felipe! Posso compartilhar meus resultados com você?");
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