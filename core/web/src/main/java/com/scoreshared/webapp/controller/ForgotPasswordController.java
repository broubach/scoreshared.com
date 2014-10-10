package com.scoreshared.webapp.controller;

import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.MessageSource;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.scoreshared.business.bo.UserBo;

@Controller
public class ForgotPasswordController extends BaseController {

    @Inject
    private UserBo userBo;

    @Inject
    private MessageSource messageResource;

    @Inject
    private LocaleResolver localeResolver;

    @Inject
    @Named("passwordEncoder")
    private Md5PasswordEncoder passwordEncoder;

    @RequestMapping(value = "/forgotPassword/sendInstructions", method = RequestMethod.GET)
    public String getCloseAccountForm(ModelMap modelMap) {
        modelMap.addAttribute("email", "");
        return "forgot-password/send-instructions";
    }

    @RequestMapping(value = "/forgotPassword/sendInstructions", method = RequestMethod.POST)
    public ModelAndView postCloseAccountForm(@ModelAttribute(value = "email") String email, ModelMap modelMap, HttpServletRequest request) {
        if (!userBo.checkEmailExists(email)) {
            modelMap.addAttribute(
                    "errorMessage",
                    messageResource.getMessage("error.the_specified_email_is_not_registered", null,
                            localeResolver.resolveLocale(request)));
            modelMap.addAttribute("email", email);

        } else {
            userBo.sendInstructions(email, localeResolver.resolveLocale(request));
            RedirectView redirect = new RedirectView("/app/index");
            redirect.setExposeModelAttributes(false);
            return new ModelAndView(redirect);
        }

        return new ModelAndView("forgot-password/send-instructions");
    }

    @RequestMapping(value = "/forgotPassword/resetPassword", method = RequestMethod.GET)
    public ModelAndView getResetPassword(@ModelAttribute(value = "hash") String hash, ModelMap map) {
        if (userBo.isForgotPasswordHashValid(hash)) {
            map.addAttribute("hash", hash);
            return new ModelAndView("forgot-password/reset-password");
        }
        RedirectView redirect = new RedirectView("/app/index");
        redirect.setExposeModelAttributes(false);
        return new ModelAndView(redirect);
    }

    @RequestMapping(value = "/forgotPassword/resetPassword", method = RequestMethod.POST)
    public ModelAndView postResetPassword(HttpSession session, @ModelAttribute(value = "hash") String hash,
            @ModelAttribute(value = "newPassword") String newPassword,
            @ModelAttribute(value = "newPasswordConfirmation") String newPasswordConfirmation, ModelMap modelMap,
            HttpServletRequest request) {
        if (newPassword.equals(newPasswordConfirmation)) {
            if (!userBo.isPasswordValid(newPassword)) {
                modelMap.addAttribute(
                        "errorMessage",
                        messageResource.getMessage("error.the_password_must_have_at_least_6_characters", null,
                                localeResolver.resolveLocale(request)));
                return new ModelAndView("forgot-password/reset-password");
            }

            Integer userId = userBo.findUserIdByForgotPasswordHash(hash);
            session.invalidate();
            userBo.resetPassword(hash, passwordEncoder.encodePassword(newPassword, userId));

            RedirectView redirect = new RedirectView("/app/index");
            redirect.setExposeModelAttributes(false);
            return new ModelAndView(redirect);

        } else {
            modelMap.addAttribute(
                    "errorMessage",
                    messageResource.getMessage("error.passwords_do_not_match", null,
                            localeResolver.resolveLocale(request)));
            return new ModelAndView("forgot-password/reset-password");
        }
    }
}