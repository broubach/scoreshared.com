package com.scoreshared.webapp.filter;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;

import com.scoreshared.business.bo.UserBo;
import com.scoreshared.business.persistence.Player;
import com.scoreshared.scaffold.UserLoggedListener;

public class OnlyAtSignupFilter implements Filter {

    @Inject
    private UserBo bo;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
            ServletException {
        HttpServletRequest servletRequest = (HttpServletRequest) request;
        HttpServletResponse servletResponse = (HttpServletResponse) response;
        Player player = (Player) servletRequest.getSession().getAttribute(UserLoggedListener.ASSOCIATED_PLAYER);
        if (bo.isSignupCompleted(player.getAssociation())) {
            servletResponse.sendError(HttpServletResponse.SC_NOT_FOUND);
        } else {
            chain.doFilter(servletRequest, response);
        }
    }

    @Override
    public void destroy() {
    }
}
