package com.scoreshared.business.persistence;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@NamedQueries({
        @NamedQuery(name = "avatarIdByHashQuery", query = "select avatar.id from Profile profile join profile.avatar avatar where profile.avatarHash = ?"),
        @NamedQuery(name = "smallAvatarIdByHashQuery", query = "select smallAvatar.id from Profile profile join profile.smallAvatar smallAvatar where profile.avatarHash = ?") })
@Table(name = "file")
public class File extends BaseEntity {

    @Lob
    private byte[] data;
    private String name;
    private Long size;
    private Date date;
    private String mime;

    @ManyToOne(fetch = FetchType.LAZY)
    private User owner;

    public byte[] getData() {
        return data;
    }

    public void setData(byte[] data) {
        this.data = data;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getSize() {
        return size;
    }

    public void setSize(Long size) {
        this.size = size;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getMime() {
        return mime;
    }

    public void setMime(String mime) {
        this.mime = mime;
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }
}
