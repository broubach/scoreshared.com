package com.scoreshared.webapp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController extends BaseController {

    /**
     * This controller transfers the exception reported by the spring security from the session to the request,
     * so the error message is showed only once.
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(HttpServletRequest request, HttpSession session) {
        if (session.getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION) != null) {
            request.setAttribute(WebAttributes.AUTHENTICATION_EXCEPTION,
                    session.getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION));
            session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
        }
        return "login";
    }

}
