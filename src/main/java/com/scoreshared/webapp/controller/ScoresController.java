package com.scoreshared.webapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

    @RequestMapping(value = "{pageNumber}/{orderField}/{ascending}", method = RequestMethod.GET)
	public ModelAndView list(@LoggedUser User loggedUser, HttpServletRequest request, @PathVariable Integer pageNumber, @PathVariable String orderField, @PathVariable Boolean ascending) {
    	ModelAndView result = new ModelAndView("scores");

    	List<Object[]> scores = bo.findScores(pageNumber, orderField, ascending);
    	List<ScoreItemModel> items = new ArrayList<ScoreItemModel>();
    	for (Object[] score : scores) {
    	    items.add(new ScoreItemModel((Score)score[0], (Comment)score[1], loggedUser, messageResource, localeResolver.resolveLocale(request)));
    	}

    	result.addObject("scores", items);
		return result;
	}
}