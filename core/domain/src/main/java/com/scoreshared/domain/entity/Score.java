package com.scoreshared.domain.entity;

import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.tuple.MutablePair;
import org.apache.solr.analysis.LowerCaseFilterFactory;
import org.apache.solr.analysis.MappingCharFilterFactory;
import org.apache.solr.analysis.StandardTokenizerFactory;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;
import org.hibernate.search.annotations.Analyze;
import org.hibernate.search.annotations.AnalyzerDef;
import org.hibernate.search.annotations.CharFilterDef;
import org.hibernate.search.annotations.ContainedIn;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.IndexedEmbedded;
import org.hibernate.search.annotations.Parameter;
import org.hibernate.search.annotations.Store;
import org.hibernate.search.annotations.TokenFilterDef;
import org.hibernate.search.annotations.TokenizerDef;

@Entity
@Table(name = "score")
@NamedQueries({
        @NamedQuery(name = "pendingScoreApprovalsQuery", query = "select s from Score s join s.leftPlayers pl join s.rightPlayers pr where ((pl.approvalResponse is null and pl.player.association.id = :userId and pl.player.invitation.response = 0) or (pr.approvalResponse is null and pr.player.association.id = :userId and pr.player.invitation.response = 0)) group by s.id"),
        @NamedQuery(name = "countPendingScoreApprovalsQuery", query = "select count(distinct s) from Score s join s.leftPlayers pl join s.rightPlayers pr where ((pl.approvalResponse is null and pl.player.association.id = :userId and pl.player.invitation.response = 0) or (pr.approvalResponse is null and pr.player.association.id = :userId and pr.player.invitation.response = 0))"),
        @NamedQuery(name = "pendingScoreRevisionsQuery", query = "select s from Score s join s.leftPlayers pl join s.rightPlayers pr where (pl.approvalResponse = 3 or pr.approvalResponse = 3) and s.owner.id = :ownerId group by s.id"),
        @NamedQuery(name = "countPendingScoreRevisionsQuery", query = "select count(distinct s) from Score s join s.leftPlayers pl join s.rightPlayers pr where (pl.approvalResponse = 3 or pr.approvalResponse = 3) and s.owner.id = :ownerId"),
        @NamedQuery(name = "findScoreIsConfirmedByIdQuery", query = "select score.confirmed from Score score where score.id = :id"),
        @NamedQuery(name = "scoresByOwner", query = "from Score s where s.owner.id = :ownerId")})
@SQLDelete(sql="UPDATE score SET deleted = 1 WHERE id = ?")
@Where(clause="deleted <> 1")
@AnalyzerDef(name = "defaultAnalyzer", 
    charFilters = @CharFilterDef(factory = MappingCharFilterFactory.class, params = { @Parameter(name = "mapping", value = "mapping-chars.properties") }),
    tokenizer = @TokenizerDef(factory = StandardTokenizerFactory.class), 
    filters = @TokenFilterDef(factory = LowerCaseFilterFactory.class))
public class Score extends BaseEntity implements Cloneable {
    private static final String DOUBLES_SEPARATOR = " / ";

    @Field(store = Store.YES, analyze=Analyze.NO)
    private Date date;
    private Date time;

    @ManyToOne(fetch = FetchType.LAZY)
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

    @ContainedIn
    @IndexedEmbedded(prefix = "playerInstances.")
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "scoreLeft")
    @Cascade({ CascadeType.ALL })
    private Set<PlayerInstance> leftPlayers;

    @ContainedIn
    @IndexedEmbedded(prefix = "playerInstances.")
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "scoreRight")
    @Cascade({ CascadeType.ALL })
    private Set<PlayerInstance> rightPlayers;

    private SportEnum sport;

    @Column(columnDefinition = "BIT", length = 1)
    private Boolean confirmed;
    
    private ScoreTypeEnum type;

    @Transient
    private boolean postInFacebook;
    
    @Transient
    private PlayerInstanceComment comment;

    @Transient
    private String socialMessage;

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

    public Set<PlayerInstance> getLeftPlayers() {
        return leftPlayers;
    }

    public void setLeftPlayers(Set<PlayerInstance> leftPlayers) {
        this.leftPlayers = leftPlayers;
    }

    public Set<PlayerInstance> getRightPlayers() {
        return rightPlayers;
    }

    public void setRightPlayers(Set<PlayerInstance> rightPlayers) {
        this.rightPlayers = rightPlayers;
    }

    public SportEnum getSport() {
        return sport;
    }

    public void setSport(SportEnum sport) {
        this.sport = sport;
    }

    public PlayerInstanceComment getComment() {
        return comment;
    }

    public void setComment(PlayerInstanceComment comment) {
        this.comment = comment;
    }

    public Boolean getConfirmed() {
        return confirmed;
    }

    public void setConfirmed(Boolean confirmed) {
        this.confirmed = confirmed;
    }

    public ScoreTypeEnum getType() {
        return type;
    }

    public void setType(ScoreTypeEnum type) {
        this.type = type;
    }

    public void setPostInFacebook(boolean postInFacebook) {
        this.postInFacebook = postInFacebook;
    }
    
    public boolean getPostInFacebook() {
        return postInFacebook;
    }

    public String getSocialMessage() {
        return socialMessage;
    }

    public void setSocialMessage(String socialMessage) {
        this.socialMessage = socialMessage;
    }

    public boolean isUntied() {
        MutablePair<Integer, Integer> leftAndRightCounts = countSetsForLeftAndRight();
        return (leftAndRightCounts.getLeft() + leftAndRightCounts.getRight()) > 0 && leftAndRightCounts.getLeft() != leftAndRightCounts.getRight();
    }

    public boolean isTied() {
        MutablePair<Integer, Integer> leftAndRightCounts = countSetsForLeftAndRight();
        return (leftAndRightCounts.getLeft() + leftAndRightCounts.getRight()) > 0 && leftAndRightCounts.getLeft() == leftAndRightCounts.getRight();
    }

    public boolean isPractice() {
        MutablePair<Integer, Integer> leftAndRightCounts = countSetsForLeftAndRight();
        return (leftAndRightCounts.getLeft() + leftAndRightCounts.getRight()) == 0;
    }

    public ScoreTypeEnum calculateScoreType() {
        ScoreTypeEnum type = null;
        if (isUntied()) {
            type = ScoreTypeEnum.UNTIED;
        } else if (isTied()) {
            type = ScoreTypeEnum.TIED;
        } else if (isPractice()) {
            type = ScoreTypeEnum.PRACTICE;
        }
        return type;
    }

    private MutablePair<Integer, Integer> countSetsForLeftAndRight() {
        MutablePair<Integer, Integer> leftAndRightCounts = new MutablePair<Integer, Integer>(0,0);
        Integer[][] finalScore = getFinalScoreArray();
        for (Integer[] set : finalScore) {
            if (set[0] != null && set[1] != null) {
                if (set[0] > set[1]) {
                    leftAndRightCounts.setLeft(leftAndRightCounts.getLeft() + 1);
                } else {
                    leftAndRightCounts.setRight(leftAndRightCounts.getRight() + 1);
                }
            }
        }
        return leftAndRightCounts;
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
    
    public String getFinalScore(boolean winnerInLeft, String winnerHightLightStart, String winnerHighLightEnd) {
        return getFinalScore(winnerInLeft, winnerHightLightStart, winnerHighLightEnd, getFinalScoreArray());
    }
    
    public static String getFinalScore(boolean winnerInLeft, String winnerHightLightStart, String winnerHighLightEnd, Integer[][] finalScore) {
        StringBuilder result = new StringBuilder();
        for (Integer[] set : finalScore) {
            if (set[0] != null && set[1] != null) {
                if (winnerInLeft) {
                    if (set[0] >= set[1]) {
                        result.append(winnerHightLightStart).append(set[0]).append(winnerHighLightEnd).append("x").append(set[1]);
                    } else {
                        result.append(set[0]).append("x").append(winnerHightLightStart).append(set[1]).append(winnerHighLightEnd);
                    }
                } else {
                    if (set[1] >= set[0]) {
                        result.append(winnerHightLightStart).append(set[1]).append(winnerHighLightEnd).append("x").append(set[0]);
                    } else {
                        result.append(set[1]).append("x").append(winnerHightLightStart).append(set[0]).append(winnerHighLightEnd);
                    }
                }
                result.append(" ");
            }
        }
        return result.toString().trim();
        
    }

    public String getFinalScore(boolean winnerInLeft) {
        return getFinalScore(winnerInLeft, "", "");
    }

    public String getFinalScore() {
        return getFinalScore(true);
    }

    public boolean isUserInLeft(Integer userId) {
        for (PlayerInstance player : leftPlayers) {
            if (player.getAssociation() != null && player.getAssociation().getId().equals(userId)) {
                return true;
            }
        }
        return false;
    }

    public PlayerInstance getAssociatedPlayer(Integer userId) {
        Set<PlayerInstance> allPlayers = new HashSet<PlayerInstance>();
        allPlayers.addAll(leftPlayers);
        allPlayers.addAll(rightPlayers);

        for (PlayerInstance player : allPlayers) {
            if (player.getAssociation() != null && player.getAssociation().getId().equals(userId)) {
                return player;
            }
        }
        return null;
    }

    public Set<PlayerInstance> getConnectedPlayersInScore() {
        Set<PlayerInstance> result = new HashSet<PlayerInstance>();
        for (PlayerInstance playerInstance : getAllPlayers()) {
            if (playerInstance.isScoreConnected()) {
                result.add(playerInstance);
            }
        }
        return result;
    }

    public String getOpponentPlayerNames(Integer loggedUserId) {
        if (isUserInLeft(loggedUserId)) {
            return getRightPlayerNames();
        } else {
            return getLeftPlayerNames();
        }
    }

    public String getYourTeamPlayerNames(Integer loggedUserId) {
        if (isUserInLeft(loggedUserId)) {
            return getLeftPlayerNames();
        } else {
            return getRightPlayerNames();
        }
    }

    @Override
    public Object clone() {
        try {
            Score newScore = (Score) BeanUtils.cloneBean(this);
            if (leftPlayers != null) {
                newScore.setLeftPlayers(new HashSet<PlayerInstance>());
                newScore.getLeftPlayers().addAll(leftPlayers);
            }
            if (rightPlayers != null) {
                newScore.setRightPlayers(new HashSet<PlayerInstance>());
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

    public Set<PlayerInstance> getAllPlayers() {
        Set<PlayerInstance> result = new HashSet<PlayerInstance>();
        result.addAll(leftPlayers);
        result.addAll(rightPlayers);
        return result;
    }

	public PlayerInstance getSampleOpponent(User loggedUser) {
	    Set<PlayerInstance> opponents = new HashSet<PlayerInstance>();
	    if (isUserInLeft(loggedUser.getId())) {
	        opponents.addAll(rightPlayers);
	
	    } else {
	        opponents.addAll(leftPlayers);
	    }

	    return getSamplePlayer(opponents);
	}

    public PlayerInstance getSampleLeftPlayer() {
        return getSamplePlayer(leftPlayers);
    }

    public PlayerInstance getSampleRightPlayer() {
        return getSamplePlayer(rightPlayers);
    }

    public PlayerInstance getSamplePlayer() {
        return getSamplePlayer(getAllPlayers());
    }

    public PlayerInstance getSamplePlayer(Set<PlayerInstance> players) {
        PlayerInstance result = null;
        for (PlayerInstance player : players) {
            if (player.isPlayerConnected()) {
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

    public String getPlayerNames(Set<PlayerInstance> players) {
        if (players.isEmpty()) {
            return "";
        }
        StringBuilder result = new StringBuilder();
        for (PlayerInstance player : players) {
            result.append(player.getName());
            result.append(DOUBLES_SEPARATOR);
        }

        result.delete(result.length() - DOUBLES_SEPARATOR.length(), result.length());
        return result.toString();
    }

    public PlayerInstance getPlayerInstance(Integer playerInstanceId) {
        for (PlayerInstance playerInstance : getAllPlayers()) {
            if (playerInstance.getId().equals(playerInstanceId)) {
                return playerInstance;
            }
        }
        return null;
    }

    public void copyDateAndScoreFrom(PlayerInstance playerInstance) {
        setSet1Left(playerInstance.getRevisionSet1Left());
        setSet1Right(playerInstance.getRevisionSet1Right());
        setSet2Left(playerInstance.getRevisionSet2Left());
        setSet2Right(playerInstance.getRevisionSet2Right());
        setSet3Left(playerInstance.getRevisionSet3Left());
        setSet3Right(playerInstance.getRevisionSet3Right());
        setSet4Left(playerInstance.getRevisionSet4Left());
        setSet4Right(playerInstance.getRevisionSet4Right());
        setSet5Left(playerInstance.getRevisionSet5Left());
        setSet5Right(playerInstance.getRevisionSet5Right());
        setDate(playerInstance.getRevisionDate());
        setTime(playerInstance.getRevisionTime());
    }

    public boolean isOwnerAndPlayerInstanceInDifferentSidesOfScore(PlayerInstance playerInstance) {
        return isUserInLeft(getOwner().getId()) && !isUserInLeft(playerInstance.getAssociation().getId())
                || !isUserInLeft(getOwner().getId()) && isUserInLeft(playerInstance.getAssociation().getId());
    }

    public boolean hasConnectedPlayerInOtherSideOfOwner() {
        Set<PlayerInstance> otherSide = null;
        if (getLeftPlayers().contains(getAssociatedPlayer(getOwner().getId()))) {
            otherSide = getRightPlayers();
        } else {
            otherSide = getLeftPlayers();
        }
        boolean hasConnectedPlayer = false;
        for (PlayerInstance playerInstance : otherSide) {
            if (playerInstance.isScoreConnected()) {
                hasConnectedPlayer = true;
                break;
            }
        }
        return hasConnectedPlayer;
    }

    public Boolean isUpdatable(Integer loggedUserId) {
        if (getAssociatedPlayer(loggedUserId) == null) {
            return null;

        } else if (!Boolean.TRUE.equals(getConfirmed()) && getOwner().getId().equals(loggedUserId)) {
            return Boolean.TRUE;

        } else {
            return Boolean.FALSE;
        }
    }
}