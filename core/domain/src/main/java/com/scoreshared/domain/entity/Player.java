package com.scoreshared.domain.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;
import org.hibernate.search.annotations.Analyze;
import org.hibernate.search.annotations.Analyzer;
import org.hibernate.search.annotations.ContainedIn;
import org.hibernate.search.annotations.Field;

/**
 * Players are considered to be the edges in the graph model implemented at scoreshared, because it connects an owner and an associated user. 
 * Both owner and associated user are nodes (or vertexes) represented by the User object. The vertexes (Users) are considered connected only when 
 * the edge (Player) has an accepted invitation.
 */
@Entity
@NamedQueries({
        @NamedQuery(name = "playerByNameAndOwnerQuery", query = "from Player player where lower(player.name) = lower(:playerName) and player.owner.id = :ownerId"),
        @NamedQuery(name = "playerNameByOwnerExceptLoggedUserQuery", query = AppQueries.PLAYER_NAME_BY_OWNER_EXCEPT_LOGGED_USER),
        @NamedQuery(name = "playerNameByOwnerExceptLoggedUserQuery.count", query = AppQueries.PLAYER_NAME_BY_OWNER_EXCEPT_LOGGED_USER_COUNT),
        @NamedQuery(name = "playerNameByOwnerExceptLoggedUserQueryDesc", query = AppQueries.PLAYER_NAME_BY_OWNER_EXCEPT_LOGGED_USER_DESC),
        @NamedQuery(name = "playerNameByOwnerExceptLoggedUserQueryDesc.count", query = AppQueries.PLAYER_NAME_BY_OWNER_EXCEPT_LOGGED_USER_DESC_COUNT),
        @NamedQuery(name = "playerByAssociationAndOwnerQuery", query = "select player from Player player join player.association association where association.id = :associationId and player.owner.id = :ownerId"),
        @NamedQuery(name = "playerIdWithMatchesByPlayerIdsQuery", query = "select player.id from PlayerInstance playerInstance join playerInstance.player player where player.id in (:playerIds)"),
        @NamedQuery(name = "invitationPlayerByHashQuery", query = "from Player player where player.invitation.hash = :invitationHash"),
        @NamedQuery(name = "pendingInvitationsQuery", query = "select p.owner.profile, p.owner.firstName, p.owner.lastName, p.owner.id from Player p where p.association.id = :associationId and p.invitation.date is not null and p.invitation.response is null" ),
        @NamedQuery(name = "countPendingInvitationsQuery", query = "select count(p.owner.id) from Player p where p.association.id = :associationId and p.invitation.date is not null and p.invitation.response is null"),
        @NamedQuery(name = "deletePlayerQuery", query = "delete from Player p where p.id = :playerId"),
        @NamedQuery(name = "findConnectedPlayerIdAndNameByOwnerIdQuery", query = "select association.id, player.name from Player player join player.invitation invitation join player.association association where player.owner.id = :ownerId and invitation.response = 0")})
@Table(name = "player")
@SQLDelete(sql="UPDATE player SET deleted = 1 WHERE id = ?")
@Where(clause="deleted <> 1")
public class Player extends BaseEntity {

    @Field(analyze = Analyze.YES, analyzer = @Analyzer(definition = "defaultAnalyzer"))
    private String name;

    @ManyToOne(fetch = FetchType.EAGER)
    private User owner;

    @ManyToOne(fetch = FetchType.EAGER)
    private User association;

    @OneToOne(fetch = FetchType.EAGER)
    @Cascade({ CascadeType.ALL })
    private Invitation invitation;

    @ContainedIn
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "player")
    private Set<PlayerInstance> playerInstances;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

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

    public Set<PlayerInstance> getPlayerInstances() {
        return playerInstances;
    }

    public void setPlayerInstances(Set<PlayerInstance> playerInstances) {
        this.playerInstances = playerInstances;
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
        Player other = (Player) obj;
        Integer ownerId = owner != null ? owner.getId() : null;
        Integer objOwnerId = other.getOwner() != null ? other.getOwner().getId() : null;
        return new EqualsBuilder().append(name, other.getName()).append(ownerId, objOwnerId).isEquals();
    }

    @Override
    public int hashCode() {
        Integer ownerId = owner != null ? owner.getId() : null;
        return new HashCodeBuilder(17, 37).append(name).append(ownerId).toHashCode();
    }

    public boolean isConnected() {
        return association != null && invitation != null && InvitationResponseEnum.ACCEPTED.equals(invitation.getResponse());
    }

    public String getAvatar() {
        if (isConnected()) {
            Profile profile = getAssociation().getProfile();
    
            return (profile != null && profile.getAvatarHash() != null) ? profile.getAvatarHash() : "default";
        }
        return "";
    }
}