package com.scoreshared.webapp.validation;

import java.util.Locale;

import org.springframework.context.MessageSource;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.scoreshared.webapp.dto.BasicInformationForm;

public class BasicInformationFormValidator implements Validator {

    private MessageSource messageResource;
    private Locale locale;

    public BasicInformationFormValidator(MessageSource messageResource, Locale locale) {
        this.messageResource = messageResource;
        this.locale = locale;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return BasicInformationForm.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "error.field__is_required",
                new String[] { messageResource.getMessage("label.email", null, locale).toLowerCase() });
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "error.field__is_required",
                new String[] { messageResource.getMessage("label.first_name", null, locale).toLowerCase() });
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "error.field__is_required",
                new String[] { messageResource.getMessage("label.last_name", null, locale).toLowerCase() });
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "gender", "error.field__is_required",
                new String[] { messageResource.getMessage("label.gender", null, locale).toLowerCase() });
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "birthday", "error.field__is_required",
                new String[] { messageResource.getMessage("label.birthday", null, locale).toLowerCase() });
    }
}
