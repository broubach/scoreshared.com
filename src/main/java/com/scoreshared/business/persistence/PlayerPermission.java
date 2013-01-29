package com.scoreshared.business.persistence;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

@Entity
@NamedQueries({
        @NamedQuery(name = "playerPermissionLeftByPlayerAndScoreQuery", query = "select pp from Score s join s.leftPlayers pp where s.id = :scoreId and pp.player.id = :playerId"),
        @NamedQuery(name = "playerPermissionRightByPlayerAndScoreQuery", query = "select pp from Score s join s.rightPlayers pp where s.id = :scoreId and pp.player.id = :playerId"),
        @NamedQuery(name = "playerPermissionCountQuery", query = "select count(pp) from PlayerPermission pp where pp.approvalResponse = 0 and pp.player.association.id = :ownerId and pp.visible = 1")})
@Table(name = "playerpermission")
public class PlayerPermission extends BaseEntity implements PlayerBehavior {

    @ManyToOne(fetch = FetchType.EAGER, cascade = { CascadeType.ALL })
	private Player player;

    private ApprovalResponseEnum approvalResponse;
    private Boolean visible = Boolean.TRUE;

    private String revisionMessage;

    public PlayerPermission() {
    } 
    
	public PlayerPermission(String name, User owner) {
		player = new Player(name, owner);
	}

	public Player getPlayer() {
		return player;
	}

	public void setPlayer(Player player) {
		this.player = player;
	}

	public ApprovalResponseEnum getApprovalResponse() {
		return approvalResponse;
	}

	public void setApprovalResponse(ApprovalResponseEnum approvalResponse) {
		this.approvalResponse = approvalResponse;
	}

    public Boolean getVisible() {
        return visible;
    }

    public void setVisible(Boolean visible) {
        this.visible = visible;
    }

    public String getRevisionMessage() {
        return revisionMessage;
    }

    public void setRevisionMessage(String revisionMessage) {
        this.revisionMessage = revisionMessage;
    }

    @Override
    public Boolean getInvitationShouldNotBeRemembered() {
        return player.getInvitationShouldNotBeRemembered();
    }

    @Override
	public void setInvitationShouldNotBeRemembered(Boolean invitationShouldNotBeRemembered) {
		player.setInvitationShouldNotBeRemembered(invitationShouldNotBeRemembered);
	}

    @Override
	public User getAssociation() {
		return player.getAssociation();
	}

    @Override
    public void setAssociation(User association) {
        player.setAssociation(association);
    }

	@Override
	public boolean isConnected() {
		return player.isConnected();
	}

    @Override
	public String getName() {
		return player.getName();
	}

    @Override
	public String getAvatar() {
		return player.getAvatar();
	}

    @Override
    public User getOwner() {
		return player.getOwner();
	}

    @Override
    public void setOwner(User owner) {
        player.setOwner(owner);
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
        PlayerBehavior other = (PlayerBehavior) obj;
        Integer ownerId = getOwner() != null ? getOwner().getId() : null;
        Integer objOwnerId = other.getOwner() != null ? other.getOwner().getId() : null;
        return new EqualsBuilder().append(getName(), other.getName()).append(ownerId, objOwnerId).isEquals();
    }

	@Override
    public int hashCode() {
        Integer ownerId = getOwner() != null ? getOwner().getId() : null;
        return new HashCodeBuilder(17, 37).append(getName()).append(ownerId).toHashCode();
    }
}
