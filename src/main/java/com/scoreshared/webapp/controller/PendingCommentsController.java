package com.scoreshared.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/messages/pendingComments")
public class PendingCommentsController extends BaseController {

    public ModelAndView list() {
        return null;
    }
}
