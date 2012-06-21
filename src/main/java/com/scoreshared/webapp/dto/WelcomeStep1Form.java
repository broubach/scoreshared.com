package com.scoreshared.webapp.dto;

import com.scoreshared.business.persistence.Profile;
import com.scoreshared.business.persistence.User;

public class WelcomeStep1Form {

    private Profile profile;
    private Boolean agree;

    public WelcomeStep1Form(User loggedUser) {
        this.profile = new Profile();
        loggedUser.setProfile(profile);
    }

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
