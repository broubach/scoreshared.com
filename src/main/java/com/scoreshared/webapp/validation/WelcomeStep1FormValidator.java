package com.scoreshared.webapp.validation;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
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
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "showContactToPlayers", "error.please_fill_out_all_fields");
        if (Boolean.TRUE.toString().equals(errors.getFieldValue("showContactToPlayers"))) {
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phoneNumber", "error.please_fill_out_all_fields");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "agree", "error.please_fill_out_all_fields");
    }
}
