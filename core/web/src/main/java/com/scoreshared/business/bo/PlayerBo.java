package com.scoreshared.business.bo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.scoreshared.business.exception.EmptyPlayerNameException;
import com.scoreshared.business.exception.LongPlayerNameException;
import com.scoreshared.business.exception.PlayerLinkedException;
import com.scoreshared.business.exception.PlayerNotLinkedException;
import com.scoreshared.business.exception.PlayerWithRegisteredMatchException;
import com.scoreshared.domain.entity.Player;
import com.scoreshared.domain.entity.User;

@Component
public class PlayerBo extends GraphBo {
    
    public List<Player> getPlayersByOwnerExceptOwnerFlaggingPlayersWithScore(Integer ownerId, Boolean ascending) {
        List<Player> result = null;
        if (ascending) {
            result = dao.findByNamedQuery("playerNameByOwnerExceptLoggedUserQuery", ownerId);
        } else {
            result = dao.findByNamedQuery("playerNameByOwnerExceptLoggedUserQueryDesc", ownerId);
        }

        if (!result.isEmpty()) {
            flagPlayersWithScore(result);
        }

        return result;
    }

    private void flagPlayersWithScore(List<Player> players) {
        Map<Integer, Player> playerByIdMap = new HashMap<Integer, Player>();
        for (Player player : players) {
            playerByIdMap.put(player.getId(), player);
        }

        List<Integer> playersWithMatches = dao.findByNamedQuery("playerIdWithMatchesByPlayerIdsQuery", playerByIdMap.keySet());
        for (Integer playerId : playersWithMatches) {
            playerByIdMap.get(playerId).setHasMatchAssociated(Boolean.TRUE);
        }
    }

    private void flagPlayerWithScore(Player player) {
        List<Player> players = new ArrayList<Player>();
        players.add(player);
        flagPlayersWithScore(players);
    }

    public void renamePlayer(Integer playerId, String newName, Integer ownerId) throws PlayerLinkedException, EmptyPlayerNameException, LongPlayerNameException {
        if (newName.isEmpty()) {
            throw new EmptyPlayerNameException();
        }
        if (newName.length() > 45) {
            throw new LongPlayerNameException();
        }
        Player player = dao.findByPk(Player.class, playerId);
        if (player.isConnected()) {
            throw new PlayerLinkedException();
        }
        player.setName(newName);
        dao.saveOrUpdate(player);
    }

    public void removePlayer(Integer playerId, Integer ownerId) throws PlayerWithRegisteredMatchException, PlayerLinkedException {
        Player player = dao.findByPk(Player.class, playerId);
        flagPlayerWithScore(player);
        if (player.isConnected()) {
            throw new PlayerLinkedException();
        }
        if (player.isHasMatchAssociated()) {
            throw new PlayerWithRegisteredMatchException();
        }
        dao.execute("deletePlayerQuery", playerId);
        if (player.getInvitation() != null) {
            dao.execute("deleteInvitationQuery", player.getInvitation().getId());
        }
    }

    public void removePlayerLink(Integer playerId, Integer ownerId) throws PlayerNotLinkedException {
        Player player = dao.findByPk(Player.class, playerId);
        if (!player.isConnected()) {
            throw new PlayerNotLinkedException();
        }
        removeConnection(player.getAssociation().getId(), ownerId);
    }

    public void createPlayer(String playerName, User owner) throws EmptyPlayerNameException, LongPlayerNameException {
        if (playerName.isEmpty()) {
            throw new EmptyPlayerNameException();
        }
        if (playerName.length() > 45) {
            throw new LongPlayerNameException();
        }
        dao.saveOrUpdate(new Player(playerName, owner));
    }

    public Player findPlayerByNameAndOwner(String name, Integer ownerId) {
        List<Player> players = dao.findByNamedQuery("playerByNameAndOwnerQuery", name, ownerId);
        if (players.size() > 0) {
            return players.get(0);
        }
        return null;
    }

    public List<Object[]> findConnectedPlayerIdAndNameByOwnerId(Integer ownerId) {
        return dao.findByNamedQuery("findConnectedPlayerIdAndNameByOwnerIdQuery", ownerId);
   }
}