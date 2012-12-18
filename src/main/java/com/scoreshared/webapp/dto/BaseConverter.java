package com.scoreshared.webapp.dto;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.LocaleResolver;

@Component
public class BaseConverter {

    @Inject
    protected MessageSource messageResource;
    
    @Inject
    protected LocaleResolver localeResolver;

    @Inject
    protected HttpServletRequest request;

    public void setMessageResource(MessageSource messageResource) {
        this.messageResource = messageResource;
    }

    public void setLocaleResolver(LocaleResolver localeResolver) {
        this.localeResolver = localeResolver;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }
}
