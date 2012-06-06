package com.scoreshared.business.persistence;

import java.util.ArrayList;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;

@Entity
@NamedQueries({ @NamedQuery(name = "existentEmailQuery", query = "from User user where user.email = ?") })
@Table(name = "user")
public class User extends BaseEntity {

    private String firstName;
    private String lastName;
    private String email;
    private Date birthday;
    private String password;
    private String gender;

    @OneToOne
    private Profile profile;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Profile getProfile() {
        return profile;
    }

    public void setProfile(Profile profile) {
        this.profile = profile;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public org.springframework.security.core.userdetails.User toSecurityUser() {
        return new org.springframework.security.core.userdetails.User(email, password,
                new ArrayList<GrantedAuthority>());
    }
}