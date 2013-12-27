package com.scoreshared.webapp.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.twitter.api.Twitter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;

import com.scoreshared.business.bo.UserBo;
import com.scoreshared.business.persistence.User;
import com.scoreshared.scaffold.AvatarHelper;
import com.scoreshared.scaffold.LoggedUser;
import com.scoreshared.webapp.dto.ProfileAvatarForm;
import com.scoreshared.webapp.dto.PersonalInformationForm;
import com.scoreshared.webapp.validation.PersonalInformationFormValidator;

@Controller
@RequestMapping(value = "/welcome")
@SessionAttributes({ "personalInformationForm", "profileAvatarForm" })
public class WelcomeController extends BaseController {

    @Inject
    private UserBo bo;

    @Inject
    private ConnectionRepository connectionRepository;
    
    @Inject
    private AvatarHelper avatarHelper;

    @InitBinder
    protected void initBinder(WebDataBinder binder, WebRequest request) {
        if (binder.getTarget() instanceof PersonalInformationForm) {
            binder.setValidator(new PersonalInformationFormValidator());
        }
    }

    @RequestMapping(value = "/step1", method = RequestMethod.GET)
    public String getStep1(ModelMap modelMap) {
        if (!modelMap.containsAttribute("personalInformationForm")) {
            modelMap.addAttribute(new PersonalInformationForm());
        }
        return "welcome/step1";
    }

    @RequestMapping(value = "/step1", method = RequestMethod.POST)
    public String validateAndSaveStep1(@LoggedUser User loggedUser, ModelMap modelMap,
            @ModelAttribute @Valid PersonalInformationForm form, BindingResult result, SessionStatus status) {
        if (result.hasErrors()) {
            return "welcome/step1";
        }
        bo.saveProfile(loggedUser, form.getProfile(), form.getCoach());
        status.setComplete();
        return getStep2(modelMap);
    }

    @RequestMapping(value = "/step2", method = RequestMethod.GET)
    public String getStep2(ModelMap modelMap) {
        Connection<Twitter> twitterConnection = connectionRepository.findPrimaryConnection(Twitter.class);
        if (twitterConnection != null) {
            modelMap.addAttribute("twitterAccount", twitterConnection.fetchUserProfile().getUsername());
            modelMap.addAttribute("twitterConnected", true);
        } else {
            modelMap.addAttribute("twitterConnected", false);
        }

        Connection<Facebook> facebookConnection = connectionRepository.findPrimaryConnection(Facebook.class);
        if (facebookConnection != null) {
            modelMap.addAttribute("facebookAccount", facebookConnection.fetchUserProfile().getUsername());
            modelMap.addAttribute("facebookConnected", true);
        } else {
            modelMap.addAttribute("facebookConnected", false);
        }
        return "welcome/step2";
    }

    @RequestMapping(value = "/step3", method = RequestMethod.GET)
    public String getStep3(ModelMap modelMap, @LoggedUser User loggedUser, HttpSession session, SessionStatus status) {
        avatarHelper.getProfileAvatar(modelMap, loggedUser, session, status);
        return "welcome/step3";
    }

    @RequestMapping(value = "/step3", method = RequestMethod.POST)
    public String saveStep3(@ModelAttribute ProfileAvatarForm step3Form, @LoggedUser User loggedUser,
            HttpSession session, SessionStatus status) {
        boolean avatarUploaded = false;
        if (Boolean.TRUE.equals(step3Form.getAvatarUploaded())) {
            avatarUploaded = true;
        }
        avatarHelper.postProfileAvatar(step3Form, loggedUser, session, status);
        if (avatarUploaded) {
            return "welcome/step3";
        }

        return "redirect:/app/home";
    }
}