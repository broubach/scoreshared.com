package com.scoreshared.webapp.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

import com.scoreshared.business.bo.UserBo;
import com.scoreshared.webapp.view.dto.SignupForm;

@Controller
@SessionAttributes(types = SignupForm.class)
public class IndexController {

    @Inject
    private UserBo userBo;

    @Inject
    private MessageSource messageResource;

    @Inject
    private LocaleResolver localeResolver;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView("index");
        mav.addObject("thisYear", Calendar.getInstance().get(Calendar.YEAR));
        return mav;
    }

    @ResponseBody
    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public Map<String, Object> signup(HttpServletRequest request, @ModelAttribute SignupForm form) {
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

            } else if (!form.getEmail().equals(form.getEmailConfirmation())) {
                result.put(
                        "errorMessage",
                        messageResource.getMessage("error.emails_do_not_match", null,
                                localeResolver.resolveLocale(request)));

            } else if (userBo.checkEmailExists(form.getEmail())) {
                result.put(
                        "errorMessage",
                        messageResource.getMessage("error.the_specified_email_already_exists", null,
                                localeResolver.resolveLocale(request)));
            }

            if (form.getPassword().length() < 6) {
                if (result.get("errorMessage") == null) {
                    result.put("errorMessage", "error.the_password_must_have_at_least_6_characters");
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

    protected String encriptMd5(String senha) {
        byte[] defaultBytes = senha.getBytes();
        MessageDigest algorithm;
        try {
            algorithm = MessageDigest.getInstance("MD5");
            algorithm.reset();
            byte[] salt = new byte[12];
            System.arraycopy("+#5_GSgY2Wkm".getBytes(), 0, salt, 0, 12);
            algorithm.update(salt);
            algorithm.update(defaultBytes);
            byte messageDigest[] = algorithm.digest();

            StringBuffer hexString = new StringBuffer();
            for (int i = 0; i < messageDigest.length; i++) {
                hexString.append(Integer.toHexString(0xFF & messageDigest[i]));
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}
