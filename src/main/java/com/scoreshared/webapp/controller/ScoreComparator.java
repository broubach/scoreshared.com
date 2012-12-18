package com.scoreshared.webapp.controller;

import java.util.Comparator;

import com.scoreshared.business.persistence.Score;
import com.scoreshared.business.persistence.User;

final class ScoreComparator implements Comparator<Object[]> {
    private final User loggedUser;
    private final Boolean ascending;

    ScoreComparator(User loggedUser, Boolean ascending) {
        this.loggedUser = loggedUser;
        this.ascending = ascending;
    }

    @Override
    public int compare(Object[] o1, Object[] o2) {
        Score score1 = (Score) o1[0];
        Score score2 = (Score) o2[0];
        
        if (ascending) {
            return Boolean.valueOf(score1.hasWinner(loggedUser.getId())).compareTo(score2.hasWinner(loggedUser.getId()));
        }
        return Boolean.valueOf(score2.hasWinner(loggedUser.getId())).compareTo(score1.hasWinner(loggedUser.getId()));
    }
}