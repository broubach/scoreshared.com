package com.scoreshared.scaffold;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.security.web.context.HttpRequestResponseHolder;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Component;

import com.scoreshared.webapp.social.SocialAuthenticationToken;

@Component
public class SecurityHelper {

    @Inject
    private AuthenticationManager authenticationManager;

    @Inject
    private HttpSessionSecurityContextRepository contextRepository;

    public void authenticateUserWithPassword(HttpServletRequest request, HttpServletResponse response, String email,
            String password) {
        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(email, password);
        authenticate(request, response, token);
    }

    public void authenticateUserWithSocialId(HttpServletRequest request, HttpServletResponse response, String userId,
            String providerId, String providerUserId) {
        SocialAuthenticationToken token = new SocialAuthenticationToken(userId, providerId, providerUserId);
        authenticate(request, response, token);
    }

    private void authenticate(HttpServletRequest request, HttpServletResponse response,
            AbstractAuthenticationToken token) {
        HttpRequestResponseHolder holder = new HttpRequestResponseHolder(request, response);
        contextRepository.loadContext(holder);

        token.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
        Authentication authentication = authenticationManager.authenticate(token);
        SecurityContextHolder.getContext().setAuthentication(authentication);

        contextRepository.saveContext(SecurityContextHolder.getContext(), holder.getRequest(), holder.getResponse());
    }
}
