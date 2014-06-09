package com.scoreshared.domain.entity;

public interface AppQueries {
    public static final String PLAYER_NAME_BY_OWNER_EXCEPT_LOGGED_USER = "from Player player where player.owner.id = :ownerId and (player.association.id <> :ownerId or player.association.id is null) order by player.name";
    public static final String PLAYER_NAME_BY_OWNER_EXCEPT_LOGGED_USER_COUNT = "select count(*) " + PLAYER_NAME_BY_OWNER_EXCEPT_LOGGED_USER;
    public static final String PLAYER_NAME_BY_OWNER_EXCEPT_LOGGED_USER_DESC = PLAYER_NAME_BY_OWNER_EXCEPT_LOGGED_USER + " desc";
    public static final String PLAYER_NAME_BY_OWNER_EXCEPT_LOGGED_USER_DESC_COUNT = "select count(*) " + PLAYER_NAME_BY_OWNER_EXCEPT_LOGGED_USER_DESC;
}
