package com.scoreshared.webapp.view.dto;

public class WelcomeStep1Form {

    private String city;
    private String country;
    private String club;
    private Boolean leftHanded;
    private String styleDescription;
    private Boolean showContactToPlayers;
    private String phoneNumber;
    private Boolean agree;

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getClub() {
        return club;
    }

    public void setClub(String club) {
        this.club = club;
    }

    public Boolean getLeftHanded() {
        return leftHanded;
    }

    public void setLeftHanded(Boolean leftHanded) {
        this.leftHanded = leftHanded;
    }

    public String getStyleDescription() {
        return styleDescription;
    }

    public void setStyleDescription(String styleDescription) {
        this.styleDescription = styleDescription;
    }

    public Boolean getShowContactToPlayers() {
        return showContactToPlayers;
    }

    public void setShowContactToPlayers(Boolean showContactToPlayers) {
        this.showContactToPlayers = showContactToPlayers;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Boolean getAgree() {
        return agree;
    }

    public void setAgree(Boolean agree) {
        this.agree = agree;
    }
}
