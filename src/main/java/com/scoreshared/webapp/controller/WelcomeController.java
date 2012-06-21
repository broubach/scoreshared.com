package com.scoreshared.webapp.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionRepository;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.scoreshared.business.bo.UserBo;
import com.scoreshared.business.persistence.File;
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
    protected void initBinder(WebDataBinder binder) {
        if (binder.getTarget() instanceof WelcomeStep1Form) {
            binder.setValidator(new WelcomeStep1FormValidator());
        }

        // TODO: will there be a validator for the Step3Form?
    }

    @RequestMapping(value = "/step1", method = RequestMethod.GET)
    public ModelAndView getStep1() {
        ModelAndView mav = new ModelAndView("welcome/step1");
        mav.addObject(new WelcomeStep1Form());
        return mav;
    }

    @RequestMapping(value = "/step1", method = RequestMethod.POST)
    public ModelAndView validateAndSaveStep1(@ModelAttribute @Valid WelcomeStep1Form form, BindingResult result) {
        if (result.hasErrors()) {
            ModelAndView mav = getStep1();
            mav.addObject(form);
            return mav;
        }
        bo.save(form.getProfile());
        return getStep2();
    }

    @RequestMapping(value = "/step2", method = RequestMethod.GET)
    public ModelAndView getStep2() {
        ModelAndView mav = new ModelAndView("welcome/step2");
        Connection<Twitter> connection = connectionRepository.findPrimaryConnection(Twitter.class);
        if (connection != null) {
            mav.addObject("twitterAccount", connection.fetchUserProfile().getUsername());
            mav.addObject("twitterConnected", true);
        } else {
            mav.addObject("twitterConnected", false);
        }
        return mav;
    }

    @RequestMapping(value = "/step3", method = RequestMethod.GET)
    public ModelAndView getStep3() {
        ModelAndView mav = new ModelAndView("welcome/step3");
        mav.addObject(new WelcomeStep3Form());
        return mav;
    }

    @RequestMapping(value = "/step3", method = RequestMethod.POST)
    public String saveStep3(Principal loggedUser, ModelMap modelMap, HttpSession session, SessionStatus status) {
        try {
            WelcomeStep3Form step3Form = (WelcomeStep3Form) modelMap.get("welcomeStep3Form");
            if (Boolean.TRUE.equals(step3Form.getAvatarUploaded())) {
                createFileAndSaveAvatar(session, step3Form.getFile());
                step3Form.setAvatarUploaded(Boolean.FALSE);
                return "welcome/step3";
            }
            bo.cropResizeAndSaveAvatars(getLoggedUser(session), getSavedAvatar(session), step3Form.getX().intValue(),
                    step3Form.getY().intValue(), step3Form.getX2().intValue(), step3Form.getY2().intValue());

            status.setComplete();

            cleanSavedAvatar(session);

            return "redirect:/app/home";
        } catch (IOException e) {
            throw new RuntimeException();
        }
    }

    private File createFileAndSaveAvatar(HttpSession session, MultipartFile avatar) throws IOException {
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
        file.setOwner(getLoggedUser(session));

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