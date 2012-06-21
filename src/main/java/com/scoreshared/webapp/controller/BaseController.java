package com.scoreshared.webapp.controller;

import javax.servlet.http.HttpSession;

import com.scoreshared.business.persistence.User;

public class BaseController {

    public static final String LOGGED_USER_KEY = "loggedUser";

    protected User getLoggedUser(HttpSession session) {
        return (User) session.getAttribute(LOGGED_USER_KEY);
    }

    protected void setLoggedUser(HttpSession session, User user) {
        session.setAttribute(LOGGED_USER_KEY, user);
    }
}
