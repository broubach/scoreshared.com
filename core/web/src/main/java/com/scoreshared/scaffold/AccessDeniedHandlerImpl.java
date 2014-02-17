package com.scoreshared.scaffold;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

public class AccessDeniedHandlerImpl implements AccessDeniedHandler {

    private final List<String> anonymousResources;
    private final String onDeniedToNonAnonymousDestinationUrl;
    private final String onDeniedDefaultDestinationUrl;

    public AccessDeniedHandlerImpl(List<String> anonymousResources, String onDeniedToNonAnonymousDestinationUrl,
            String onDeniedDefaultDestinationUrl) {
        this.anonymousResources = anonymousResources;
        this.onDeniedToNonAnonymousDestinationUrl = onDeniedToNonAnonymousDestinationUrl;
        this.onDeniedDefaultDestinationUrl = onDeniedDefaultDestinationUrl;
    }

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response,
            AccessDeniedException accessDeniedException) throws IOException, ServletException {
        if (isAnonymousResource(request)) {
            response.sendRedirect(request.getContextPath() + onDeniedToNonAnonymousDestinationUrl);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher(onDeniedDefaultDestinationUrl);
            rd.forward(request, response);
        }
    }

    private boolean isAnonymousResource(HttpServletRequest request) {
        for (String anonymousResource : anonymousResources) {
            if (request.getRequestURI().endsWith(anonymousResource)) {
                return true;
            }
        }
        return false;
    }

}
