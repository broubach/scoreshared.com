package com.scoreshared.business.persistence;

public interface PlayerBehavior {

    public String getName();

    public User getOwner();

    public User getAssociation();

    public boolean isConnected();

    public String getAvatar();

    public Boolean getShouldNotReinvite();

    public void setShouldNotReinvite(Boolean shouldNotReinvite);

    public void setOwner(User owner);

    public void setAssociation(User owner);
}