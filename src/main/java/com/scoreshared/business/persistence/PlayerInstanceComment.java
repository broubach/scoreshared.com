package com.scoreshared.business.persistence;

import java.lang.reflect.InvocationTargetException;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import org.apache.commons.beanutils.BeanUtils;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.search.annotations.Analyze;
import org.hibernate.search.annotations.Analyzer;
import org.hibernate.search.annotations.ContainedIn;
import org.hibernate.search.annotations.Field;

@Entity
@Table(name = "playerinstancecomment")
@NamedQuery(name = "commentByScoreIdsQuery", query = "from PlayerInstanceComment comment where comment.playerInstance.id in (:playerInstanceIds)")
public class PlayerInstanceComment extends BaseEntity implements Cloneable {

    @ManyToOne(fetch = FetchType.LAZY)
    private User owner;

    @Field(analyze = Analyze.YES, analyzer = @Analyzer(definition = "defaultAnalyzer"))
    private String comment;

    @ContainedIn
    @ManyToOne(fetch = FetchType.EAGER)
    @Cascade({ CascadeType.SAVE_UPDATE })
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
