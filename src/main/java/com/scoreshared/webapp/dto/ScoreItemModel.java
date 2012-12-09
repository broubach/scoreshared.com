package com.scoreshared.webapp.dto;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.context.MessageSource;

import com.scoreshared.business.persistence.Comment;
import com.scoreshared.business.persistence.Player;
import com.scoreshared.business.persistence.Profile;
import com.scoreshared.business.persistence.Score;
import com.scoreshared.business.persistence.User;

public class ScoreItemModel {

    private Score score;
    private Comment comment;
    private User loggedUser;
    private MessageSource messageResource;
    private Locale locale;

    public ScoreItemModel(Score score, Comment comment, User loggedUser, MessageSource messageResource, Locale locale) {
        this.score = score;
        this.comment = comment;
        this.loggedUser = loggedUser;
        this.messageResource = messageResource;
        this.locale = locale;
    }

    public String getDetailText() {
        StringBuilder result = new StringBuilder();
        List<Player> partners = new ArrayList<Player>();
        List<Player> opponents = new ArrayList<Player>();
        if (score.hasWinner(loggedUser)) {
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

    public String getSampleOpponentAvatar() {
        Player opponent = getSampleOpponent();
        if (opponent != null && opponent.getAssociation() != null) {
            Profile profile = opponent.getAssociation().getProfile();

            return (profile != null && profile.getAvatarHash() != null) ? profile.getAvatarHash() : "";
        }
        return "";
    }

    private Player getSampleOpponent() {
        List<Player> opponents = new ArrayList<Player>();
        if (score.hasWinner(loggedUser)) {
            opponents.addAll(score.getRightPlayers());

        } else {
            opponents.addAll(score.getLeftPlayers());
        }

        if (!opponents.isEmpty()) {
            return opponents.get(0);
        }

        return null;
    }
    
    public Comment getComment() {
        return comment;
    }
}