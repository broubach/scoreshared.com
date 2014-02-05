package com.scoreshared.webapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

import com.scoreshared.business.bo.ScoreBo;
import com.scoreshared.business.persistence.Score;
import com.scoreshared.business.persistence.User;
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

    	List<Score> scores = bo.findScores(pageNumber, term, outcome, ascending, loggedUser.getId());

    	List<ScoreItemModel> items = new ArrayList<ScoreItemModel>();
    	for (Score score : scores) {
    	    items.add(new ScoreItemModel(score, score.getComment(), loggedUser, messageResource, localeResolver.resolveLocale(request)));
    	}
    	result.addObject("scores", items);

    	Integer[] winLoss = bo.calculateWinLoss(scores, loggedUser.getId());
    	result.addObject("win", winLoss[0]);
        result.addObject("loss", winLoss[1]);
        result.addObject("outcome", outcome.toString());
        result.addObject("searchTerm", term);
        result.addObject("ascending", ascending);
		return result;
    }

    @RequestMapping(value="/remove/{scoreId}", method = RequestMethod.DELETE)
    @ResponseStatus(value=HttpStatus.OK)
    public void remove(@LoggedUser User loggedUser, @PathVariable Integer scoreId) {
        bo.removeScore(scoreId, loggedUser.getId());
    }

    @RequestMapping(value="/hidePermanently", method = RequestMethod.POST)
    @ResponseStatus(value=HttpStatus.OK)
    public void hidePermanently(@LoggedUser User loggedUser, @PathVariable("scoreId") Integer scoreId) {
        bo.hideScore(scoreId, loggedUser.getId());
    }
}