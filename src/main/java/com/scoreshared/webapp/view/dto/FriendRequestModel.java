package com.scoreshared.webapp.view.dto;

public class FriendRequestModel {
    private String playerAvatarUrl;
    private String playerFullName;
    private String playerLocation;

    public String getPlayerAvatarUrl() {
        return playerAvatarUrl;
    }

    public void setPlayerAvatarUrl(String playerAvatarUrl) {
        this.playerAvatarUrl = playerAvatarUrl;
    }

    public String getPlayerFullName() {
        return playerFullName;
    }

    public void setPlayerFullName(String playerFullName) {
        this.playerFullName = playerFullName;
    }

    public String getPlayerLocation() {
        return playerLocation;
    }

    public void setPlayerLocation(String playerLocation) {
        this.playerLocation = playerLocation;
    }
}
