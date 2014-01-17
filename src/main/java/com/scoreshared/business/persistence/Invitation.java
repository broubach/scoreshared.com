package com.scoreshared.business.persistence;

import java.util.Calendar;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.search.annotations.ContainedIn;
import org.hibernate.search.annotations.Field;

@Entity
@NamedQuery(name = "deleteInvitationQuery", query = "delete from Invitation i where i.id = :invitationId")
@Table(name = "invitation")
public class Invitation extends BaseEntity {

    private static final int HASH_EXPIRATION_DAYS = 2;

    @ContainedIn
    @OneToOne(fetch = FetchType.LAZY, mappedBy = "invitation")
    private Player player;

    private Date date;
    private String hash;
    private Date hashExpirationDate;
    private String email;
    private String message;

    @Field
    private InvitationResponseEnum response;
    private InvitationTypeEnum type;

    public Invitation() {
    }

    public Invitation(String message) {
        this.date = new Date();
        this.message = message;
        this.type = InvitationTypeEnum.INTERNAL;
    }

    public Invitation(String email, String message, String hash) {
        this(message);
        this.email = email;
        this.hash = hash;
        Calendar hashExpirationDate = Calendar.getInstance();
        hashExpirationDate.setTime(date);
        hashExpirationDate.add(Calendar.DATE, Invitation.HASH_EXPIRATION_DAYS);
        this.hashExpirationDate = hashExpirationDate.getTime();
        this.type = InvitationTypeEnum.EXTERNAL;
    }

    public Invitation(InvitationResponseEnum response) {
        this.response = response;
    }

    public Player getPlayer() {
        return player;
    }

    public void setPlayer(Player player) {
        this.player = player;
    }

    public String getHash() {
        return hash;
    }

    public void setHash(String hash) {
        this.hash = hash;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public InvitationResponseEnum getResponse() {
        return response;
    }

    public void setResponse(InvitationResponseEnum response) {
        this.response = response;
    }

    public InvitationTypeEnum getType() {
        return type;
    }

    public void setType(InvitationTypeEnum type) {
        this.type = type;
    }

    public Date getHashExpirationDate() {
        return hashExpirationDate;
    }

    public void setHashExpirationDate(Date hashExpirationDate) {
        this.hashExpirationDate = hashExpirationDate;
    }
}
