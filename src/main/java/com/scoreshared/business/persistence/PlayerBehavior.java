package com.scoreshared.business.persistence;

public interface PlayerBehavior {

    public String getName();

    public User getOwner();

    public User getAssociation();

    public boolean isConnected();

    public String getAvatar();

    public Boolean getInvitationShouldNotBeRemembered();

    public void setInvitationShouldNotBeRemembered(Boolean invitationShouldNotBeRemembered);

    public void setOwner(User owner);

    public void setAssociation(User owner);
}