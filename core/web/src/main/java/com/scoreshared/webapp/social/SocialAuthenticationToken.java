package com.scoreshared.webapp.social;

import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;

public class SocialAuthenticationToken extends AbstractAuthenticationToken {

    private Object principal;
    private Object credentials;

    public SocialAuthenticationToken(String userId, String providerId, String providerUserId) {
        super(null);
        credentials = new Object[] { userId, providerId, providerUserId };
    }

    public SocialAuthenticationToken(UserDetails userDetails) {
        super(null);
        this.principal = userDetails;
    }

    @Override
    public Object getPrincipal() {
        return principal;
    }

    @Override
    public Object getCredentials() {
        return credentials;
    }

    public String getUserId() {
        if (credentials != null) {
            return (String) ((Object[]) credentials)[0];
        }
        return null;
    }

    public String getProviderId() {
        if (credentials != null) {
            return (String) ((Object[]) credentials)[1];
        }
        return null;
    }

    public String getProviderUserId() {
        if (credentials != null) {
            return (String) ((Object[]) credentials)[2];
        }
        return null;
    }
}