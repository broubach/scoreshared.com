package com.scoreshared.scaffold;

import java.security.Principal;

import org.springframework.core.MethodParameter;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.support.WebArgumentResolver;
import org.springframework.web.context.request.NativeWebRequest;

import com.scoreshared.business.persistence.User;

public class LoggedUserWebArgumentResolver implements WebArgumentResolver {

    @Override
    public Object resolveArgument(MethodParameter methodParameter, NativeWebRequest webRequest) {
        if (methodParameter.getParameterType().isAssignableFrom(User.class)
                && methodParameter.getParameterAnnotation(LoggedUser.class) != null) {
            Principal principal = webRequest.getUserPrincipal();
            return ((Authentication) principal).getPrincipal();
        } else {
            return WebArgumentResolver.UNRESOLVED;
        }
    }
}
