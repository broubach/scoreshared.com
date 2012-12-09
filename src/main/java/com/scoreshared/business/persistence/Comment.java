package com.scoreshared.business.persistence;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "comment")
public class Comment extends BaseEntity {

    @ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.ALL })
    private User owner;

    private boolean pvt; //pvt used because private is a reserved word
    private String description;

    @ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.ALL })
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Score getScore() {
        return score;
    }

    public void setScore(Score score) {
        this.score = score;
    }
}
