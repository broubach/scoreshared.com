package com.scoreshared.webapp.social;

import javax.inject.Inject;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Component;

import com.scoreshared.business.bo.SocialConnectionBo;
import com.scoreshared.business.bo.UserBo;

@Component("socialAuthProvider")
public class SocialAuthenticationProvider implements AuthenticationProvider {

    @Inject
    private SocialConnectionBo userBo;

    @Inject
    private UserBo userDetailsService;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        if (!supports(authentication.getClass())) {
            return null;
        }

        SocialAuthenticationToken socialToken = (SocialAuthenticationToken) authentication;

        if (!userBo.isUserConnected(socialToken.getUserId(), socialToken.getProviderId(),
                socialToken.getProviderUserId())) {
            throw new BadCredentialsException("User is not registered using " + socialToken.getProviderId());
        }

        SocialAuthenticationToken newToken = new SocialAuthenticationToken(
                userDetailsService.loadUserByUsername(socialToken.getUserId()));
        newToken.setAuthenticated(true);

        return newToken;
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return (SocialAuthenticationToken.class.isAssignableFrom(authentication));
    }
}