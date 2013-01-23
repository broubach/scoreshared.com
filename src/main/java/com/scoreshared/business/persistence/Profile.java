package com.scoreshared.business.persistence;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

@Entity
@Table(name = "profile")
@NamedQuery(name = "profileDetailsQuery", query = "from User user where (:city is null or user.profile.city like :city) and (:country is null or user.profile.country like :country) and (:firstName is null or user.firstName like :firstName) and (:lastName is null or user.lastName like :lastName)")
@SQLDelete(sql="UPDATE profile SET deleted = 1 WHERE id = ?")
@Where(clause="deleted <> 1")
public class Profile extends BaseEntity {

    private String city;
    private String country;
    private String academy;
    private Boolean leftHanded;

    @ManyToOne(fetch = FetchType.EAGER, cascade = { CascadeType.PERSIST })
    private Player coach;

    private Boolean showContactInfoToFriends;
    private String phone;
    private String avatarHash;
    private String style;
    private String site;

    @ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.ALL })
    private File avatar;

    @ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.ALL })
    private File smallAvatar;
    private SportEnum sport;

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

    public String getAcademy() {
        return academy;
    }

    public void setAcademy(String club) {
        this.academy = club;
    }

    public Boolean getLeftHanded() {
        return leftHanded;
    }

    public void setLeftHanded(Boolean leftHanded) {
        this.leftHanded = leftHanded;
    }

    public Player getCoach() {
        return coach;
    }

    public void setCoach(Player coach) {
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

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
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

    public String getLocation() {
        if (city != null && country != null && !city.isEmpty() && !country.isEmpty()) {
            return new StringBuilder().append(city).append(", ").append(country).toString();
        } else if (city != null && !city.isEmpty()) {
            return city;
        } else if (country != null && !country.isEmpty()) {
            return country;
        }
        return "";
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }

    public SportEnum getSport() {
        return sport;
    }

    public void setSport(SportEnum sport) {
        this.sport = sport;
    }
}