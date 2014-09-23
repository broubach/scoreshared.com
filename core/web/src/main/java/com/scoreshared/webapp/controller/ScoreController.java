package com.scoreshared.webapp.controller;

import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.context.MessageSource;
import org.springframework.core.convert.ConversionService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

import com.scoreshared.business.bo.GraphBo;
import com.scoreshared.business.bo.ScoreBo;
import com.scoreshared.business.bo.UserBo;
import com.scoreshared.domain.entity.Player;
import com.scoreshared.domain.entity.PlayerInstance;
import com.scoreshared.domain.entity.PlayerInstanceComment;
import com.scoreshared.domain.entity.Score;
import com.scoreshared.domain.entity.SportEnum;
import com.scoreshared.domain.entity.User;
import com.scoreshared.scaffold.ConnectionsHelper;
import com.scoreshared.scaffold.LoggedUser;
import com.scoreshared.scaffold.UserLoggedListener;
import com.scoreshared.webapp.dto.ScoreModel;
import com.scoreshared.webapp.dto.SearchModel;
import com.scoreshared.webapp.validation.ScoreModelValidator;

@Controller
@RequestMapping("/score")
@SessionAttributes({ "postSaveUrl" })
public class ScoreController extends BaseController {

    @Inject
    private ConversionService conversionService;

    @Inject
    private ScoreBo scoreBo;

    @Inject
    private UserBo userBo;

    @Inject
    private GraphBo graphBo;

    @Inject
    private MessageSource messageResource;

    @Inject
    private LocaleResolver localeResolver;
    
    @Inject
    private ConnectionsHelper connectionsHelper;

    @InitBinder
    protected void initBinder(WebDataBinder binder, WebRequest request) {
        if (binder.getTarget() instanceof ScoreModel) {
            Player player = (Player) request.getAttribute(UserLoggedListener.ASSOCIATED_PLAYER, WebRequest.SCOPE_SESSION);
            binder.setValidator(new ScoreModelValidator(player, messageResource, localeResolver.resolveLocale(((ServletWebRequest)request).getRequest())));
        }
    }

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView create(@LoggedUser User loggedUser, HttpSession session) {
        try {
            ModelAndView mav = new ModelAndView("score");
            ScoreModel score = new ScoreModel();
            score.setPlayersLeft(new ArrayList<String>());
            Player associatedPlayer = (Player) session.getAttribute(UserLoggedListener.ASSOCIATED_PLAYER);
            score.getPlayersLeft().add(associatedPlayer.getName());
            if (loggedUser.getProfile() != null) {
                if (loggedUser.getProfile().getSport() != null) {
                    score.setSportId(loggedUser.getProfile().getSport().ordinal());
                }
            }
            score.setOwnerId(loggedUser.getId());
            score.setUpdatable(Boolean.TRUE);

            mav.addObject("score", score);
            mav.addObject("search", new SearchModel());

            StringWriter playersList = new StringWriter();
            ObjectMapper mapper = new ObjectMapper();
            mapper.writeValue(playersList, toPlayerList(userBo.listPlayersNameExceptLoggedUser(loggedUser)));
            mav.addObject("playersList", playersList.toString());
            mav.addObject("unusedPlayersList", playersList.toString());
            
            connectionsHelper.populateModelMapWithConnections(mav.getModelMap(), StringUtils.isEmpty(loggedUser.getPassword()), false);

            return mav;
        } catch (JsonGenerationException e) {
            throw new RuntimeException(e);
        } catch (JsonMappingException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private List<String> toPlayerList(List<Player> players) {
        List<String> result = new ArrayList<String>();
        for (Player player :players) {
            result.add(player.getName());
        }
        return result;
    }

    @RequestMapping(value = "{scoreId}", method = RequestMethod.GET)
    public ModelAndView edit(@LoggedUser User loggedUser, @PathVariable Integer scoreId, HttpServletRequest request, HttpSession session) {
        try {
            ModelAndView mav = new ModelAndView("score");
            connectionsHelper.populateModelMapWithConnections(mav.getModelMap(), StringUtils.isEmpty(loggedUser.getPassword()), false);
            
            Score score = scoreBo.findById(scoreId);
            if (score == null) {
                return create(loggedUser, session);

            } else if (score.isUpdatable(loggedUser.getId()) == null) {
                throw new RuntimeException("score can't be edit by you");
            }

            if (request.getParameter("postSaveUrl") != null) {
                mav.addObject("postSaveUrl", request.getParameter("postSaveUrl"));
            }

            PlayerInstanceComment comment = scoreBo.findCommentByPlayerInstanceId(score.getAssociatedPlayer(loggedUser.getId()).getId());
            score.setComment(comment);

            ScoreModel scoreModel = conversionService.convert(score, ScoreModel.class);
            scoreModel.setUpdatable(score.isUpdatable(loggedUser.getId()));

            mav.addObject("score", scoreModel);
            mav.addObject("search", new SearchModel());

            StringWriter stringWriter = new StringWriter();
            ObjectMapper mapper = new ObjectMapper();
            List<String> playerList = toPlayerList(userBo.listPlayersNameExceptLoggedUser(loggedUser));
            mapper.writeValue(stringWriter, playerList);
            mav.addObject("playersList", stringWriter.toString());

            List<String> unusedPlayerList = removeUsedPlayers(playerList, score.getAllPlayers());
            stringWriter = new StringWriter();
            mapper.writeValue(stringWriter, unusedPlayerList);
            mav.addObject("unusedPlayersList", stringWriter.toString());
            
            return mav;
        } catch (JsonGenerationException e) {
            throw new RuntimeException(e);
        } catch (JsonMappingException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private List<String> removeUsedPlayers(List<String> playerList, Set<PlayerInstance> allPlayers) {
        List<String> unusedPlayers = new ArrayList<String>(playerList);
        for (PlayerInstance playerInstance : allPlayers) {
            unusedPlayers.remove(playerInstance.getName());
        }
        return unusedPlayers;
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView save(@LoggedUser User loggedUser, @ModelAttribute("score") @Valid ScoreModel scoreModel, BindingResult result, HttpSession session,
            SessionStatus status) {
        try {
            ModelAndView mav = new ModelAndView();
            if (result.hasErrors()) {
                mav.addObject("score", scoreModel);
                mav.addObject("search", new SearchModel());
                mav.setViewName("score");

                StringWriter playersList = new StringWriter();
                ObjectMapper mapper = new ObjectMapper();
                mapper.writeValue(playersList, toPlayerList(userBo.listPlayersNameExceptLoggedUser(loggedUser)));
                mav.addObject("playersList", playersList.toString());
                return mav;
            }

            Score score = conversionService.convert(scoreModel, Score.class);
            PlayerInstanceComment comment = conversionService.convert(scoreModel, PlayerInstanceComment.class);

            scoreBo.save(score.getOwner(), loggedUser, score, comment);

            if (session.getAttribute("postSaveUrl") != null) {
                mav.setViewName("redirect:" + session.getAttribute("postSaveUrl"));
                status.setComplete();

            } else {
                mav.setViewName("redirect:/app/home");
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

    @RequestMapping(value = "/shouldPlayerBeInvited", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> shouldPlayerBeInvited(@LoggedUser User loggedUser, @ModelAttribute("playerName") String playerName,
            HttpServletRequest request) {
        Map<String, String> result = new HashMap<String, String>();
        Object[] shouldPlayerBeInvited = graphBo.shouldPlayerBeInvited(playerName, loggedUser);
        result.put("proceedWithConfirmation", shouldPlayerBeInvited[0].toString());
        if ((Boolean) shouldPlayerBeInvited[0]) {
            result.put("title", messageResource.getMessage("label.invite_to_your_contacts",
                    new String[] { playerName }, localeResolver.resolveLocale(request)));
            if (shouldPlayerBeInvited.length > 1) {
                result.put("playerId", ((Player) shouldPlayerBeInvited[1]).getId().toString());
            }
        }
        return result;
    }

    @RequestMapping(value = "/searchUser", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> searchUser(@ModelAttribute SearchModel search, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<String, Object>();

        String[] filters = new String[] { search.getFirstName(), search.getLastName(), search.getCity(),
                search.getCountry() };
        List<User> users = userBo.findUserDetailsByMailAndProfileInfo(search.getEmail(), filters);

        if (!users.isEmpty()) {
            result.put("playerFound", Boolean.TRUE);
            result.put("playerList", toArrayList(users));
        } else {
            result.put("playerFound", Boolean.FALSE);
            result.put("email", search.getEmail());
        }
        result.put("invitationMessage", messageResource.getMessage("label.association_request",
                new String[] { search.getPlayerNameInScore() }, localeResolver.resolveLocale(request)));
        result.put("playerNameInScore", search.getPlayerNameInScore());
        return result;
    }

    private List<Object[]> toArrayList(List<User> users) {
        List<Object[]> result = new ArrayList<Object[]>();
        for (User user : users) {
            result.add((Object[])conversionService.convert(user, Object[].class));
        }
        return result;
    }

    @RequestMapping(value = "/newFriendRequest", method = RequestMethod.POST)
    @ResponseBody
    public void postFriendRequest(HttpServletRequest request, @LoggedUser User loggedUser,
            @ModelAttribute("userId") Integer userId, @ModelAttribute("playerId") String playerId, @ModelAttribute("message") String message) {
        if (StringUtils.isEmpty(playerId)) {
            graphBo.inviteRegisteredUser(loggedUser, userId, null, message, localeResolver.resolveLocale(request));
        } else {
            graphBo.inviteRegisteredUser(loggedUser, userId, Integer.valueOf(playerId), message, localeResolver.resolveLocale(request));
        }
    }

    @RequestMapping(value = "/newInvitation", method = RequestMethod.POST)
    @ResponseBody
    public void postInvitation(HttpServletRequest request, @LoggedUser User user,
            @ModelAttribute("playerName") String playerName, @ModelAttribute("email") String invitationMail,
            @ModelAttribute("message") String invitationMessage) {
        graphBo.inviteUnregisteredUser(user, playerName, invitationMail, invitationMessage, localeResolver.resolveLocale(request));
    }

    @RequestMapping(value = "/playerStats", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, String> getPlayerStats(@LoggedUser User loggedUser, @ModelAttribute("sportId") String sportId, @ModelAttribute("date") String date, @ModelAttribute("loggedUserIsWinner") Boolean loggedUserIsWinner, HttpServletRequest request) {
        Map<String, String> result = new HashMap<String, String>();
        Integer[] winLossTiesAndPractices = scoreBo.countWinLossTiesAndPractices(null, loggedUser.getId());
        
        int win = -1;
        int loss = -1;
        if (loggedUserIsWinner) {
            win = winLossTiesAndPractices[0] + 1;
            loss = winLossTiesAndPractices[1];
        } else {
            win = winLossTiesAndPractices[0];
            loss = winLossTiesAndPractices[1] + 1;
        }

        String title = messageResource.getMessage("label.score_shared_title",
                new Object[] { loggedUser.getFirstName(), SportEnum.values()[Integer.valueOf(sportId)].capitalize() },
                localeResolver.resolveLocale(request));
        result.put("title", title);

        String subtitle = messageResource.getMessage(
                "label.score_shared_subtitle",
                new Object[] { date, String.valueOf(win), String.valueOf(loss),
                        String.valueOf(Double.valueOf(((win * 1f) / (win + loss)) * 100).intValue()) },
                localeResolver.resolveLocale(request));
        result.put("subtitle", subtitle);
        result.put("win", String.valueOf(win));
        result.put("loss", String.valueOf(loss));

        return result;
    }
}