package com.scoreshared.webapp.dto;

import java.util.Locale;

import org.springframework.context.MessageSource;

import com.scoreshared.business.persistence.Comment;
import com.scoreshared.business.persistence.PlayerPermission;
import com.scoreshared.business.persistence.Score;
import com.scoreshared.business.persistence.User;

public class ScoreItemWithPlayerPermissionModel extends ScoreItemModel {
    
    private PlayerPermission playerPermission;

    public ScoreItemWithPlayerPermissionModel(Score score, Comment comment, User loggedUser,
            MessageSource messageResource, Locale locale, PlayerPermission playerPermission) {
        super(score, comment, loggedUser, messageResource, locale);
        this.playerPermission = playerPermission;
    }

    public PlayerPermission getPlayerPermission() {
        return playerPermission;
    }

    public void setPlayerPermission(PlayerPermission playerPermission) {
        this.playerPermission = playerPermission;
    }
}
