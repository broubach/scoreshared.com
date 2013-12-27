package com.scoreshared.webapp.validation;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.scoreshared.webapp.dto.PersonalInformationForm;

@Component
public class PersonalInformationFormValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return PersonalInformationForm.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "profile.showContactInfoToFriends",
                "error.field_is_required");
    }
}
