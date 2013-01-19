package com.scoreshared.scaffold;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.web.authentication.WebAuthenticationDetails;

public class CustomWebAuthenticationDetails extends WebAuthenticationDetails {

    private HttpSession session;

    public CustomWebAuthenticationDetails(HttpServletRequest request) {
        super(request);
        this.session = request.getSession();
    }

    public HttpSession getSession() {
        return session;
    }
}
