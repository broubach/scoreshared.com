package com.scoreshared.webapp.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.scoreshared.business.bo.ScoreBo;
import com.scoreshared.business.persistence.User;
import com.scoreshared.scaffold.LoggedUser;

@Controller
@RequestMapping(value = "/home")
public class HomeController extends BaseController {

    @Inject
    private ScoreBo scoreBo;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView home(@LoggedUser User loggedUser) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("userFirstName", loggedUser.getFirstName());

        // TODO: remove comments after score page is ready
        //        if (scoreBo.hasMatches(loggedUser)) {
        //            mav.setViewName("home");
        //        } else {
        mav.setViewName("homeNewUser");
        //        }
        return mav;
    }
}