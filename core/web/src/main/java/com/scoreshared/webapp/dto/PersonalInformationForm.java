package com.scoreshared.webapp.dto;

import com.scoreshared.domain.entity.Profile;

public class PersonalInformationForm {

    private Profile profile;
    private String coach;

    public PersonalInformationForm() {
        this.profile = new Profile();
    }

    public PersonalInformationForm(Profile profile) {
        this.profile = (Profile) profile.clone();
        if (profile.getCoach() != null) {
            this.coach = profile.getCoach().getName();
        }
    }

    public Profile getProfile() {
        return profile;
    }

    public void setProfile(Profile profile) {
        this.profile = profile;
    }

    public String getCoach() {
        return coach;
    }

    public void setCoach(String coach) {
        this.coach = coach;
    }
}
