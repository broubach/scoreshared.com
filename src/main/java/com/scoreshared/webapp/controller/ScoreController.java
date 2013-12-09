package com.scoreshared.webapp.controller;

import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

import com.scoreshared.business.bo.GraphBo;
import com.scoreshared.business.bo.ScoreBo;
import com.scoreshared.business.bo.UserBo;
import com.scoreshared.business.persistence.Comment;
import com.scoreshared.business.persistence.Player;
import com.scoreshared.business.persistence.PlayerBehavior;
import com.scoreshared.business.persistence.Score;
import com.scoreshared.business.persistence.User;
import com.scoreshared.scaffold.LoggedUser;
import com.scoreshared.scaffold.UserLoggedListener;
import com.scoreshared.webapp.dto.ScoreModel;
import com.scoreshared.webapp.dto.SearchModel;
import com.scoreshared.webapp.validation.ScoreModelValidator;

@Controller
@RequestMapping("/score")
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
    
    @InitBinder
    protected void initBinder(WebDataBinder binder, WebRequest request) {
        if (binder.getTarget() instanceof ScoreModel) {
            PlayerBehavior player = (PlayerBehavior) request.getAttribute(UserLoggedListener.ASSOCIATED_PLAYER, WebRequest.SCOPE_SESSION);
            binder.setValidator(new ScoreModelValidator(player, messageResource, localeResolver.resolveLocale(((ServletWebRequest)request).getRequest())));
        }
    }

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView create(@LoggedUser User loggedUser, HttpSession session) {
        try {
            ModelAndView mav = new ModelAndView("score");
            ScoreModel score = new ScoreModel();
            score.setPlayersLeft(new ArrayList<String>());
            PlayerBehavior associatedPlayer = (PlayerBehavior) session.getAttribute(UserLoggedListener.ASSOCIATED_PLAYER);
            score.getPlayersLeft().add(associatedPlayer.getName());
            if (loggedUser.getProfile() != null) {
                if (loggedUser.getProfile().getCoach() != null) {
                    score.setCoach(loggedUser.getProfile().getCoach().getName());
                }
                if (loggedUser.getProfile().getSport() != null) {
                    score.setSportId(loggedUser.getProfile().getSport().ordinal());
                }
            }

            mav.addObject("score", score);
            mav.addObject("search", new SearchModel());

            StringWriter playersList = new StringWriter();
            ObjectMapper mapper = new ObjectMapper();
            mapper.writeValue(playersList, toPlayerList(userBo.listPlayersNameExceptLoggedUser(loggedUser)));
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

    private List<String> toPlayerList(List<Player> players) {
        List<String> result = new ArrayList<String>();
        for (Player player :players) {
            result.add(player.getName());
        }
        return result;
    }

    @RequestMapping(value = "{scoreId}", method = RequestMethod.GET)
    public ModelAndView edit(@LoggedUser User loggedUser, @PathVariable Integer scoreId, HttpSession session) {
        try {
            ModelAndView mav = new ModelAndView("score");
            
            Score score = scoreBo.findById(scoreId);
            if (score == null) {
                return create(loggedUser, session);
            }

            Comment comment = scoreBo.findCommentByScoreId(scoreId);
            score.setComment(comment);

            ScoreModel scoreModel = conversionService.convert(score, ScoreModel.class);

            mav.addObject("score", scoreModel);
            mav.addObject("search", new SearchModel());

            StringWriter playersList = new StringWriter();
            ObjectMapper mapper = new ObjectMapper();
            mapper.writeValue(playersList, toPlayerList(userBo.listPlayersNameExceptLoggedUser(loggedUser)));
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
    public ModelAndView save(@LoggedUser User loggedUser, @ModelAttribute("score") @Valid ScoreModel scoreModel, BindingResult result) {
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

            scoreModel.setOwner(loggedUser);
            Score score = conversionService.convert(scoreModel, Score.class);
            Comment comment = conversionService.convert(scoreModel, Comment.class);
            
            scoreBo.save(loggedUser, score, comment);

            mav.setViewName("redirect:/app/home");

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
}