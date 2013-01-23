package com.scoreshared.webapp.dto;

import com.scoreshared.business.persistence.Profile;

public class WelcomeStep1Form {

    private Profile profile;
    private String coach;
    private Boolean agree;

    public WelcomeStep1Form() {
        this.profile = new Profile();
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

    public Boolean getAgree() {
        return agree;
    }

    public void setAgree(Boolean agree) {
        this.agree = agree;
    }
}
