package com.scoreshared.scaffold;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.apache.commons.beanutils.BeanUtilsBean;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.ConvertUtilsBean;
import org.apache.commons.beanutils.converters.DateConverter;
import org.springframework.web.context.ServletContextAware;

import com.scoreshared.business.bo.UserBo;

public class CustomContextListener implements ServletContextAware {

    @Inject
    private UserBo userBo;

    @Override
    public void setServletContext(ServletContext servletContext) {
        ConvertUtilsBean convertUtilsBean = BeanUtilsBean.getInstance().getConvertUtils();
        convertUtilsBean.register(false, true, -1);

        if (servletContext.getAttribute(UserBo.DEFAULT_AVATAR_KEY) == null) {
            servletContext.setAttribute(UserBo.DEFAULT_AVATAR_KEY, userBo.getDefaultAvatar());
        }
        if (servletContext.getAttribute(UserBo.SMALL_DEFAULT_AVATAR_KEY) == null) {
            servletContext.setAttribute(UserBo.SMALL_DEFAULT_AVATAR_KEY, userBo.getSmallDefaultAvatar());
        }
        ConvertUtils.register(new DateConverter(null), Date.class);
    }
}