package com.scoreshared.business.persistence;

public class Profile extends BaseEntity {

    private String city;
    private String country;
    private String club;
    private Boolean leftHanded;
    private String coach;
    private Boolean showContactInfoToFriends;
    private String phone;

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

    public String getCoach() {
        return coach;
    }

    public void setCoach(String coach) {
        this.coach = coach;
    }

    public Boolean getShowContactInfoToFriends() {
        return showContactInfoToFriends;
    }

    public void setShowContactInfoToFriends(Boolean showContactInfoToFriends) {
        this.showContactInfoToFriends = showContactInfoToFriends;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
