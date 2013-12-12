package com.scoreshared.webapp.dto;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.MessageSource;

import com.scoreshared.business.persistence.Player;
import com.scoreshared.business.persistence.User;

public class PlayerModel {

    private User user;
    private MessageSource messageResource;
    private Locale locale;
    private DateFormat dateFormat;
    private Player associatedPlayer;

    public PlayerModel(User user, Player associationPlayer, MessageSource messageResource, Locale locale) {
        this.user = user;
        this.associatedPlayer = associationPlayer;
        this.messageResource = messageResource;
        this.locale = locale;
        
        dateFormat = DateFormat.getInstance();
        String datePattern = messageResource.getMessage("system.date_format", null, locale);
        ((SimpleDateFormat) dateFormat).applyPattern(datePattern);
    }
    
    public String getAvatarHash() {
        if (user.getProfile() != null && user.getProfile().getAvatarHash() != null) {
            return user.getProfile().getAvatarHash();
        }
        return "";
    }

    public User getUser() {
        return user;
    }
    
    public boolean isConnected() {
        return associatedPlayer != null && associatedPlayer.isConnected(); 
    }
    
    public Date getInvitationDate() {
        return associatedPlayer != null ? associatedPlayer.getInvitation().getDate() : null;
    }

    public Integer getId() {
        return associatedPlayer != null ? associatedPlayer.getId() : null;
    }
    
    public String getAge() {
        StringBuilder age = new StringBuilder();
        age.append(user.getAge());
        age.append(" (");
        age.append(dateFormat.format(user.getBirthday()));
        age.append(")");
        
        return age.toString();
    }

    public String getResidence() {
        if (user.getProfile() != null && !StringUtils.isEmpty(user.getProfile().getLocation())) {
            return user.getProfile().getLocation();
        }
        return messageResource.getMessage("label.undefined", null, locale);
    }
    
    public boolean getShowContactInfoToFriends() {
        if (user.getProfile() != null && Boolean.TRUE.equals(user.getProfile().getShowContactInfoToFriends()) && isConnected()) {
            return true;
        }
        return false;
    }
    
    public String getPhoneNumber() {
        if (user.getProfile() != null && !StringUtils.isEmpty(user.getProfile().getPhone())) {
            return user.getProfile().getPhone();
        }
        return "";
    }

    public String getAcademy() {
        if (user.getProfile() != null && !StringUtils.isEmpty(user.getProfile().getAcademy())) {
            return user.getProfile().getAcademy();
        }
        return messageResource.getMessage("label.undefined", null, locale);
    }

    public String getPlays() {
        if (user.getProfile() != null && user.getProfile().getLeftHanded() != null) {
            if (user.getProfile().getLeftHanded()) {
                return messageResource.getMessage("label.handed_left", null, locale);
            } else {
                return messageResource.getMessage("label.handed_right", null, locale);
            }
        }
        return messageResource.getMessage("label.undefined", null, locale);
    }

    public String getCoach() {
        if (user.getProfile() != null && user.getProfile().getCoach() != null) {
            return user.getProfile().getCoach().getName();
        }
        return messageResource.getMessage("label.undefined", null, locale);
    }

    public String getSite() {
        if (user.getProfile() != null && !StringUtils.isEmpty(user.getProfile().getSite())) {
            return user.getProfile().getSite();
        }
        return messageResource.getMessage("label.undefined", null, locale);
    }

    public String getStyle() {
        if (user.getProfile() != null && !StringUtils.isEmpty(user.getProfile().getStyle())) {
            return user.getProfile().getStyle();
        }
        return messageResource.getMessage("label.undefined", null, locale);
    }
}
