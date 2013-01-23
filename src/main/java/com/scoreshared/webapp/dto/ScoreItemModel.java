package com.scoreshared.webapp.dto;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.context.MessageSource;

import com.scoreshared.business.persistence.Comment;
import com.scoreshared.business.persistence.Player;
import com.scoreshared.business.persistence.Score;
import com.scoreshared.business.persistence.User;

public class ScoreItemModel {

    private Score score;
    private Comment comment;
    private User loggedUser;
    private MessageSource messageResource;
    private Locale locale;
    private DateFormat dateFormat;
    private DateFormat timeFormat;

    public ScoreItemModel(Score score, Comment comment, User loggedUser, MessageSource messageResource, Locale locale) {
        this.score = score;
        this.comment = comment;
        this.loggedUser = loggedUser;
        this.messageResource = messageResource;
        this.locale = locale;

        dateFormat = DateFormat.getInstance();
        String datePattern = messageResource.getMessage("system.date_format", null, locale);
        ((SimpleDateFormat) dateFormat).applyPattern(datePattern);

        timeFormat = DateFormat.getInstance();
        String timePattern = messageResource.getMessage("system.time_format", null, locale);
        ((SimpleDateFormat) timeFormat).applyPattern(timePattern);
    }

    public String getDetailText() {
        StringBuilder result = new StringBuilder();
        List<Player> partners = new ArrayList<Player>();
        List<Player> opponents = new ArrayList<Player>();
        if (score.hasWinner(loggedUser.getId())) {
            result.append(score.getFinalScore(true));
            partners.addAll(score.getLeftPlayers());
            opponents.addAll(score.getRightPlayers());

        } else {
            result.append(score.getFinalScore(false));
            partners.addAll(score.getRightPlayers());
            opponents.addAll(score.getLeftPlayers());
        }
        partners.remove(score.getAssociatedPlayer(loggedUser));

        if (!partners.isEmpty()) {
            result.append(", ").append(messageResource.getMessage("label.with", null, locale)).append(" ");
            for (Player player : partners) {
                result.append(player.getName());
                result.append(", ");
            }

            result.delete(result.length() - 2, result.length());
        }

        if (!opponents.isEmpty()) {
            result.append(", ").append(messageResource.getMessage("label.against", null, locale)).append(" ");
            for (Player player : opponents) {
                result.append(player.getName());
                result.append(", ");
            }

            result.delete(result.length() - 2, result.length());
        }

        return result.toString();
    }

    public Comment getComment() {
        return comment;
    }
    
    public Score getScore() {
        return score;
    }

    public String getDateTime() {
        StringBuilder result = new StringBuilder();
        if (score.getDate() != null) {
            result.append(dateFormat.format(score.getDate())).append(" ");
        }
        if (score.getTime() != null) {
            result.append(timeFormat.format(score.getTime()));
        }
        return result.toString().trim();
    }
    
    public String getSampleOpponentName() {
        Player sampleOpponent = score.getSampleOpponent(loggedUser);
        if (sampleOpponent != null) {
            return sampleOpponent.getName();
        }
        return "";
    }
    
    public String getSampleOpponentAvatar() {
        Player sampleOpponent = score.getSampleOpponent(loggedUser);
        if (sampleOpponent != null) {
            return sampleOpponent.getAvatar();
        }
        return "default";
    }
}