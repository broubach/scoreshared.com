package com.scoreshared.webapp.controller;

import java.io.UnsupportedEncodingException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Logger;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nl.captcha.Captcha;

import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.security.web.context.HttpRequestResponseHolder;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

import com.scoreshared.business.bo.UserBo;
import com.scoreshared.business.persistence.User;
import com.scoreshared.webapp.view.dto.SignupForm;

@Controller
@SessionAttributes(types = SignupForm.class)
public class IndexController {

    protected Logger logger = Logger.getLogger(IndexController.class.getName());

    @Inject
    private UserBo userBo;

    @Inject
    private MessageSource messageResource;

    @Inject
    private LocaleResolver localeResolver;

    @Inject
    private Md5PasswordEncoder passwordEncoder;

    @Inject
    private AuthenticationManager authenticationManager;

    @Inject
    private HttpSessionSecurityContextRepository contextRepository;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView("index");
        mav.addObject("thisYear", Calendar.getInstance().get(Calendar.YEAR));
        mav.addObject(new SignupForm());
        return mav;
    }

    @ResponseBody
    @RequestMapping(value = "/signup/data", method = RequestMethod.POST)
    public Map<String, Object> validateUserData(HttpServletRequest request, @ModelAttribute SignupForm form) {
        Map<String, Object> result = new HashMap<String, Object>();

        boolean hasEmptyFields = false;

        if (form.getFirstName() == null || form.getFirstName().trim().equals("")) {
            hasEmptyFields = true;
        }

        if (form.getLastName() == null || form.getLastName().trim().equals("")) {
            hasEmptyFields = true;
        }

        if (form.getEmail() == null || form.getEmail().trim().equals("")) {
            hasEmptyFields = true;
        }

        if (form.getEmailConfirmation() == null || form.getEmailConfirmation().trim().equals("")) {
            hasEmptyFields = true;
        }

        if (form.getPassword() == null || form.getPassword().trim().equals("")) {
            hasEmptyFields = true;
        }

        if (form.getGender() == null || form.getGender().trim().equals("")) {
            hasEmptyFields = true;
        }

        if (0 == form.getBirthDay()) {
            hasEmptyFields = true;
        }
        if (-1 == form.getBirthMonth()) {
            hasEmptyFields = true;
        }
        if (0 == form.getBirthYear()) {
            hasEmptyFields = true;
        }

        if (hasEmptyFields) {
            result.put(
                    "errorMessage",
                    messageResource.getMessage("error.please_fill_out_all_fields", null,
                            localeResolver.resolveLocale(request)));

        } else {
            if (form.getEmail().indexOf('@') == -1 || form.getEmail().indexOf('.') == -1) {
                result.put(
                        "errorMessage",
                        messageResource.getMessage("error.type_in_valid_email", null,
                                localeResolver.resolveLocale(request)));

            } else if (!form.getEmail().trim().equals(form.getEmailConfirmation().trim())) {
                result.put(
                        "errorMessage",
                        messageResource.getMessage("error.emails_do_not_match", null,
                                localeResolver.resolveLocale(request)));

            } else if (userBo.checkEmailExists(form.getEmail().trim())) {
                result.put(
                        "errorMessage",
                        messageResource.getMessage("error.the_specified_email_already_exists", null,
                                localeResolver.resolveLocale(request)));
            }

            if (form.getPassword().length() < 6) {
                if (result.get("errorMessage") == null) {
                    result.put("errorMessage", messageResource.getMessage(
                            "error.the_password_must_have_at_least_6_characters", null,
                            localeResolver.resolveLocale(request)));
                } else {
                    result.put(
                            "errorMessage",
                            new Object[] {
                                    result.get("errorMessage"),
                                    messageResource.getMessage("error.the_password_must_have_at_least_6_characters",
                                            null, localeResolver.resolveLocale(request)) });
                }
            }
        }

        return result;
    }

    @RequestMapping(value = "/signup/captcha", method = RequestMethod.GET)
    public String getCaptchaSnippet() {
        return "captchaSnippet";
    }

    @ResponseBody
    @RequestMapping(value = "/signup/captcha", method = RequestMethod.POST)
    public Map<String, Object> validateCaptcha(HttpServletRequest request, HttpServletResponse response,
            @ModelAttribute(value = "captchaAnswer") String captchaAnswer, @ModelAttribute SignupForm form,
            SessionStatus sessionStatus) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            Captcha captcha = (Captcha) request.getSession().getAttribute(Captcha.NAME);
            request.setCharacterEncoding("UTF-8");
            if (captcha.isCorrect(captchaAnswer)) {
                User user = form.toUser();
                user.setPassword(passwordEncoder.encodePassword(form.getPassword(), form.getEmail()));
                userBo.createUser(user);

                addUserToSession(request, response, form.getEmail(), form.getPassword());

                sessionStatus.setComplete();
            } else {
                result.put(
                        "errorMessage",
                        messageResource.getMessage("error.text_do_not_match_try_again", null,
                                localeResolver.resolveLocale(request)));
            }

            return result;
        } catch (UnsupportedEncodingException e) {
            logger.severe(e.toString());
            result.put("severe", messageResource.getMessage("severe", null, localeResolver.resolveLocale(request)));
            return result;
        }
    }

    private void addUserToSession(HttpServletRequest request, HttpServletResponse response, String email,
            String password) {
        HttpRequestResponseHolder holder = new HttpRequestResponseHolder(request, response);
        contextRepository.loadContext(holder);

        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(email, password);
        token.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
        Authentication authentication = authenticationManager.authenticate(token);
        SecurityContextHolder.getContext().setAuthentication(authentication);

        contextRepository.saveContext(SecurityContextHolder.getContext(), holder.getRequest(), holder.getResponse());
    }
}
