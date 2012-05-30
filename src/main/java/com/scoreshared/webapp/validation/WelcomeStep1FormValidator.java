package com.scoreshared.webapp.validation;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.scoreshared.webapp.dto.WelcomeStep1Form;

@Component
public class WelcomeStep1FormValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return WelcomeStep1Form.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        //        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "agree", "error.bad_credentials");
        //        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "showContactToPlayers", "error.bad_credentials");
    }
}
