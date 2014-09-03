package com.scoreshared.domain.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "scoreshared")
@NamedQuery(name = "scoreSharedByHashQuery", query = "from ScoreShared where hash = :hash")
public class ScoreShared extends BaseEntity {
    
    @ManyToOne(fetch = FetchType.EAGER)
    private User loggedUser;

    @ManyToOne(fetch = FetchType.EAGER)
    private Score score;

    private String hash;
    private Integer win;
    private Integer loss;
    private Date date;
    private String playerFirstName;
    private SportEnum sport;
    private String socialMessage;

    public ScoreShared() {
    }

    public String getHash() {
        return hash;
    }

    public void setHash(String hash) {
        this.hash = hash;
    }

    public User getLoggedUser() {
        return loggedUser;
    }

    public void setLoggedUser(User owner) {
        this.loggedUser = owner;
    }

    public Score getScore() {
        return score;
    }

    public void setScore(Score score) {
        this.score = score;
    }

    public Integer getWin() {
        return win;
    }

    public void setWin(Integer win) {
        this.win = win;
    }

    public Integer getLoss() {
        return loss;
    }

    public void setLoss(Integer loss) {
        this.loss = loss;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getPlayerFirstName() {
        return playerFirstName;
    }

    public void setPlayerFirstName(String playerFirstName) {
        this.playerFirstName = playerFirstName;
    }

    public SportEnum getSport() {
        return sport;
    }

    public void setSport(SportEnum sport) {
        this.sport = sport;
    }

    public void setSocialMessage(String socialMessage) {
        this.socialMessage = socialMessage;
    }

    public String getSocialMessage() {
        return socialMessage;
    }
}