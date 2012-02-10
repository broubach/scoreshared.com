package com.scoreshared.webapp.persistence;

import java.util.Date;
import java.util.Set;

public class Score {
    private int id;
    private Date date;
    private Date time;
    private User owner;
    private Set<ScoreSet> set;
    private int groupingId;
    private Set<Player> leftPlayers;
    private Set<Player> rightPlayers;
    private boolean winnerDefined;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    public Set<ScoreSet> getSet() {
        return set;
    }

    public void setSet(Set<ScoreSet> set) {
        this.set = set;
    }

    public int getGroupingId() {
        return groupingId;
    }

    public void setGroupingId(int groupingId) {
        this.groupingId = groupingId;
    }

    public Set<Player> getLeftPlayers() {
        return leftPlayers;
    }

    public void setLeftPlayers(Set<Player> leftPlayers) {
        this.leftPlayers = leftPlayers;
    }

    public Set<Player> getRightPlayers() {
        return rightPlayers;
    }

    public void setRightPlayers(Set<Player> rightPlayers) {
        this.rightPlayers = rightPlayers;
    }

    public boolean isWinnerDefined() {
        return winnerDefined;
    }

    public void setWinnerDefined(boolean winnerDefined) {
        this.winnerDefined = winnerDefined;
    }
}