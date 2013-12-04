package com.scoreshared.webapp.controller;

import java.io.UnsupportedEncodingException;
import java.util.Calendar;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;
import java.util.logging.Logger;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nl.captcha.Captcha;

import org.springframework.context.MessageSource;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.UserProfile;
import org.springframework.social.connect.web.ProviderSignInUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

import com.scoreshared.business.bo.GraphBo;
import com.scoreshared.business.bo.UserBo;
import com.scoreshared.business.persistence.Player;
import com.scoreshared.business.persistence.User;
import com.scoreshared.scaffold.SecurityHelper;
import com.scoreshared.webapp.dto.SignupForm;

@Controller
@RequestMapping(value = "/signup")
@SessionAttributes({ "signupForm" })
public class SignupController extends BaseController {

    protected Logger logger = Logger.getLogger(SignupController.class.getName());

    @Inject
    private UserBo userBo;

    @Inject
    private GraphBo graphBo;

    @Inject
    private MessageSource messageResource;

    @Inject
    private LocaleResolver localeResolver;

    @Inject
    private Md5PasswordEncoder passwordEncoder;

    @Inject
    private SecurityHelper securityHelper;

    @RequestMapping(value = "/receiveInvitation/{invitationHash}", method = RequestMethod.GET)
    public ModelAndView receiveInvitation(HttpServletRequest request, @PathVariable String invitationHash) {
        ModelAndView mav = signup(request);
        Player player = graphBo.findPlayerByInvitationHash(invitationHash);
        if (player != null) {
            SignupForm form = (SignupForm) mav.getModel().get("signupForm");
            form.setInvitationHash(invitationHash);
            form.setEmail(player.getInvitationEmail());
            form.setEmailConfirmation(player.getInvitationEmail());
        }
        return mav;
    }

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView signup(HttpServletRequest request) {
        ModelAndView mav = getSignupSnippet(request);
        mav.addObject(new SignupForm());
        mav.setViewName("signup/signup");

        return mav;
    }

    @RequestMapping(value = "/connection", method = RequestMethod.GET)
    public String signupWithProviderConnection(WebRequest webRequest, HttpServletRequest request, HttpServletResponse response) {
        Connection<?> connection = ProviderSignInUtils.getConnection(webRequest);
        if (connection != null) {
            SignupForm form = new SignupForm();
            UserProfile userProfile = connection.fetchUserProfile();
            form.setEmail(userProfile.getEmail());
            form.setFirstName(userProfile.getFirstName());
            form.setLastName(userProfile.getLastName());
            userBo.saveNewUser(form.toUser(), null);

            // TODO: fetch image from profile

            ProviderSignInUtils.handlePostSignUp(userProfile.getEmail(), webRequest);
            
            securityHelper.authenticateUserWithSocialId(request, response, userProfile.getEmail(), connection.getKey()
                    .getProviderId(), connection.getKey().getProviderUserId());

        }
        return "redirect:/app/welcome/step1";
    }

    @RequestMapping(value = "/data", method = RequestMethod.GET)
    public ModelAndView getSignupSnippet(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("signup/signup-snippet");
        Map<String, String> yearHash = new TreeMap<String, String>(new Comparator<String>() {
            @Override
            public int compare(String o1, String o2) {
                return o2.compareTo(o1);
            }
        });
        yearHash.put("9999", messageResource.getMessage("label.year", null, localeResolver.resolveLocale(request)));

        for (int i = 1900; i <= Calendar.getInstance().get(Calendar.YEAR); i++) {
            yearHash.put(String.valueOf(i), String.valueOf(i));
        }
        mav.addObject("yearHash", yearHash);
        return mav;
    }

    @ResponseBody
    @RequestMapping(value = "/data", method = RequestMethod.POST)
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
        if (9999 == form.getBirthYear()) {
            hasEmptyFields = true;
        }

        if (hasEmptyFields) {
            result.put(
                    "errorMessage",
                    messageResource.getMessage("error.please_fill_out_all_fields", null,
                            localeResolver.resolveLocale(request)));

        } else {
            if (userBo.isEmailValid(form.getEmail())) {
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

            if (userBo.isPasswordValid(form.getPassword())) {
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

    @RequestMapping(value = "/captcha", method = RequestMethod.GET)
    public String getCaptchaSnippet() {
        return "signup/captcha-snippet";
    }

    @ResponseBody
    @RequestMapping(value = "/captcha", method = RequestMethod.POST)
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
                userBo.saveNewUser(user, form.getInvitationHash());

                securityHelper.authenticateUserWithPassword(request, response, form.getEmail(), form.getPassword());

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
}
