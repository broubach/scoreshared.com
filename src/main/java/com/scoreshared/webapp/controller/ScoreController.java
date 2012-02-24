package com.scoreshared.webapp.controller;

import java.text.MessageFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.scoreshared.webapp.view.dto.ScoreModel;
import com.scoreshared.webapp.view.dto.SearchModel;

@Controller
@RequestMapping(value = "/score")
public class ScoreController {

    private final List playersList = CollectionUtils.arrayToList(new String[] { "Andre Agassi", "Pete Sampras",
            "Sergi Bruguera", "Yevgeny Kafelnikov", "Goran Ivanisevic", "Slobodan Milosevic", "Richard Krajicek",
            "Jimmy Connors", "Felipe Freitas", "Roger Federer", "Rafael Nadal", "Andy Roddick", "Novak Jokovic",
            "Andy Murray" });

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView show() {
        ModelAndView mav = new ModelAndView("score");
        mav.addObject("score", new ScoreModel());
        mav.addObject("search", new SearchModel());
        return mav;
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView save(@ModelAttribute ScoreModel score) {
        // validate model
        // persist model
        // check if users already exist
        ModelAndView mav = new ModelAndView("score");
        mav.addObject("score", score);
        mav.addObject("search", new SearchModel());
        return mav;
    }

    @RequestMapping(value = "/newUser", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> postNewUser(@ModelAttribute(value = "player") String player) {
        Map<String, String> result = new HashMap<String, String>();
        if (playersList.contains(player)) {
            result.put("proceedWithConfirmation", "false");
        } else {
            result.put("proceedWithConfirmation", "true");
            result.put("title", MessageFormat.format("Associar {0} a alguem cadastrado?", player));
        }
        return result;
    }

    @RequestMapping(value = "/searchNewUser", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> searchNewUser(@ModelAttribute SearchModel search) {
        Map<String, String> result = new HashMap<String, String>();
        result.put("playerFound", "false");
        result.put("invitationMessage",
                "Olá Felipe! Quero compartilhar meus resultados com você! Junte-se a mim no ScoreShared!");
        if (!search.getEmail().isEmpty()) {
            // search by email
            if (search.getEmail().equalsIgnoreCase("fdfreitas8@hotmail.com")) {
                result.put("playerFound", "true");
                result.put("playerName", "Felipe Freitas");
                result.put("playerLocation", "Belo Horizonte, Brasil");
                result.put("requestMessage", "Olá Felipe! Posso compartilhar meus resultados com você?");
            }

        } else {
            // search by other fields
        }
        return result;
    }
}