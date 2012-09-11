package com.scoreshared.business.persistence;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "score")
@NamedQueries({ @NamedQuery(name = "hasScoreWithOwnerId", query = "select 1 from Score score where score.owner.id = ?") })
public class Score extends BaseEntity {
    private Date date;
    private Date time;

    @ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.ALL })
    private User owner;

    private Integer set1Left;
    private Integer set1Right;
    private Integer set2Left;
    private Integer set2Right;
    private Integer set3Left;
    private Integer set3Right;
    private Integer set4Left;
    private Integer set4Right;
    private Integer set5Left;
    private Integer set5Right;

    /** 
     * field used when sharing the score between different users
     */
    private Integer groupingId;

    @ManyToMany(fetch = FetchType.EAGER, cascade = { CascadeType.ALL })
    @JoinTable(name = "score_player_left", joinColumns = { @JoinColumn(name = "score_id") }, inverseJoinColumns = { @JoinColumn(name = "player_id") })
    private Set<Player> leftPlayers;

    @ManyToMany(fetch = FetchType.EAGER, cascade = { CascadeType.ALL })
    @JoinTable(name = "score_player_right", joinColumns = { @JoinColumn(name = "score_id") }, inverseJoinColumns = { @JoinColumn(name = "player_id") })
    private Set<Player> rightPlayers;

    private boolean winnerDefined;

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

    public Integer getSet1Left() {
        return set1Left;
    }

    public void setSet1Left(Integer set1Left) {
        this.set1Left = set1Left;
    }

    public Integer getSet1Right() {
        return set1Right;
    }

    public void setSet1Right(Integer set1Right) {
        this.set1Right = set1Right;
    }

    public Integer getSet2Left() {
        return set2Left;
    }

    public void setSet2Left(Integer set2Left) {
        this.set2Left = set2Left;
    }

    public Integer getSet2Right() {
        return set2Right;
    }

    public void setSet2Right(Integer set2Right) {
        this.set2Right = set2Right;
    }

    public Integer getSet3Left() {
        return set3Left;
    }

    public void setSet3Left(Integer set3Left) {
        this.set3Left = set3Left;
    }

    public Integer getSet3Right() {
        return set3Right;
    }

    public void setSet3Right(Integer set3Right) {
        this.set3Right = set3Right;
    }

    public Integer getSet4Left() {
        return set4Left;
    }

    public void setSet4Left(Integer set4Left) {
        this.set4Left = set4Left;
    }

    public Integer getSet4Right() {
        return set4Right;
    }

    public void setSet4Right(Integer set4Right) {
        this.set4Right = set4Right;
    }

    public Integer getSet5Left() {
        return set5Left;
    }

    public void setSet5Left(Integer set5Left) {
        this.set5Left = set5Left;
    }

    public Integer getSet5Right() {
        return set5Right;
    }

    public void setSet5Right(Integer set5Right) {
        this.set5Right = set5Right;
    }

    public Integer getGroupingId() {
        return groupingId;
    }

    public void setGroupingId(Integer groupingId) {
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

    /**
     * True if left is really a winner. False if there is no winner or if right is the winner.
     */
    public Boolean hasWinner() {
        int leftCount = 0;
        int rightCount = 0;
        Integer[][] finalScore = getFinalScore();
        for (Integer[] set : finalScore) {
            if (set[0] != null && set[1] != null) {
                if (set[0] > set[1]) {
                    leftCount++;
                } else {
                    rightCount++;
                }
            }
        }
        return leftCount > rightCount;
    }

    private Integer[][] getFinalScore() {
        Integer[][] finalScore = new Integer[5][2];
        finalScore[0][0] = set1Left;
        finalScore[0][1] = set1Right;
        finalScore[1][0] = set2Left;
        finalScore[1][1] = set2Right;
        finalScore[2][0] = set3Left;
        finalScore[2][1] = set3Right;
        finalScore[3][0] = set4Left;
        finalScore[3][1] = set4Right;
        finalScore[4][0] = set5Left;
        finalScore[4][1] = set5Right;
        return finalScore;
    }
}