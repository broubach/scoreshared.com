package com.scoreshared.webapp.controller;

import java.util.Comparator;
import java.util.Set;

import com.scoreshared.business.persistence.PlayerPermission;
import com.scoreshared.business.persistence.Score;
import com.scoreshared.business.persistence.User;

final class PlayerComparator implements Comparator<Object[]> {
    private final User loggedUser;
    private final Boolean ascending;

    PlayerComparator(User loggedUser, Boolean ascending) {
        this.loggedUser = loggedUser;
        this.ascending = ascending;
    }

    @Override
    public int compare(Object[] o1, Object[] o2) {
        Score score1 = (Score) o1[0];
        Score score2 = (Score) o2[0];

        // get the list of opposite players
        Set<PlayerPermission> oppositePlayers1 = score1.getOppositePlayers(loggedUser.getId());
        Set<PlayerPermission> oppositePlayers2 = score2.getOppositePlayers(loggedUser.getId());

        if (oppositePlayers1.isEmpty()) { return 1 * (ascending ? 1 : -1); }
        if (oppositePlayers2.isEmpty()) { return -1 * (ascending ? 1 : -1); }

        // compare first of each other
        if (ascending) {
            return oppositePlayers1.iterator().next().getName()
                    .compareTo(oppositePlayers2.iterator().next().getName());
        }
        return oppositePlayers2.iterator().next().getName()
                .compareTo(oppositePlayers1.iterator().next().getName());
    }
}