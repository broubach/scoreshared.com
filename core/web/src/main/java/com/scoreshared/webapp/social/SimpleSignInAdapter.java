package com.scoreshared.webapp.social;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.social.connect.Connection;
import org.springframework.social.connect.web.SignInAdapter;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.NativeWebRequest;

import com.scoreshared.scaffold.SecurityHelper;

@Component
public class SimpleSignInAdapter implements SignInAdapter {

    @Inject
    private SecurityHelper securityHelper;

    @Override
    public String signIn(String userId, Connection<?> connection, NativeWebRequest request) {
        securityHelper.authenticateUserWithSocialId((HttpServletRequest) request.getNativeRequest(),
                (HttpServletResponse) request.getNativeResponse(), userId, connection.getKey().getProviderId(),
                connection.getKey().getProviderUserId());
        return null;
    }
}