package com.scoreshared.scaffold;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

import com.scoreshared.business.bo.FileBo;

public class ScoreSharedContextListener implements ServletContextAware {

    @Inject
    private FileBo fileBo;

    @Override
    public void setServletContext(ServletContext servletContext) {
        if (servletContext.getAttribute(FileBo.DEFAULT_AVATAR_KEY) == null) {
            servletContext.setAttribute(FileBo.DEFAULT_AVATAR_KEY, fileBo.findByPk(FileBo.DEFAULT_AVATAR_ID));
        }
        if (servletContext.getAttribute(FileBo.SMALL_DEFAULT_AVATAR_KEY) == null) {
            servletContext.setAttribute(FileBo.SMALL_DEFAULT_AVATAR_KEY,
                    fileBo.findByPk(FileBo.SMALL_DEFAULT_AVATAR_ID));
        }
    }
}
