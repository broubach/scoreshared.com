package com.scoreshared.business.persistence;

public class Comment extends BaseEntity {
    private User owner;
    private boolean pvt; //pvt used because private is a reserved word
    private Score score;

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    public boolean isPrivate() {
        return pvt;
    }

    public void setPrivate(boolean pvt) {
        this.pvt = pvt;
    }

    public Score getScore() {
        return score;
    }

    public void setScore(Score score) {
        this.score = score;
    }
}
