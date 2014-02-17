package com.scoreshared.business.persistence;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.search.annotations.ContainedIn;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.IndexedEmbedded;

@Entity
@NamedQueries({
        @NamedQuery(name = "playerInstanceLeftByPlayerAndScoreQuery", query = "select pp from Score s join s.leftPlayers pp where s.id = :scoreId and pp.player.id = :playerId"),
        @NamedQuery(name = "playerInstanceRightByPlayerAndScoreQuery", query = "select pp from Score s join s.rightPlayers pp where s.id = :scoreId and pp.player.id = :playerId"),
        @NamedQuery(name = "connectedPlayerInstancesByAssociationAndOutcomeWinQuery", query = "select pi.id from PlayerInstance pi join pi.player p join p.invitation i where p.association.id = :associationId and i.response = 0 and pi.scoreRight is null "),
        @NamedQuery(name = "connectedPlayerInstancesByAssociationAndOutcomeLossQuery", query = "select pi.id from PlayerInstance pi join pi.player p join p.invitation i where p.association.id = :associationId and i.response = 0 and pi.scoreLeft is null"),
        @NamedQuery(name = "connectedPlayerInstancesByAssociationQuery", query = "select pi.id from PlayerInstance pi join pi.player p join p.invitation i where p.association.id = :associationId and i.response = 0 and pi.approvalResponse = 0")})
@Table(name = "playerinstance")
@Indexed
public class PlayerInstance extends BaseEntity {

    @IndexedEmbedded
    @ManyToOne(fetch = FetchType.EAGER)
    @Cascade({ CascadeType.SAVE_UPDATE })
	private Player player;

    @ContainedIn
    @IndexedEmbedded(prefix = "score.", includePaths = {"playerInstances.player.name"})
    @ManyToOne(fetch = FetchType.EAGER)
    private Score scoreLeft;

    @ContainedIn
    @IndexedEmbedded(prefix = "score.", includePaths = {"playerInstances.player.name"})
    @ManyToOne(fetch = FetchType.EAGER)
    private Score scoreRight;

    @IndexedEmbedded
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "playerInstance")
    private Set<PlayerInstanceComment> comments;

    private ApprovalResponseEnum approvalResponse;

    private String revisionMessage;
    private Date revisionDate;
    private Date revisionTime;
    private Integer revisionSet1Left;
    private Integer revisionSet1Right;
    private Integer revisionSet2Left;
    private Integer revisionSet2Right;
    private Integer revisionSet3Left;
    private Integer revisionSet3Right;
    private Integer revisionSet4Left;
    private Integer revisionSet4Right;
    private Integer revisionSet5Left;
    private Integer revisionSet5Right;

    public PlayerInstance() {
    } 

	public PlayerInstance(String name, User owner) {
		player = new Player(name, owner);
		player.setPlayerInstances(new HashSet<PlayerInstance>());
		player.getPlayerInstances().add(this);
	}

	public Player getPlayer() {
		return player;
	}

	public void setPlayer(Player player) {
		this.player = player;
	}

    public Score getScoreLeft() {
        return scoreLeft;
    }

    public void setScoreLeft(Score scoreLeft) {
        this.scoreLeft = scoreLeft;
    }

    public Score getScoreRight() {
        return scoreRight;
    }

    public void setScoreRight(Score scoreRight) {
        this.scoreRight = scoreRight;
    }

	public ApprovalResponseEnum getApprovalResponse() {
		return approvalResponse;
	}

	public void setApprovalResponse(ApprovalResponseEnum approvalResponse) {
		this.approvalResponse = approvalResponse;
	}

    public String getRevisionMessage() {
        return revisionMessage;
    }

    public void setRevisionMessage(String revisionMessage) {
        this.revisionMessage = revisionMessage;
    }

    public Boolean getShouldNotReinvite() {
        return player != null ? player.getShouldNotReinvite() : null;
    }

    public void setShouldNotReinvite(Boolean shouldNotReinvite) {
        if (player != null) {
            player.setShouldNotReinvite(shouldNotReinvite);
        }
    }

    public User getAssociation() {
        return player != null ? player.getAssociation() : null;
    }

    public void setAssociation(User association) {
        if (player != null) {
            player.setAssociation(association);
        }
    }

    public boolean isPlayerConnected() {
        return player != null ? player.isConnected() : false;
    }

    public String getName() {
        return player != null ? player.getName() : null;
    }

    public String getAvatar() {
        return player != null ? player.getAvatar() : null;
    }

    public User getOwner() {
        return player != null ? player.getOwner() : null;
    }

    public void setOwner(User owner) {
        if (player != null) {
            player.setOwner(owner);
        }
    }

    public Date getRevisionDate() {
        return revisionDate;
    }

    public void setRevisionDate(Date revisionDate) {
        this.revisionDate = revisionDate;
    }

    public Date getRevisionTime() {
        return revisionTime;
    }

    public void setRevisionTime(Date revisionTime) {
        this.revisionTime = revisionTime;
    }

    public Integer getRevisionSet1Left() {
        return revisionSet1Left;
    }

    public void setRevisionSet1Left(Integer revisionSet1Left) {
        this.revisionSet1Left = revisionSet1Left;
    }

    public Integer getRevisionSet1Right() {
        return revisionSet1Right;
    }

    public void setRevisionSet1Right(Integer revisionSet1Right) {
        this.revisionSet1Right = revisionSet1Right;
    }

    public Integer getRevisionSet2Left() {
        return revisionSet2Left;
    }

    public void setRevisionSet2Left(Integer revisionSet2Left) {
        this.revisionSet2Left = revisionSet2Left;
    }

    public Integer getRevisionSet2Right() {
        return revisionSet2Right;
    }

    public void setRevisionSet2Right(Integer revisionSet2Right) {
        this.revisionSet2Right = revisionSet2Right;
    }

    public Integer getRevisionSet3Left() {
        return revisionSet3Left;
    }

    public void setRevisionSet3Left(Integer revisionSet3Left) {
        this.revisionSet3Left = revisionSet3Left;
    }

    public Integer getRevisionSet3Right() {
        return revisionSet3Right;
    }

    public void setRevisionSet3Right(Integer revisionSet3Right) {
        this.revisionSet3Right = revisionSet3Right;
    }

    public Integer getRevisionSet4Left() {
        return revisionSet4Left;
    }

    public void setRevisionSet4Left(Integer revisionSet4Left) {
        this.revisionSet4Left = revisionSet4Left;
    }

    public Integer getRevisionSet4Right() {
        return revisionSet4Right;
    }

    public void setRevisionSet4Right(Integer revisionSet4Right) {
        this.revisionSet4Right = revisionSet4Right;
    }

    public Integer getRevisionSet5Left() {
        return revisionSet5Left;
    }

    public void setRevisionSet5Left(Integer revisionSet5Left) {
        this.revisionSet5Left = revisionSet5Left;
    }

    public Integer getRevisionSet5Right() {
        return revisionSet5Right;
    }

    public void setRevisionSet5Right(Integer revisionSet5Right) {
        this.revisionSet5Right = revisionSet5Right;
    }

    public Set<PlayerInstanceComment> getComments() {
        return comments;
    }

    public void setComments(Set<PlayerInstanceComment> comments) {
        this.comments = comments;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        if (obj.getClass() != getClass()) {
            return false;
        }
        PlayerInstance other = (PlayerInstance) obj;
        Integer ownerId = getOwner() != null ? getOwner().getId() : null;
        Integer objOwnerId = other.getOwner() != null ? other.getOwner().getId() : null;
        return new EqualsBuilder().append(getName(), other.getName()).append(ownerId, objOwnerId).isEquals();
    }

    @Override
    public int hashCode() {
        Integer ownerId = getOwner() != null ? getOwner().getId() : null;
        return new HashCodeBuilder(17, 37).append(getName()).append(ownerId).toHashCode();
    }

    public Score getScore() {
        if (scoreLeft != null) {
            return scoreLeft;
        }
        if (scoreRight != null) {
            return scoreRight;
        }
        return null;
    }

    public boolean isScoreConnected() {
        return isPlayerConnected() && ApprovalResponseEnum.ACCEPTED.equals(getApprovalResponse());
    }
}
