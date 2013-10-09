package com.scoreshared.webapp.controller;

import java.io.IOException;
import java.util.Date;

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
import org.springframework.web.multipart.MultipartFile;

import com.scoreshared.business.bo.UserBo;
import com.scoreshared.business.persistence.File;
import com.scoreshared.business.persistence.User;
import com.scoreshared.scaffold.LoggedUser;
import com.scoreshared.scaffold.UserLoggedListener;
import com.scoreshared.webapp.dto.WelcomeStep1Form;
import com.scoreshared.webapp.dto.WelcomeStep3Form;
import com.scoreshared.webapp.validation.WelcomeStep1FormValidator;

@Controller
@RequestMapping(value = "/welcome")
@SessionAttributes({ "welcomeStep1Form", "welcomeStep3Form" })
public class WelcomeController extends BaseController {

    @Inject
    private UserBo bo;

    @Inject
    private ConnectionRepository connectionRepository;

    @InitBinder
    protected void initBinder(WebDataBinder binder, WebRequest request) {
        if (binder.getTarget() instanceof WelcomeStep1Form) {
            binder.setValidator(new WelcomeStep1FormValidator());
        }
    }

    @RequestMapping(value = "/step1", method = RequestMethod.GET)
    public String getStep1(ModelMap modelMap) {
        if (!modelMap.containsAttribute("welcomeStep1Form")) {
            modelMap.addAttribute(new WelcomeStep1Form());
        }
        return "welcome/step1";
    }

    @RequestMapping(value = "/step1", method = RequestMethod.POST)
    public String validateAndSaveStep1(@LoggedUser User loggedUser, ModelMap modelMap,
            @ModelAttribute @Valid WelcomeStep1Form form, BindingResult result) {
        if (result.hasErrors()) {
            return "welcome/step1";
        }
        bo.saveProfile(loggedUser, form.getProfile(), form.getCoach());
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
    public String getStep3(ModelMap modelMap) {
        if (!modelMap.containsAttribute("welcomeStep3Form")) {
            modelMap.addAttribute(new WelcomeStep3Form());
        }
        return "welcome/step3";
    }

    @RequestMapping(value = "/step3", method = RequestMethod.POST)
    public String saveStep3(@ModelAttribute WelcomeStep3Form step3Form, @LoggedUser User loggedUser,
            HttpSession session, SessionStatus status) {
        try {
            if (Boolean.TRUE.equals(step3Form.getAvatarUploaded())) {
                createFileAndSaveAvatar(loggedUser, session, step3Form.getFile());
                step3Form.setAvatarUploaded(Boolean.FALSE);
                return "welcome/step3";
            }
            if (getSavedAvatar(session) != null) {
                bo.cropResizeAndSaveAvatars(loggedUser, getSavedAvatar(session), step3Form.getX().intValue(), step3Form
                        .getY().intValue(), step3Form.getX2().intValue(), step3Form.getY2().intValue());
                session.setAttribute(UserLoggedListener.LOGGED_USER_AVATAR_HASH, loggedUser.getProfile().getAvatarHash());
            }

            status.setComplete();

            cleanSavedAvatar(session);

            return "redirect:/app/home";
        } catch (IOException e) {
            throw new RuntimeException();
        }
    }

    private File createFileAndSaveAvatar(User loggedUser, HttpSession session, MultipartFile avatar) throws IOException {
        File file = new File();
        file.setDate(new Date());
        if (avatar.getOriginalFilename().length() > 45) {
            file.setName(avatar.getOriginalFilename().substring(avatar.getOriginalFilename().length() - 45,
                    avatar.getOriginalFilename().length()));
        } else {
            file.setName(avatar.getOriginalFilename());
        }
        file.setSize(avatar.getSize());
        file.setData(avatar.getBytes());
        file.setOwner(loggedUser);

        saveAvatar(session, file);

        return file;
    }

    private void saveAvatar(HttpSession session, File file) {
        session.setAttribute("savedFile", file);
    }

    private File getSavedAvatar(HttpSession session) {
        return (File) session.getAttribute("savedFile");
    }

    private void cleanSavedAvatar(HttpSession session) {
        session.removeAttribute("savedFile");
    }
}