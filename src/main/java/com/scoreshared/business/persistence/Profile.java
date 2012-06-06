package com.scoreshared.business.persistence;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "profile")
public class Profile extends BaseEntity {

    private String city;
    private String country;
    private String club;
    private Boolean leftHanded;
    private String coach;
    private Boolean showContactInfoToFriends;
    private String phone;
    private String avatarHash;

    @ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.ALL })
    private File avatar;

    @ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.ALL })
    private File smallAvatar;

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

    public File getAvatar() {
        return avatar;
    }

    public void setAvatar(File avatar) {
        this.avatar = avatar;
    }

    public File getSmallAvatar() {
        return smallAvatar;
    }

    public void setSmallAvatar(File smallAvatar) {
        this.smallAvatar = smallAvatar;
    }

    public String getAvatarHash() {
        return avatarHash;
    }

    public void setAvatarHash(String avatarHash) {
        this.avatarHash = avatarHash;
    }
}
