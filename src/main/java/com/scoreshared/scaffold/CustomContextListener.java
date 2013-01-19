package com.scoreshared.scaffold;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

import com.scoreshared.business.bo.UserBo;

public class CustomContextListener implements ServletContextAware {

    @Inject
    private UserBo userBo;

    @Override
    public void setServletContext(ServletContext servletContext) {
        if (servletContext.getAttribute(UserBo.DEFAULT_AVATAR_KEY) == null) {
            servletContext.setAttribute(UserBo.DEFAULT_AVATAR_KEY, userBo.getDefaultAvatar());
        }
        if (servletContext.getAttribute(UserBo.SMALL_DEFAULT_AVATAR_KEY) == null) {
            servletContext.setAttribute(UserBo.SMALL_DEFAULT_AVATAR_KEY, userBo.getSmallDefaultAvatar());
        }
    }
}
