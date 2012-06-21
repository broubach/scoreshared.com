package com.scoreshared.webapp.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.scoreshared.webapp.dto.WelcomeStep1Form;

public class WelcomeStep1FormValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return WelcomeStep1Form.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "profile.showContactInfoToFriends",
                "error.field_is_required", "label.show_contact");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "agree", "error.field_is_required");
        if (Boolean.FALSE.toString().equals(errors.getFieldValue("agree"))) {
            errors.reject("error.please_read_service_license");
        }
    }
}
