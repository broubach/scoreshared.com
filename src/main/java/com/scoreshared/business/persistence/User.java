package com.scoreshared.business.persistence;

import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
@NamedQueries({
        @NamedQuery(name = "existentEmailQuery", query = "from User user where user.email = :email"),
        @NamedQuery(name = "existentForgotPasswordInstructionsHashQuery", query = "select 1 from User u where u.forgotPasswordInstructionsHash = :hash and :date < u.forgotPasswordInstructionsDate"),
        @NamedQuery(name = "updatePasswordQuery", query = "update User set password = :password, forgotPasswordInstructionsHash = null where forgotPasswordInstructionsHash = :hash and :date < forgotPasswordInstructionsDate"),
        @NamedQuery(name = "emailByForgotPasswordHashQuery", query = "select u.email from User u where u.forgotPasswordInstructionsHash = :hash")})
@Table(name = "user")
@SQLDelete(sql="UPDATE user SET deleted = 1 WHERE id = ?")
@Where(clause="deleted <> 1")
public class User extends BaseEntity implements UserDetails {

    private String firstName;
    private String lastName;
    private String email;
    private Date birthday;
    private String password;
    private char gender;
    private Date dateAccountWasClosed;
    private String reasonAccountWasClosed;
    private Date lastAccess;
    private Date beforeLastAccess;
    private String forgotPasswordInstructionsHash;
    private Date forgotPasswordInstructionsDate;

    @OneToOne(fetch = FetchType.EAGER)
    @Cascade({ CascadeType.DELETE })
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

    @Override
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

    public char getGender() {
        return gender;
    }

    public void setGender(char gender) {
        this.gender = gender;
    }

    public Date getDateAccountWasClosed() {
        return dateAccountWasClosed;
    }

    public void setDateAccountWasClosed(Date dateAccountWasClosed) {
        this.dateAccountWasClosed = dateAccountWasClosed;
    }

    public String getReasonAccountWasClosed() {
        return reasonAccountWasClosed;
    }

    public void setReasonAccountWasClosed(String reasonAccountWasClosed) {
        this.reasonAccountWasClosed = reasonAccountWasClosed;
    }

    public Date getLastAccess() {
        return lastAccess;
    }

    public void setLastAccess(Date lastAccess) {
        this.lastAccess = lastAccess;
    }

    public Date getBeforeLastAccess() {
        return beforeLastAccess;
    }

    public void setBeforeLastAccess(Date beforeLastAccess) {
        this.beforeLastAccess = beforeLastAccess;
    }

    public String getForgotPasswordInstructionsHash() {
        return forgotPasswordInstructionsHash;
    }

    public void setForgotPasswordInstructionsHash(String forgotPasswordInstructionsHash) {
        this.forgotPasswordInstructionsHash = forgotPasswordInstructionsHash;
    }

    public Date getForgotPasswordInstructionsDate() {
        return forgotPasswordInstructionsDate;
    }

    public void setForgotPasswordInstructionsDate(Date forgotPasswordInstructionsDate) {
        this.forgotPasswordInstructionsDate = forgotPasswordInstructionsDate;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return Collections.EMPTY_LIST;
    }

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    public String getFullName() {
        return new StringBuilder().append(firstName).append(" ").append(lastName).toString();
    }

    public int getAge() {
        Calendar now = Calendar.getInstance();
        Calendar dob = Calendar.getInstance();
        dob.setTime(getBirthday());
        if (dob.after(now)) {
          return 0;
        }
        int year1 = now.get(Calendar.YEAR);
        int year2 = dob.get(Calendar.YEAR);
        int age = year1 - year2;
        int month1 = now.get(Calendar.MONTH);
        int month2 = dob.get(Calendar.MONTH);
        if (month2 > month1) {
          age--;
        } else if (month1 == month2) {
          int day1 = now.get(Calendar.DAY_OF_MONTH);
          int day2 = dob.get(Calendar.DAY_OF_MONTH);
          if (day2 > day1) {
            age--;
          }
        }
        
        return age;
    }
}