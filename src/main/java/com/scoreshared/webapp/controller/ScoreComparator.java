package com.scoreshared.webapp.controller;

import java.util.Comparator;

import com.scoreshared.business.persistence.Score;
import com.scoreshared.business.persistence.User;

final class ScoreComparator implements Comparator<Score> {
    private final User loggedUser;
    private final Boolean ascending;

    ScoreComparator(User loggedUser, Boolean ascending) {
        this.loggedUser = loggedUser;
        this.ascending = ascending;
    }

    @Override
    public int compare(Score score1, Score score2) {
        if (ascending) {
            return Boolean.valueOf(score1.hasWinner(loggedUser.getId())).compareTo(score2.hasWinner(loggedUser.getId()));
        }
        return Boolean.valueOf(score2.hasWinner(loggedUser.getId())).compareTo(score1.hasWinner(loggedUser.getId()));
    }
}