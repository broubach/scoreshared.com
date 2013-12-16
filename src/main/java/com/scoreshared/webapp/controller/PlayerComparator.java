package com.scoreshared.webapp.controller;

import java.util.Comparator;

import com.scoreshared.business.persistence.Score;
import com.scoreshared.business.persistence.User;

final class PlayerComparator implements Comparator<Score> {
    private final User loggedUser;
    private final Boolean ascending;

    PlayerComparator(User loggedUser, Boolean ascending) {
        this.loggedUser = loggedUser;
        this.ascending = ascending;
    }

    @Override
    public int compare(Score score1, Score score2) {
        // get the list of opposite players
        String oppositePlayers1 = score1.getOpponentPlayerNames(loggedUser.getId());
        String oppositePlayers2 = score2.getOpponentPlayerNames(loggedUser.getId());

        if (ascending) {
            return oppositePlayers1.compareTo(oppositePlayers2);
        }
        return oppositePlayers2.compareTo(oppositePlayers1);
    }
}