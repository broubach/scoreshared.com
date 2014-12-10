package com.scoreshared.webapp.controller;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.LocaleResolver;

import com.scoreshared.business.bo.PlayerBo;
import com.scoreshared.business.bo.UserBo;
import com.scoreshared.business.exception.EmptyPlayerNameException;
import com.scoreshared.business.exception.LongPlayerNameException;
import com.scoreshared.business.exception.PlayerLinkedException;
import com.scoreshared.domain.entity.Player;
import com.scoreshared.domain.entity.User;
import com.scoreshared.scaffold.LoggedUser;
import com.scoreshared.scaffold.UserLoggedListener;
import com.scoreshared.webapp.dto.BasicInformationForm;
import com.scoreshared.webapp.validation.BasicInformationFormValidator;

@Controller
@SessionAttributes({ "basicInformationForm"})
public class ProfileBasicInformationController {

    @Inject
    private UserBo userBo;

    @Inject
    private PlayerBo playerBo;

    @Inject
    private MessageSource messageResource;

    @Inject
    private LocaleResolver localeResolver;

    @InitBinder
    protected void initBinder(WebDataBinder binder, WebRequest request) {
        if (binder.getTarget() instanceof BasicInformationForm) {
            binder.setValidator(new BasicInformationFormValidator(messageResource, localeResolver
                    .resolveLocale(((ServletRequestAttributes) request).getRequest())));
        }
    }

    @RequestMapping(value = "/profile/basic-information", method = RequestMethod.GET)
    public String getBasicInformation(ModelMap modelMap, @LoggedUser User loggedUser, HttpServletRequest request) {
        BasicInformationForm form = new BasicInformationForm(loggedUser, messageResource,
                localeResolver.resolveLocale(request));
        modelMap.addAttribute(form);

        return "/profile/basic-information";
    }

    @RequestMapping(value = "/profile/basic-information", method = RequestMethod.POST)
    public String validateAndSaveBasicInformation(@LoggedUser User loggedUser,
            @ModelAttribute @Valid BasicInformationForm form, BindingResult result, HttpServletRequest request) {
        if (!result.hasErrors()) {
            boolean informationUpdated = false;
            if (!form.getEmail().trim().equalsIgnoreCase(loggedUser.getEmail())
                    || !StringUtils.isEmpty(form.getEmailConfirmation())) {
                if (form.getEmailConfirmation() != null
                        && form.getEmailConfirmation().trim().equalsIgnoreCase(form.getEmail().trim())) {
                    if (!userBo.updateEmail(loggedUser, form.getEmail().trim())) {
                        result.rejectValue("email", "error.the_specified_email_already_exists");
                    } else {
                        informationUpdated = true;
                    }
                } else {
                    result.rejectValue("emailConfirmation", "error.emails_do_not_match");
                }
            }

            if (!StringUtils.isEmpty(form.getPassword())) {
                if (!userBo.updatePassword(loggedUser, form.getPassword(), false, localeResolver.resolveLocale(request))) {
                    result.rejectValue("password", "error.the_password_must_have_at_least_6_characters");
                } else {
                    informationUpdated = true;
                }
            }

            boolean shouldUpdateUser = false;
            boolean shouldRenamePlayer = false;
            if (!loggedUser.getFirstName().equalsIgnoreCase(form.getFirstName().trim())) {
                loggedUser.setFirstName(form.getFirstName().trim());
                shouldRenamePlayer = true;
                shouldUpdateUser = true;
            }
            if (!loggedUser.getLastName().equalsIgnoreCase(form.getLastName().trim())) {
                loggedUser.setLastName(form.getLastName().trim());
                shouldRenamePlayer = true;
                shouldUpdateUser = true;
            }
            if (!form.getGender().equals(String.valueOf(loggedUser.getGender()))) {
                loggedUser.setGender(form.getGender().charAt(0));
                shouldUpdateUser = true;
            }
            try {
                Date birthday = form.getBirthdayAsDatetime();
                if (!isDateMonthAndYearEqual(birthday, loggedUser.getBirthday())) {
                    loggedUser.setBirthday(birthday);
                    shouldUpdateUser = true;
                }
            } catch (ParseException e) {
                result.rejectValue("birthday", "error.invalid_date_format");
                shouldUpdateUser = false;
            }

            try {
                Player player = null;
                if (shouldRenamePlayer) {
                    player = (Player) request.getSession().getAttribute(UserLoggedListener.ASSOCIATED_PLAYER);
                    playerBo.renamePlayer(player.getId(), loggedUser.getFullName(), loggedUser.getId(), true);

                    informationUpdated = true;
                }

                if (shouldUpdateUser) {
                    userBo.updateUser(loggedUser);
                    informationUpdated = true;
                }

                if (player != null) {
                    player = playerBo.findPlayerByAssociationAndOwner(loggedUser.getId(), loggedUser.getId());
                    request.getSession().setAttribute(UserLoggedListener.ASSOCIATED_PLAYER, player);
                }

            } catch (PlayerLinkedException e) {
                throw new RuntimeException("Linked player exception that should never be thrown", e);
            } catch (EmptyPlayerNameException e) {
                informationUpdated = false;
                result.reject("error.player_name_cannot_be_empty");
            } catch (LongPlayerNameException e) {
                informationUpdated = false;
                result.reject("error.player_name_cannot_be_longer_than_255_characters");
            }

            if (informationUpdated) {
                result.reject("label.profile_updated_successfully");
            }
        }

        return "/profile/basic-information";
    }

    private boolean isDateMonthAndYearEqual(Date leftDate, Date rightDate) {
        Calendar cal1 = Calendar.getInstance();
        cal1.setTime(leftDate);
        
        Calendar cal2 = Calendar.getInstance();
        cal2.setTime(rightDate);
        return cal1.get(Calendar.DATE) == cal2.get(Calendar.DATE)
                && cal1.get(Calendar.MONTH) == cal2.get(Calendar.MONTH)
                && cal1.get(Calendar.YEAR) == cal2.get(Calendar.YEAR);
    }
}