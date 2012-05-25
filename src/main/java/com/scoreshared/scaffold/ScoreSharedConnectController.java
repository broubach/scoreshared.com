package com.scoreshared.scaffold;

import javax.servlet.http.HttpServletRequest;

import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.connect.web.ConnectController;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.servlet.view.RedirectView;

public class ScoreSharedConnectController extends ConnectController {

    public ScoreSharedConnectController(ConnectionFactoryLocator connectionFactoryLocator,
            ConnectionRepository connectionRepository) {
        super(connectionFactoryLocator, connectionRepository);
    }

    @Override
    protected RedirectView connectionStatusRedirect(String providerId, NativeWebRequest request) {
        HttpServletRequest servletRequest = request.getNativeRequest(HttpServletRequest.class);
        String path = servletRequest.getServletPath() + "/welcome/step2";
        return new RedirectView(path, true);
    }
}