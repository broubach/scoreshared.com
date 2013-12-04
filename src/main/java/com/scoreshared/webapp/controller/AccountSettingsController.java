package com.scoreshared.webapp.controller;

import java.io.UnsupportedEncodingException;
import java.util.logging.Logger;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import nl.captcha.Captcha;

import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

import com.scoreshared.business.bo.UserBo;
import com.scoreshared.business.persistence.User;
import com.scoreshared.scaffold.LoggedUser;

@Controller
public class AccountSettingsController extends BaseController {

    protected Logger logger = Logger.getLogger(AccountSettingsController.class.getName());

    @Inject
    private UserBo userBo;

    @Inject
    private MessageSource messageResource;

    @Inject
    private LocaleResolver localeResolver;

    @RequestMapping(value = "/accountSettings/closeAccount", method = RequestMethod.GET)
    public String getCloseAccountForm(ModelMap map) {
        map.addAttribute("reason", "");
        return "account-settings/close-account";
    }

    @RequestMapping(value = "/accountSettings/closeAccount", method = RequestMethod.POST)
    public ModelAndView postCloseAccountForm(HttpServletRequest request, @LoggedUser User loggedUser,
            @ModelAttribute(value = "captchaAnswer") String captchaAnswer,
            @ModelAttribute(value = "reason") String reasonsNotToUseScoreshared, HttpSession session) {
        try {
            Captcha captcha = (Captcha) request.getSession().getAttribute(Captcha.NAME);
            request.setCharacterEncoding("UTF-8");
            if (captcha.isCorrect(captchaAnswer)) {
                userBo.closeAccount(loggedUser, reasonsNotToUseScoreshared);
                session.invalidate();
                // FIXME: send email
                return new ModelAndView("redirect:/app");

            } else {
                ModelAndView result = new ModelAndView("account-settings/close-account");
                result.addObject(
                        "errorMessage",
                        messageResource.getMessage("error.invalid_characters_please_try_again", null,
                                localeResolver.resolveLocale(request)));
                result.addObject("reason", reasonsNotToUseScoreshared);
                return result;
            }
        } catch (UnsupportedEncodingException e) {
            logger.severe(e.toString());
            throw new RuntimeException(e);
        }
    }
}