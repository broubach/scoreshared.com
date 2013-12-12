package com.scoreshared.webapp.dto;

import java.util.Locale;

import org.springframework.context.MessageSource;

import com.scoreshared.business.persistence.PlayerInstanceComment;
import com.scoreshared.business.persistence.PlayerInstance;
import com.scoreshared.business.persistence.Score;
import com.scoreshared.business.persistence.User;

public class ScoreItemWithPlayerInstanceModel extends ScoreItemModel {
    
    private PlayerInstance playerInstance;

    public ScoreItemWithPlayerInstanceModel(Score score, PlayerInstanceComment comment, User loggedUser,
            MessageSource messageResource, Locale locale, PlayerInstance playerInstance) {
        super(score, comment, loggedUser, messageResource, locale);
        this.playerInstance = playerInstance;
    }

    public PlayerInstance getPlayerInstance() {
        return playerInstance;
    }

    public void setPlayerInstance(PlayerInstance playerInstance) {
        this.playerInstance = playerInstance;
    }
}
