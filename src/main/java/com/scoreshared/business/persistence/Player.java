package com.scoreshared.business.persistence;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

/**
 * Players are considered to be the edges in the graph model implemented at scoreshared, because it connects an owner and an associated user. 
 * Both owner and associated user are nodes (or vertexes) represented by the User object. This association is only valid when there is an accepted invitation.
 */
@Entity
@NamedQueries({
        @NamedQuery(name = "playerByNameAndOwnerQuery", query = "from Player player where lower(player.name) = lower(:playerName) and player.owner.id = :ownerId"),
        @NamedQuery(name = "playerNameByOwnerExceptLoggedUserQuery", query = "from Player player where player.owner.id = :ownerId and (player.association.id <> :ownerId or player.association.id is null) order by player.name"),
        @NamedQuery(name = "playerNameByOwnerExceptLoggedUserQueryDesc", query = "from Player player where player.owner.id = :ownerId and (player.association.id <> :ownerId or player.association.id is null) order by player.name desc"),
        @NamedQuery(name = "playerByAssociationAndOwnerQuery", query = "select player from Player player join player.association association where association.id = :associationId and player.owner.id = :ownerId"),
        @NamedQuery(name = "playerIdWithMatchesByPlayerIdsQuery", query = "select player.id from PlayerInstance playerInstance join playerInstance.player player where player.id in (:playerIds)"),
        @NamedQuery(name = "invitationPlayerByHashQuery", query = "from Player player where player.invitation.hash = :invitationHash"),
        @NamedQuery(name = "pendingInvitationsQuery", query = "select p.owner.profile, p.owner.firstName, p.owner.lastName, p.owner.id from Player p where p.association.id = :associationId and p.invitation.date is not null and p.invitation.response is null" ),
        @NamedQuery(name = "countPendingInvitationsQuery", query = "select count(p.owner.id) from Player p where p.association.id = :associationId and p.invitation.date is not null and p.invitation.response is null"),
        @NamedQuery(name = "deletePlayerQuery", query = "delete from Player p where p.id = :playerId")})
@Table(name = "player")
@SQLDelete(sql="UPDATE player SET deleted = 1 WHERE id = ?")
@Where(clause="deleted <> 1")
public class Player extends BaseEntity implements PlayerBehavior {
    private String name;

    @ManyToOne(fetch = FetchType.EAGER, cascade = { CascadeType.ALL })
    private User owner;

    @ManyToOne(fetch = FetchType.EAGER, cascade = { CascadeType.ALL })
    private User association;
    
    @ManyToOne(fetch = FetchType.EAGER, cascade = { CascadeType.ALL })
    private Invitation invitation;

    @Column(columnDefinition = "BIT", length = 1)
    private Boolean shouldNotReinvite;
    
    @Transient
    private boolean hasMatchAssociated;

    public Player() {
    }

    public Player(String name, User owner) {
        this.name = name;
        this.owner = owner;
    }

    @Override
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    @Override
    public User getAssociation() {
        return association;
    }

    public void setAssociation(User association) {
        this.association = association;
    }

    public Invitation getInvitation() {
        return invitation;
    }

    public void setInvitation(Invitation invitation) {
        this.invitation = invitation;
    }

    public Boolean getShouldNotReinvite() {
        return shouldNotReinvite;
    }

    public void setShouldNotReinvite(Boolean shouldNotReinvite) {
        this.shouldNotReinvite = shouldNotReinvite;
    }

    public boolean isHasMatchAssociated() {
        return hasMatchAssociated;
    }

    public void setHasMatchAssociated(boolean hasMatchAssociated) {
        this.hasMatchAssociated = hasMatchAssociated;
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
        Integer ownerId = owner != null ? owner.getId() : null;
        Integer objOwnerId = other.getOwner() != null ? other.getOwner().getId() : null;
        return new EqualsBuilder().append(name, other.getName()).append(ownerId, objOwnerId).isEquals();
    }

    @Override
    public int hashCode() {
        Integer ownerId = owner != null ? owner.getId() : null;
        return new HashCodeBuilder(17, 37).append(name).append(ownerId).toHashCode();
    }

    @Override
    public boolean isConnected() {
        return association != null && invitation != null && InvitationResponseEnum.ACCEPTED.equals(invitation.getResponse());
    }

    @Override
    public String getAvatar() {
        if (isConnected()) {
            Profile profile = getAssociation().getProfile();
    
            return (profile != null && profile.getAvatarHash() != null) ? profile.getAvatarHash() : "default";
        }
        return "";
    }
}