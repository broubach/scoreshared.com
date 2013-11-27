package com.scoreshared.business.persistence;

import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.HashSet;
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
import javax.persistence.Transient;

import org.apache.commons.beanutils.BeanUtils;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;


@Entity
@Table(name = "score")
@NamedQueries({
        @NamedQuery(name = "scoresForWinLossQuery", query = "select new com.scoreshared.business.persistence.Score(score.id, score.set1Left, score.set1Right, score.set2Left, score.set2Right, score.set3Left, score.set3Right, score.set4Left, score.set4Right, score.set5Left, score.set5Right) from Score score join score.leftPlayers lp join score.rightPlayers rp where (lp.approvalResponse = 0 and lp.player.association.id = :id and lp.visible = 1) or (rp.approvalResponse = 0 and rp.player.association.id = :id and rp.visible = 1)"),
        @NamedQuery(name = "scoreIdAndLeftPlayerQuery", query = "select score.id, leftPlayer from Score score join score.leftPlayers leftPlayer where score.id in (:ids)"),
        @NamedQuery(name = "pendingScoreApprovalsQuery", query = "select s from Score s join s.leftPlayers pl join s.rightPlayers pr where ((pl.approvalResponse is null and pl.revisionMessage is null and pl.player.association.id = :userId and pl.player.invitationResponse = 0) or (pr.revisionMessage is null and pr.approvalResponse is null and pr.player.association.id = :userId and pr.player.invitationResponse = 0)) group by s.id"),
        @NamedQuery(name = "pendingScoreRevisionsQuery", query = "select s from Score s join s.leftPlayers pl join s.rightPlayers pr where (pl.revisionMessage is not null or pr.revisionMessage is not null) and s.owner.id = :ownerId group by s.id"),
        @NamedQuery(name = "scoresByIdsQuery", query = "from Score s where s.id in(:ids)"),
        @NamedQuery(name = "scoresByOwner", query = "from Score s where s.owner.id = :ownerId")})
@SQLDelete(sql="UPDATE score SET deleted = 1 WHERE id = ?")
@Where(clause="deleted <> 1")
public class Score extends BaseEntity implements Cloneable {
    private Date date;
    private Date time;

    @ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST })
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

    @ManyToMany(fetch = FetchType.EAGER, cascade = { CascadeType.ALL })
    @JoinTable(name = "score_playerpermission_left", joinColumns = { @JoinColumn(name = "score_id") }, inverseJoinColumns = { @JoinColumn(name = "playerpermission_id") })
    private Set<PlayerPermission> leftPlayers;

    @ManyToMany(fetch = FetchType.EAGER, cascade = { CascadeType.ALL })
    @JoinTable(name = "score_playerpermission_right", joinColumns = { @JoinColumn(name = "score_id") }, inverseJoinColumns = { @JoinColumn(name = "playerpermission_id") })
    private Set<PlayerPermission> rightPlayers;

    private boolean winnerDefined;

    @ManyToOne(fetch = FetchType.EAGER, cascade = { CascadeType.ALL })
    private Player coach;
    
    private SportEnum sport;
    private Boolean inRevision;

    @Transient
    private Comment comment;

    public Score() {
    }

    public Score(Integer id) {
        setId(id);
    }

    public Score(Integer id, Integer set1Left, Integer set1Right, Integer set2Left, Integer set2Right, Integer set3Left, Integer set3Right, Integer set4Left, Integer set4Right, Integer set5Left, Integer set5Right) {
        this(id);
        this.set1Left = set1Left;
        this.set1Right = set1Right;
        this.set2Left = set1Left;
        this.set2Right = set1Right;
        this.set3Left = set1Left;
        this.set3Right = set1Right;
        this.set4Left = set1Left;
        this.set4Right = set1Right;
        this.set5Left = set1Left;
        this.set5Right = set1Right;
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

    public Set<PlayerPermission> getLeftPlayers() {
        return leftPlayers;
    }

    public void setLeftPlayers(Set<PlayerPermission> leftPlayers) {
        this.leftPlayers = leftPlayers;
    }

    public Set<PlayerPermission> getRightPlayers() {
        return rightPlayers;
    }

    public void setRightPlayers(Set<PlayerPermission> rightPlayers) {
        this.rightPlayers = rightPlayers;
    }

    public boolean isWinnerDefined() {
        return winnerDefined;
    }

    public void setWinnerDefined(boolean winnerDefined) {
        this.winnerDefined = winnerDefined;
    }

    public Player getCoach() {
        return coach;
    }

    public void setCoach(Player coach) {
        this.coach = coach;
    }
    
    public SportEnum getSport() {
        return sport;
    }

    public void setSport(SportEnum sport) {
        this.sport = sport;
    }

    public Boolean getInRevision() {
        return inRevision;
    }

    public void setInRevision(Boolean inRevision) {
        this.inRevision = inRevision;
    }

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }

    /**
     * True if left is really a winner. False if there is no winner or if right is the winner.
     */
    public Boolean hasWinner() {
        int leftCount = 0;
        int rightCount = 0;
        Integer[][] finalScore = getFinalScoreArray();
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

    private Integer[][] getFinalScoreArray() {
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
    
    public String getFinalScore(boolean winnerInLeft) {
        StringBuilder result = new StringBuilder();
        Integer[][] finalScore = getFinalScoreArray();
        for (Integer[] set : finalScore) {
            if (set[0] != null && set[1] != null) {
                if (winnerInLeft) {
                    result.append(set[0]).append("x").append(set[1]);
                } else {
                    result.append(set[1]).append("x").append(set[0]);
                }
                result.append(" ");
            }
        }
        return result.toString().trim();
    }

    public String getFinalScore() {
        return getFinalScore(true);
    }

    public boolean hasWinner(Integer userId) {
        for (PlayerPermission player : leftPlayers) {
            if (player.getAssociation() != null && player.getAssociation().getId().equals(userId)) {
                return true;
            }
        }
        return false;
    }

    public PlayerPermission getAssociatedPlayer(Integer userId) {
        Set<PlayerPermission> allPlayers = new HashSet<PlayerPermission>();
        allPlayers.addAll(leftPlayers);
        allPlayers.addAll(rightPlayers);

        for (PlayerPermission player : allPlayers) {
            if (player.getAssociation() != null && player.getAssociation().getId().equals(userId)) {
                return player;
            }
        }
        return null;
    }

    public Set<PlayerPermission> getOppositePlayers(Integer loggedUserId) {
        if (hasWinner(loggedUserId)) {
            return rightPlayers;
        } else if (hasWinner()) {
            return leftPlayers;
        }
        return new HashSet<PlayerPermission>();
    }

    @Override
    public Object clone() {
        try {
            Score newScore = (Score) BeanUtils.cloneBean(this);
            if (leftPlayers != null) {
                newScore.setLeftPlayers(new HashSet<PlayerPermission>());
                newScore.getLeftPlayers().addAll(leftPlayers);
            }
            if (rightPlayers != null) {
                newScore.setRightPlayers(new HashSet<PlayerPermission>());
                newScore.getRightPlayers().addAll(rightPlayers);
            }
            return newScore;
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (InstantiationException e) {
            throw new RuntimeException(e);
        } catch (InvocationTargetException e) {
            throw new RuntimeException(e);
        } catch (NoSuchMethodException e) {
            throw new RuntimeException(e);
        }
    }

    public Set<PlayerPermission> getAllPlayers() {
        Set<PlayerPermission> result = new HashSet<PlayerPermission>();
        result.addAll(leftPlayers);
        result.addAll(rightPlayers);
        return result;
    }

	public PlayerPermission getSampleOpponent(User loggedUser) {
	    Set<PlayerPermission> opponents = new HashSet<PlayerPermission>();
	    if (hasWinner(loggedUser.getId())) {
	        opponents.addAll(rightPlayers);
	
	    } else {
	        opponents.addAll(leftPlayers);
	    }

	    return getSamplePlayer(opponents);
	}

    public PlayerPermission getSampleLeftPlayer() {
        return getSamplePlayer(leftPlayers);
    }

    public PlayerPermission getSampleRightPlayer() {
        return getSamplePlayer(rightPlayers);
    }

    public PlayerPermission getSamplePlayer() {
        return getSamplePlayer(getAllPlayers());
    }

    public PlayerPermission getSamplePlayer(Set<PlayerPermission> players) {
        PlayerPermission result = null;
        for (PlayerPermission player : players) {
            if (player.isConnected()) {
                result = player;
                break;
            }
        }
        if (result == null && players.size() > 0) {
            result = players.iterator().next();
        }

        return result;
    }

    public String getLeftPlayerNames() {
        return getPlayerNames(leftPlayers);
    }

    public String getRightPlayerNames() {
        return getPlayerNames(rightPlayers);
    }

    public String getPlayerNames(Set<PlayerPermission> players) {
        StringBuilder result = new StringBuilder();
        for (PlayerPermission player : players) {
            result.append(player.getName());
            result.append(", ");
        }

        result.delete(result.length() - 2, result.length());
        return result.toString();
    }

    public Boolean getConfirmed() {
        boolean isConfirmed = true;
        for (PlayerPermission playerPermission : getAllPlayers()) {
            if (!ApprovalResponseEnum.ACCEPTED.equals(playerPermission.getApprovalResponse())) {
                isConfirmed = false;
                break;
            }
        }
        return isConfirmed;
    }
}