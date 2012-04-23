package com.scoreshared.webapp.social;

import javax.servlet.http.HttpServletRequest;

import org.springframework.social.connect.Connection;
import org.springframework.social.connect.web.SignInAdapter;
import org.springframework.web.context.request.NativeWebRequest;

public final class SimpleSignInAdapter implements SignInAdapter {

    @Override
    public String signIn(String userId, Connection<?> connection, NativeWebRequest request) {
        ((HttpServletRequest) request.getNativeRequest()).getSession().setAttribute("loggedUser", userId);
        return null;
    }

}