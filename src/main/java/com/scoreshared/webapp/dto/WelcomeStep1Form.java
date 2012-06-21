package com.scoreshared.webapp.dto;

import com.scoreshared.business.persistence.Profile;

public class WelcomeStep1Form {

    private Profile profile;
    private Boolean agree;

    public Profile getProfile() {
        return profile;
    }

    public void setProfile(Profile profile) {
        this.profile = profile;
    }

    public Boolean getAgree() {
        return agree;
    }

    public void setAgree(Boolean agree) {
        this.agree = agree;
    }
}
