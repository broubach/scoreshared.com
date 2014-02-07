package com.scoreshared.business.persistence;

import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import org.apache.commons.beanutils.BeanUtils;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;

@Entity
@Table(name = "profile")
@NamedQuery(name = "profileDetailsQuery", query = "from User user where (:city is null or user.profile.city like :city) and (:country is null or user.profile.country like :country) and (:firstName is null or user.firstName like :firstName) and (:lastName is null or user.lastName like :lastName)")
@SQLDelete(sql="UPDATE profile SET deleted = 1 WHERE id = ?")
@Where(clause="deleted <> 1")
public class Profile extends BaseEntity implements Cloneable {

    private String city;
    private String country;
    private String academy;

    @Column(columnDefinition = "BIT", length = 1)
    private Boolean leftHanded;

    @ManyToOne(fetch = FetchType.EAGER)
    @Cascade({ CascadeType.SAVE_UPDATE })
    private Player coach;

    @Column(columnDefinition = "BIT", length = 1)
    private Boolean showContactInfoToFriends;
    private String phone;
    private String avatarHash;
    private String style;
    private String site;

    @ManyToOne(fetch = FetchType.LAZY)
    @Cascade({ CascadeType.ALL })
    private File avatar;

    @ManyToOne(fetch = FetchType.LAZY)
    @Cascade({ CascadeType.ALL })
    private File smallAvatar;

    private SportEnum sport;

    @Column(columnDefinition = "BIT", length = 1)
    private Boolean signupProcessCompleted;

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

    public Boolean getSignupProcessCompleted() {
        return signupProcessCompleted;
    }

    public void setSignupProcessCompleted(Boolean signupProcessCompleted) {
        this.signupProcessCompleted = signupProcessCompleted;
    }

    @Override
    public Object clone() {
        Profile newProfile = new Profile();
        try {
            BeanUtils.copyProperties(newProfile, this);
            return newProfile;
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (InvocationTargetException e) {
            throw new RuntimeException(e);
        }
    }

    private String[] getDirtyProperties(Profile currentState) {
        List<String> dirtyProperties = new ArrayList<String>();
        BeanWrapper currentStateWrapper = new BeanWrapperImpl(currentState);
        BeanWrapper initialStateWrapper = new BeanWrapperImpl(this);
        for (PropertyDescriptor propertyDescriptor : currentStateWrapper.getPropertyDescriptors()) {
            if (initialStateWrapper.getPropertyValue(propertyDescriptor.getName()) != null 
                    && !initialStateWrapper.getPropertyValue(propertyDescriptor.getName()).equals(currentStateWrapper.getPropertyValue(propertyDescriptor.getName()))
                    && propertyDescriptor.getWriteMethod() != null) {
                dirtyProperties.add(propertyDescriptor.getName());
            }
        }

        return dirtyProperties.toArray(new String[dirtyProperties.size()]);
    }

    public Profile copyDirtyPropertiesFrom(Profile current) {
        BeanWrapper currentStateWrapper = new BeanWrapperImpl(current);
        BeanWrapper initialStateWrapper = new BeanWrapperImpl(this);
        String[] dirtyProperties = getDirtyProperties(current);
        if (dirtyProperties.length > 0) {
            for (String dirtyProperty : dirtyProperties) {
                initialStateWrapper.setPropertyValue(dirtyProperty, currentStateWrapper.getPropertyValue(dirtyProperty));
            }
            return this;
        }
        return null;
    }
}