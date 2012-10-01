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

@Entity
@NamedQueries({
        @NamedQuery(name = "playerByNameAndOwner", query = "from Player player where lower(player.name) = lower(?) and player.owner.id = ?"),
        @NamedQuery(name = "playerByNameAndOwnerAndAssociated", query = "select player from Player player join player.association where lower(player.name) = lower(?) and player.owner.id = ?"),
        @NamedQuery(name = "playerNameByOwner", query = "select player.name from Player player where player.owner.id = ?") })
@Table(name = "player")
public class Player extends BaseEntity {
    private String name;

    @ManyToOne(fetch = FetchType.EAGER, cascade = { CascadeType.ALL })
    private User owner;

    @ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.ALL })
    private User association;

    private String invitationEmail;
    private String invitationMessage;
    private Date invitationDate;
    private Date invitationPreviousDate;

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

    public Date getInvitationPreviousDate() {
        return invitationPreviousDate;
    }

    public void setInvitationPreviousDate(Date invitationPreviousDate) {
        this.invitationPreviousDate = invitationPreviousDate;
    }
}
