package com.scoreshared.business.bo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.tuple.Pair;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.search.FullTextQuery;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.hibernate.search.query.dsl.TermContext;
import org.springframework.stereotype.Component;

import com.scoreshared.business.exception.EmptyPlayerNameException;
import com.scoreshared.business.exception.LongPlayerNameException;
import com.scoreshared.business.exception.PlayerLinkedException;
import com.scoreshared.business.exception.PlayerNotLinkedException;
import com.scoreshared.business.exception.PlayerWithRegisteredMatchException;
import com.scoreshared.domain.entity.Player;
import com.scoreshared.domain.entity.PlayerInstance;
import com.scoreshared.domain.entity.User;

@Component
public class PlayerBo extends GraphBo {
    
    public Pair<List, Integer> getPlayersByOwnerExceptOwnerFlaggingPlayersWithScore(Integer ownerId, Boolean ascending, Integer pageNumber) {
        Pair<List, Integer> result = null;
        if (ascending) {
            result = dao.findByNamedQueryWithLimits("playerNameByOwnerExceptLoggedUserQuery", pageNumber * PAGE_SIZE, PAGE_SIZE, ownerId);
        } else {
            result = dao.findByNamedQueryWithLimits("playerNameByOwnerExceptLoggedUserQueryDesc", pageNumber * PAGE_SIZE, PAGE_SIZE, ownerId);
        }

        if (!result.getLeft().isEmpty()) {
            flagPlayersWithScore(result.getLeft());
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

    public void renamePlayer(Integer playerId, String newName, Integer ownerId, boolean expectLinkedPlayer) throws PlayerLinkedException, EmptyPlayerNameException, LongPlayerNameException {
        if (newName.isEmpty()) {
            throw new EmptyPlayerNameException();
        }
        if (newName.length() > 255) {
            throw new LongPlayerNameException();
        }

        Session session = dao.openSession();
        FullTextSession fullTextSession = Search.getFullTextSession(session);
        Transaction transaction = fullTextSession.beginTransaction();

        Player player = (Player) fullTextSession.load(Player.class, playerId);
        if (!expectLinkedPlayer && player.isConnected()) {
            throw new PlayerLinkedException();
        }

        renamePlayerAndUpdateIndex(fullTextSession, player, newName);

        transaction.commit();
        session.close();
    }

    private void renamePlayerAndUpdateIndex(FullTextSession fullTextSession, Player player, String newName) {
        String previousName = player.getName();
        player.setName(newName);

        // list all scores containing the player's name
        QueryBuilder queryBuilder = fullTextSession.getSearchFactory().buildQueryBuilder().forEntity(PlayerInstance.class).get();

        TermContext termContext = queryBuilder.keyword();
        org.apache.lucene.search.Query finalQuery = termContext.onFields("score.playerInstances.player.name").matching(previousName)
                .createQuery();

        FullTextQuery hibQuery = fullTextSession.createFullTextQuery(finalQuery, PlayerInstance.class);
        List<PlayerInstance> players = hibQuery.list();

        // update index
        for (PlayerInstance playerInstance : players) {
            if (playerInstance.getPlayer().getId().equals(player.getId())) {
                fullTextSession.purge(PlayerInstance.class, playerInstance.getId());
                fullTextSession.index(playerInstance);
            }
        }
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