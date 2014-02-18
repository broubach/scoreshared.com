package com.scoreshared.webapp.controller;

import javax.inject.Inject;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.WebRequest;

import com.scoreshared.business.bo.UserBo;
import com.scoreshared.domain.entity.Profile;
import com.scoreshared.domain.entity.User;
import com.scoreshared.scaffold.LoggedUser;
import com.scoreshared.webapp.dto.PersonalInformationForm;
import com.scoreshared.webapp.validation.PersonalInformationFormValidator;

@Controller
@SessionAttributes({ "personalInformationForm"})
public class ProfilePersonalInformationController {

    @Inject
    private UserBo bo;

    @InitBinder
    protected void initBinder(WebDataBinder binder, WebRequest request) {
        if (binder.getTarget() instanceof PersonalInformationForm) {
            binder.setValidator(new PersonalInformationFormValidator());
        }
    }

    @RequestMapping(value = "/profile/personal-information", method = RequestMethod.GET)
    public String getPersonalInformation(ModelMap modelMap, @LoggedUser User loggedUser) {
        PersonalInformationForm form = (PersonalInformationForm) modelMap.get("personalInformationForm");
        if (form == null) {
            form = new PersonalInformationForm((Profile) loggedUser.getProfile().clone());
            modelMap.addAttribute(form);
        }

        return "/profile/personal-information";
    }

    @RequestMapping(value = "/profile/personal-information", method = RequestMethod.POST)
    public String validateAndSavePersonalInformation(@LoggedUser User loggedUser,
            @ModelAttribute @Valid PersonalInformationForm form, BindingResult result) {
        if (!result.hasErrors() ) {
            Profile updatedProfile = loggedUser.getProfile().copyDirtyPropertiesFrom(form.getProfile());
            if (updatedProfile != null) {
                bo.saveProfile(loggedUser, updatedProfile, form.getCoach());
            }
        }
        return "/profile/personal-information";
    }
}