package com.scoreshared.business.bo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.scoreshared.business.exception.PlayerLinkedException;
import com.scoreshared.business.exception.PlayerNotLinkedException;
import com.scoreshared.business.exception.PlayerWithRegisteredMatchException;
import com.scoreshared.business.persistence.Player;

@Component
public class PlayerBo extends BaseBo<Player> {

    public List<Player> getPlayersByOwnerExceptOwnerFlaggingPlayersWithoutScore(Integer ownerId, Boolean ascending) {
        List<Player> result = dao.findByNamedQuery("playerNameByOwnerExceptLoggedUserQuery", ownerId);
        Map<Integer, Player> playerByIdMap = new HashMap<Integer, Player>();
        for (Player player : result) {
            playerByIdMap.put(player.getId(), player);
        }

        List<Integer> playersWithMatches = dao.findByNamedQuery("playerIdWithMatchesByPlayerIdsQuery", playerByIdMap.keySet());
        for (Integer playerId : playersWithMatches) {
            playerByIdMap.get(playerId).setHasMatchAssociated(Boolean.TRUE);
        }

        return result;
    }

    public void renamePlayer(String id, String newName, Integer ownerId) throws PlayerLinkedException {
        // check if player is not linked to anyone
    }

    public void removePlayer(String id, Integer ownerId) throws PlayerWithRegisteredMatchException {
        // check if player does not have a match registered
    }

    public void removePlayerLink(String id, Integer ownerId) throws PlayerNotLinkedException {
        // check if player is linked
    }
}
