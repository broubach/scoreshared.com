package com.scoreshared.webapp.dto;

import java.util.Calendar;

import org.springframework.social.connect.UserProfile;

import com.scoreshared.business.persistence.User;

public class SignupForm {
    private String firstName;
    private String lastName;
    private String email;
    private String emailConfirmation;
    private String password;
    private String gender;
    private int birthDay;
    private int birthMonth;
    private int birthYear;
    private String invitationHash;

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

    public int getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(int birthDay) {
        this.birthDay = birthDay;
    }

    public int getBirthMonth() {
        return birthMonth;
    }

    public void setBirthMonth(int birthMonth) {
        this.birthMonth = birthMonth;
    }

    public int getBirthYear() {
        return birthYear;
    }

    public void setBirthYear(int birthYear) {
        this.birthYear = birthYear;
    }

    public String getInvitationHash() {
        return invitationHash;
    }

    public void setInvitationHash(String invitationHash) {
        this.invitationHash = invitationHash;
    }

    public User toUser() {
        User result = new User();
        result.setFirstName(firstName.trim());
        result.setLastName(lastName.trim());
        result.setEmail(email.trim());

        Calendar birthday = Calendar.getInstance();
        birthday.set(Calendar.DATE, this.birthDay);
        birthday.set(Calendar.MONTH, this.birthMonth);
        birthday.set(Calendar.YEAR, this.birthYear);
        result.setBirthday(birthday.getTime());

        result.setGender(gender.trim().charAt(0));
        return result;
    }

    public static SignupForm fromProviderUser(UserProfile fetchUserProfile) {
        return new SignupForm();
    }
}
