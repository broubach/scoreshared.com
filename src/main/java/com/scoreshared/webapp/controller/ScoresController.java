package com.scoreshared.webapp.controller;

import java.util.ArrayList;
import java.util.Collections;
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
import com.scoreshared.business.persistence.Comment;
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

    @RequestMapping(value = "{pageNumber}/{sortField}/{ascending}", method = RequestMethod.GET)
	public ModelAndView list(@LoggedUser final User loggedUser, HttpServletRequest request, @PathVariable Integer pageNumber, @PathVariable String sortField, @PathVariable final Boolean ascending) {
    	ModelAndView result = new ModelAndView("scores");
    	
    	SortFieldEnum sortFieldEnum = null;
    	try {
    	    sortFieldEnum = SortFieldEnum.valueOf(sortField.toUpperCase());
    	} catch (IllegalArgumentException e) {
            return result;
    	}

    	List<Object[]> scores = bo.findScores(pageNumber, ascending, loggedUser);
    	
    	if (sortFieldEnum.equals(SortFieldEnum.PLAYER)) {
    	    Collections.sort(scores, new PlayerComparator(loggedUser, ascending));
    	} else if (sortFieldEnum.equals(SortFieldEnum.SCORE)) {
            Collections.sort(scores, new ScoreComparator(loggedUser, ascending));
    	}

    	List<ScoreItemModel> items = new ArrayList<ScoreItemModel>();
    	for (Object[] score : scores) {
    	    items.add(new ScoreItemModel((Score)score[0], (Comment)score[1], loggedUser, messageResource, localeResolver.resolveLocale(request)));
    	}
    	result.addObject("scores", items);

    	Integer[] winLoss = bo.calculateWinLoss(loggedUser.getId());
    	result.addObject("win", winLoss[0]);
        result.addObject("loss", winLoss[1]);
		return result;
	}

    @RequestMapping(value="{scoreIds}", method = RequestMethod.DELETE)
    @ResponseStatus(value=HttpStatus.OK)
    public void delete(@LoggedUser User loggedUser, @PathVariable String scoreIds) {
        String[] ids = scoreIds.split(",");
        Integer[] integerIds = new Integer[ids.length];
        for (int i = 0; i<ids.length;i++) {
            integerIds[i] = Integer.valueOf(ids[i]);
        }
        bo.deleteScores(integerIds, loggedUser.getId());
    }
}