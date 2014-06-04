package com.scoreshared.webapp.dto;

import com.scoreshared.domain.entity.Profile;

public class PersonalInformationForm {

    private Profile profile;

    public PersonalInformationForm() {
        this.profile = new Profile();
    }

    public PersonalInformationForm(Profile profile) {
        this.profile = (Profile) profile.clone();
    }

    public Profile getProfile() {
        return profile;
    }

    public void setProfile(Profile profile) {
        this.profile = profile;
    }
    
    public Boolean getShowContactInfoToFriends() {
        if (profile.getShowContactInfoToFriends() == null) {
            return Boolean.FALSE;
        }
        return profile.getShowContactInfoToFriends();
    }
    
    public void setShowContactInfoToFriends(Boolean showContactInfoToFriends) {
        profile.setShowContactInfoToFriends(showContactInfoToFriends);
    }
}
