package com.scoreshared.webapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.LocaleResolver;

import com.scoreshared.business.bo.PlayerBo;
import com.scoreshared.business.exception.EmptyPlayerNameException;
import com.scoreshared.business.exception.LongPlayerNameException;
import com.scoreshared.business.exception.PlayerLinkedException;
import com.scoreshared.business.exception.PlayerNotLinkedException;
import com.scoreshared.business.exception.PlayerWithRegisteredMatchException;
import com.scoreshared.business.persistence.Player;
import com.scoreshared.business.persistence.User;
import com.scoreshared.scaffold.LoggedUser;
import com.scoreshared.webapp.dto.SearchModel;

@Controller
public class ProfilePlayersController {

    @Inject
    private PlayerBo bo;

    @Inject
    private MessageSource messageResource;

    @Inject
    private LocaleResolver localeResolver;

    @RequestMapping(value = "/profile/players/ascending/{ascending}", method = RequestMethod.GET)
    public String getPlayers(@LoggedUser User loggedUser, @PathVariable Boolean ascending, ModelMap modelMap) {
        List<Player> players = bo.getPlayersByOwnerExceptOwnerFlaggingPlayersWithScore(loggedUser.getId(), ascending);
        modelMap.addAttribute("players", players);
        modelMap.addAttribute("search", new SearchModel());
        return "/profile/players";
    }

    @RequestMapping(value = "/profile/players/rename", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> renamePlayer(@LoggedUser User loggedUser, @ModelAttribute("playerId") Integer playerId,
            @ModelAttribute("playerName") String playerName, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            bo.renamePlayer(playerId, playerName, loggedUser.getId());
        } catch (PlayerLinkedException e) {
            result.put(
                    "errorMessage",
                    messageResource.getMessage("error.a_linked_player_cannot_be_renamed", null,
                            localeResolver.resolveLocale(request)));
        } catch (EmptyPlayerNameException e) {
            result.put(
                    "errorMessage",
                    messageResource.getMessage("error.player_name_cannot_be_empty", null,
                            localeResolver.resolveLocale(request)));
        } catch (LongPlayerNameException e) {
            result.put(
                    "errorMessage",
                    messageResource.getMessage("error.player_name_cannot_be_longer_than_45_characters", null,
                            localeResolver.resolveLocale(request)));
        }
        return result;
    }

    @RequestMapping(value = "/profile/players/remove/{playerId}", method = RequestMethod.DELETE)
    @ResponseBody
    public Map<String, Object> removePlayer(@LoggedUser User loggedUser, @PathVariable Integer playerId, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            bo.removePlayer(playerId, loggedUser.getId());
        } catch (PlayerLinkedException e) {
            result.put(
                    "errorMessage",
                    messageResource.getMessage("error.a_linked_player_cannot_be_removed", null,
                            localeResolver.resolveLocale(request)));
        } catch (PlayerWithRegisteredMatchException e) {
            result.put(
                    "errorMessage",
                    messageResource.getMessage("error.a_player_with_registered_match_cannot_be_removed", null,
                            localeResolver.resolveLocale(request)));
        }
        return result;
    }

    @RequestMapping(value = "/profile/players/removeLink/{playerId}", method = RequestMethod.DELETE)
    @ResponseBody
    public Map<String, Object> removePlayerLink(@LoggedUser User loggedUser, @PathVariable Integer playerId, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            bo.removePlayerLink(playerId, loggedUser.getId());
        } catch (PlayerNotLinkedException e) {
            result.put(
                    "errorMessage",
                    messageResource.getMessage("error.player_doesnt_have_a_link_to_be_removed", null,
                            localeResolver.resolveLocale(request)));
        }
        return result;
    }
}