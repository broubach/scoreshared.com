package com.scoreshared.business.persistence;

import java.lang.reflect.InvocationTargetException;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import org.apache.commons.beanutils.BeanUtils;

@Entity
@Table(name = "playerinstancecomment")
@NamedQueries({
        @NamedQuery(name = "commentByScoreIdQuery", query = "from PlayerInstanceComment comment where comment.playerInstance.id = :playerInstanceId"),
        @NamedQuery(name = "commentByScoreIdsQuery", query = "from PlayerInstanceComment comment where comment.playerInstance.id in (:playerInstanceIds)") })
public class PlayerInstanceComment extends BaseEntity implements Cloneable {

    @ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.ALL })
    private User owner;

    private String comment;

    @ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.ALL })
    private PlayerInstance playerInstance;

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public PlayerInstance getPlayerInstance() {
        return playerInstance;
    }

    public void setPlayerInstance(PlayerInstance playerInstance) {
        this.playerInstance = playerInstance;
    }

    public Object clone() {
        try {
            return BeanUtils.cloneBean(this);
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
}
