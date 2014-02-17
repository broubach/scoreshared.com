package com.scoreshared.scaffold;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class NotificationStatsFilter implements Filter {
    
    @Inject
    private NotificationStatsHelper helper;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse response, FilterChain chain) throws IOException,
            ServletException {
        HttpServletRequest request = (HttpServletRequest) req;

        if (request.getSession().getAttribute(UserLoggedListener.ASSOCIATED_PLAYER) != null
                && (request.getSession().getAttribute(NotificationStatsHelper.TOTAL_PENDING_NOTIFICATIONS) == null || request
                        .getParameter(NotificationStatsHelper.FORCE_NOTIFICATIONS_UPDATE) != null)) {
            helper.updateNotificationStats(request);
        }
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }
}