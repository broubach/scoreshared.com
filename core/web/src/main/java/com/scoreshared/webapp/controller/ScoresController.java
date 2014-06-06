package com.scoreshared.webapp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.tuple.Pair;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

import com.scoreshared.business.bo.ScoreBo;
import com.scoreshared.domain.entity.PlayerInstance;
import com.scoreshared.domain.entity.Score;
import com.scoreshared.domain.entity.User;
import com.scoreshared.scaffold.LoggedUser;
import com.scoreshared.webapp.dto.ScoreItemModel;

@Controller
@RequestMapping("/scores")
public class ScoresController extends BaseController {

	@Inject
	private ScoreBo bo;
	
    @Inject
    private MessageSource messageResource;

    @Inject
    private LocaleResolver localeResolver;

    @RequestMapping(value = "{pageNumber}/{outcome}/{ascending}", method = RequestMethod.GET)
    public ModelAndView listWithoutTerm(@LoggedUser final User loggedUser, HttpServletRequest request,
            @PathVariable Integer pageNumber, @PathVariable ScoreOutcomeEnum outcome,
            @PathVariable final Boolean ascending) {
        return doList(loggedUser, request, pageNumber, null, outcome, ascending);
    }

    @RequestMapping(value = "{pageNumber}/{term}/{outcome}/{ascending}", method = RequestMethod.GET)
    public ModelAndView list(@LoggedUser final User loggedUser, HttpServletRequest request,
            @PathVariable Integer pageNumber, @PathVariable String term, @PathVariable ScoreOutcomeEnum outcome,
            @PathVariable final Boolean ascending) {
        return doList(loggedUser, request, pageNumber, term, outcome, ascending);
    }

    private ModelAndView doList(final User loggedUser, HttpServletRequest request, Integer pageNumber, String term,
            ScoreOutcomeEnum outcome, final Boolean ascending) {
        ModelAndView result = new ModelAndView("scores/scores");

    	Pair<List<Score>, Integer> scoresAndTotalCount = bo.findScores(pageNumber, term, outcome, ascending, loggedUser.getId());

    	List<ScoreItemModel> items = new ArrayList<ScoreItemModel>();
    	for (Score score : scoresAndTotalCount.getLeft()) {
    	    items.add(new ScoreItemModel(score, score.getComment(), loggedUser, messageResource, localeResolver.resolveLocale(request)));
    	}
    	result.addObject("scores", items);
    	
    	calculatePaginationWindowAndAddToModel(result, pageNumber, scoresAndTotalCount.getRight());
    	
    	Integer[] winLoss = bo.calculateWinLoss(scoresAndTotalCount.getLeft(), loggedUser.getId());
    	result.addObject("win", winLoss[0]);
        result.addObject("loss", winLoss[1]);
        result.addObject("outcome", outcome.toString());
        result.addObject("searchTerm", term);
        result.addObject("ascending", ascending);
		return result;
    }

    private void calculatePaginationWindowAndAddToModel(ModelAndView mav, Integer pageNumber, Integer pageCount) {
        int windowSize = 5;
    	int windowLeft = pageNumber - windowSize/2;
    	int windowRight = pageNumber + windowSize/2;

    	int spareWeigthLeft = 0;
    	if (windowLeft < 0) {
    	    spareWeigthLeft = Math.abs(windowLeft);
    	    windowLeft = 0;
    	}

    	int spareWeigthRight = 0;
    	if (windowRight >= pageCount) {
    	    spareWeigthRight = windowRight - (pageCount-1);
    	    windowRight = pageCount-1;
    	}

    	if (pageCount > windowSize) {
    	    windowLeft -= spareWeigthRight;
    	    windowRight += spareWeigthLeft;
            if (pageNumber == 0) {
                mav.addObject("disableFirstArrow", true);
            } else if (pageNumber == (pageCount-1)) {
                mav.addObject("disableLastArrow", true);
            }
        } else {
            mav.addObject("disableFirstArrow", true);
            mav.addObject("disableLastArrow", true);
        }
        mav.addObject("windowLeft", windowLeft);
        mav.addObject("windowRight", windowRight);
        mav.addObject("pageCount", pageCount);
        mav.addObject("pageNumber", pageNumber);
    }

    @RequestMapping(value="/remove/{scoreId}", method = RequestMethod.DELETE)
    @ResponseStatus(value=HttpStatus.OK)
    public void remove(@LoggedUser User loggedUser, @PathVariable Integer scoreId) {
        bo.removeScore(scoreId, loggedUser.getId());
    }

    @RequestMapping(value="/hidePermanently", method = RequestMethod.POST)
    @ResponseStatus(value=HttpStatus.OK)
    public void hidePermanently(@LoggedUser User loggedUser, @ModelAttribute("scoreId") Integer scoreId) {
        bo.hideScore(scoreId, loggedUser.getId());
    }

    @RequestMapping(value="/playerInstancesForScore/{scoreId}", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getPlayerInstancesForScore(@LoggedUser User loggedUser, @PathVariable Integer scoreId) {
        Map<String, Object> result = new HashMap<String, Object>();
        Set<PlayerInstance> connectedPlayersInScore = bo.getConnectedPlayersFromScoreWithoutOwner(loggedUser, scoreId);

        List<Object[]> playerNamesAndIds = new ArrayList<Object[]>();
        for (PlayerInstance playerInstance : connectedPlayersInScore) {
            if (playerInstance.isScoreConnected()) {
                playerNamesAndIds.add(new Object[] { playerInstance.getAssociation().getId(), playerInstance.getName() });
            }
        }
        result.put("playerInstances", playerNamesAndIds.toArray());

        return result;
    }

    @RequestMapping(value="/forward", method = RequestMethod.POST)
    @ResponseStatus(value=HttpStatus.OK)
    public void forward(@LoggedUser User loggedUser, @ModelAttribute("scoreId") Integer scoreId, @ModelAttribute("newUserId") Integer newUserId) {
        bo.forward(scoreId, newUserId, loggedUser);
    }
}