package com.scoreshared.webapp.dto;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.context.MessageSource;

import com.scoreshared.domain.entity.User;

public class BasicInformationForm {
    private String firstName;
    private String lastName;
    private String email;
    private String emailConfirmation;
    private String password;
    private String gender;
    private String birthday;
    private DateFormat dateFormat;

    public BasicInformationForm(User user, MessageSource messageResource, Locale locale) {
        this.dateFormat = new SimpleDateFormat(messageResource.getMessage("system.date_format", null, locale));
        this.dateFormat.setLenient(false);
        this.firstName = user.getFirstName();
        this.lastName = user.getLastName();
        this.email = user.getEmail();
        this.gender = String.valueOf(user.getGender());
        this.birthday = toString(user.getBirthday());
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmailConfirmation() {
        return emailConfirmation;
    }

    public void setEmailConfirmation(String emailConfirmation) {
        this.emailConfirmation = emailConfirmation;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public DateFormat getDateFormat() {
        return dateFormat;
    }

    public void setDateFormat(DateFormat dateFormat) {
        this.dateFormat = dateFormat;
    }

    private String toString(Date birthday) {
        return dateFormat.format(birthday);
    }

    public Date getBirthdayAsDatetime() throws ParseException {
       return dateFormat.parse(birthday);
    }
}