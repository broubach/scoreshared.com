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
@Table(name = "comment")
@NamedQueries({ @NamedQuery(name = "commentByScoreIdQuery", query = "from Comment comment where comment.score.id = :scoreId") })
public class Comment extends BaseEntity implements Cloneable {

    @ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST })
    private User owner;

    private boolean pvt; //pvt used because private is a reserved word
    private String description;

    @ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.ALL })
    private Score score;

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    public boolean isPrivate() {
        return pvt;
    }

    public void setPrivate(boolean pvt) {
        this.pvt = pvt;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Score getScore() {
        return score;
    }

    public void setScore(Score score) {
        this.score = score;
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
