package com.scoreshared.webapp.dto;

import java.util.Locale;

import org.springframework.context.MessageSource;

import com.scoreshared.domain.entity.PlayerInstance;
import com.scoreshared.domain.entity.PlayerInstanceComment;
import com.scoreshared.domain.entity.Score;
import com.scoreshared.domain.entity.User;

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

    public String getRevisionDateTime() {
        StringBuilder result = new StringBuilder();
        if (playerInstance.getRevisionDate() != null) {
            result.append(dateFormat.format(playerInstance.getRevisionDate())).append(" ");
        }
        if (playerInstance.getRevisionTime() != null) {
            result.append(timeFormat.format(playerInstance.getRevisionTime()));
        }
        return result.toString().trim();
    }

    public String getRevisionScore() {
        return Score.getFinalScore(true, "<span class='winner'>", "</span>", new Integer[][] {
                new Integer[] { playerInstance.getRevisionSet1Left(), playerInstance.getRevisionSet1Right() },
                new Integer[] { playerInstance.getRevisionSet2Left(), playerInstance.getRevisionSet2Right() },
                new Integer[] { playerInstance.getRevisionSet3Left(), playerInstance.getRevisionSet3Right() },
                new Integer[] { playerInstance.getRevisionSet4Left(), playerInstance.getRevisionSet4Right() },
                new Integer[] { playerInstance.getRevisionSet5Left(), playerInstance.getRevisionSet5Right() } });
    }
}