package com.scoreshared.business.persistence;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

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
        @NamedQuery(name = "playerByNameAndOwner", query = "from Player player where lower(player.name) = lower(:playerName) and player.owner.id = :ownerId"),
        @NamedQuery(name = "playerNameByOwner", query = "select player.name from Player player where player.owner.id = :ownerId"),
        @NamedQuery(name = "playerByAssociationAndOwner", query = "select player from Player player join player.association association where association.id = :associationId and player.owner.id = :ownerId"),
        @NamedQuery(name = "invitationPlayerByHash", query = "from Player player where player.invitationHash = :invitationHash")})
@Table(name = "player")
@SQLDelete(sql="UPDATE player SET deleted = 1 WHERE id = ?")
@Where(clause="deleted <> 1")
public class Player extends BaseEntity {
    private String name;

    @ManyToOne(fetch = FetchType.EAGER, cascade = { CascadeType.ALL })
    private User owner;

    @ManyToOne(fetch = FetchType.EAGER, cascade = { CascadeType.PERSIST })
    private User association;

    private String invitationHash;
    private String invitationEmail;

    private String invitationMessage;
    private Date invitationDate;
    private InvitationResponseEnum invitationResponse;

    private Boolean invitationShouldNotBeRemembered;

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

    public String getInvitationEmail() {
        return invitationEmail;
    }

    public void setInvitationEmail(String invitationEmail) {
        this.invitationEmail = invitationEmail;
    }

    public String getInvitationMessage() {
        return invitationMessage;
    }

    public void setInvitationMessage(String invitationMessage) {
        this.invitationMessage = invitationMessage;
    }

    public Date getInvitationDate() {
        return invitationDate;
    }

    public void setInvitationDate(Date invitationDate) {
        this.invitationDate = invitationDate;
    }

    public String getInvitationHash() {
        return invitationHash;
    }

    public void setInvitationHash(String invitationHash) {
        this.invitationHash = invitationHash;
    }

    public InvitationResponseEnum getInvitationResponse() {
        return invitationResponse;
    }

    public void setInvitationResponse(InvitationResponseEnum invitationResponse) {
        this.invitationResponse = invitationResponse;
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
        return association != null && InvitationResponseEnum.ACCEPTED.equals(invitationResponse);
    }

    public Boolean getInvitationShouldNotBeRemembered() {
        return invitationShouldNotBeRemembered;
    }

    public void setInvitationShouldNotBeRemembered(Boolean invitationShouldNotBeRemembered) {
        this.invitationShouldNotBeRemembered = invitationShouldNotBeRemembered;
    }
}