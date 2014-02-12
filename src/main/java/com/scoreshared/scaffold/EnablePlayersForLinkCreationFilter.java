package com.scoreshared.scaffold;

import java.io.IOException;
import java.io.StringWriter;
import java.security.Principal;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.security.core.Authentication;

import com.scoreshared.business.bo.PlayerBo;
import com.scoreshared.business.persistence.User;

public class EnablePlayersForLinkCreationFilter implements Filter {
    
    private static final String PLAYER_CONTROLLER_URL = "/app/player/";

    @Inject
    private PlayerBo bo;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse response, FilterChain chain) throws IOException,
            ServletException {
        HttpServletRequest request = (HttpServletRequest) req;

        // extract user Id
        Integer userId = null;
        if (request.getRequestURI().matches(
                new StringBuilder().append("^.*").append(PLAYER_CONTROLLER_URL).append("[0-9]+").toString())) {
            userId = Integer.valueOf(request.getRequestURI().substring(
                    request.getRequestURI().indexOf(PLAYER_CONTROLLER_URL) + PLAYER_CONTROLLER_URL.length()));

        } else {
            Principal principal = request.getUserPrincipal();
            userId = ((User)((Authentication) principal).getPrincipal()).getId();
        }

        // query for id and name of connected players
        List<Object[]> playerIdsAndNames = bo.findConnectedPlayerIdAndNameByOwnerId(userId);

        // transform players to json
        StringWriter jsonPlayers = new StringWriter();
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(jsonPlayers, playerIdsAndNames);

        // add them to request
        request.setAttribute("playersForLinkCreation", jsonPlayers.toString());

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }
}