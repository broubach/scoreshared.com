package com.scoreshared.business.bo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;

import org.apache.commons.lang3.tuple.MutablePair;
import org.apache.commons.lang3.tuple.Pair;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.scoreshared.domain.entity.ApprovalResponseEnum;
import com.scoreshared.domain.entity.Player;
import com.scoreshared.domain.entity.PlayerInstance;
import com.scoreshared.domain.entity.PlayerInstanceComment;
import com.scoreshared.domain.entity.Score;
import com.scoreshared.domain.entity.User;
import com.scoreshared.webapp.controller.ScoreOutcomeEnum;

@Component
public class ScoreBo extends BaseBo<Score> {
    
    @Inject
    private GraphBo graphBo;

    public void save(User owner, User loggedUser, Score score, PlayerInstanceComment comment) {
        consist(owner, loggedUser, score, comment);

        updateProfileWithNewestPreferences(score);

        saveScoreAndComment(loggedUser.getId(), score, comment);

        // TODO: post in twitter or facebook, if saving for the first time
    }

    private void updateProfileWithNewestPreferences(Score score) {
        if (score.getOwner().getProfile() != null) {
            score.getOwner().getProfile().setSport(score.getSport());
        }
    }

    private void consist(User owner, User loggedUser, Score score, PlayerInstanceComment comment) {
        if (owner.getId().equals(loggedUser.getId())) {
            owner = loggedUser;
        }
        score.setOwner(owner);
        score.setWinnerDefined(score.hasWinner());
        score.setConfirmed(findScoreIsConfirmedById(score.getId()));

        consist(owner, score, score.getLeftPlayers());
        consist(owner, score, score.getRightPlayers());

        score.getAssociatedPlayer(loggedUser.getId()).setApprovalResponse(ApprovalResponseEnum.ACCEPTED);

        if (comment != null) {
            score.getAssociatedPlayer(loggedUser.getId()).setComments(new HashSet<PlayerInstanceComment>());
            score.getAssociatedPlayer(loggedUser.getId()).getComments().add(comment);
            comment.setPlayerInstance(score.getAssociatedPlayer(loggedUser.getId()));
            comment.setOwner(loggedUser);
        }
    }

    private Boolean findScoreIsConfirmedById(Integer scoreId) {
        if (scoreId != null) {
            List<Boolean> confirmedFields = dao.findByNamedQuery("findScoreIsConfirmedByIdQuery", scoreId);
            if (confirmedFields.size() > 0) {
                return confirmedFields.get(0);
            }
        }
        return null;
    }

    private void saveScoreAndComment(Integer loggedUserId, Score score, PlayerInstanceComment comment) {
        if (Boolean.TRUE.equals(score.isUpdatable(loggedUserId))) {
            dao.saveOrUpdate(score);
        }
        if (comment != null && score.isUpdatable(loggedUserId) != null) {
            dao.saveOrUpdate(comment);
        }
    }

    private void consist(User owner, Score score, Set<PlayerInstance> players) {
        for (PlayerInstance playerInstance : players) {
            Player player = findExistentPlayerAndKeepProperties(owner, playerInstance.getPlayer());
            if (player != null && score.getId() != null) {
                findExistentPlayerInstanceAndKeepProperties(owner, score, playerInstance);
            }
            playerInstance.setOwner(owner);
        }
    }

    private Player findExistentPlayerAndKeepProperties(User owner, Player player) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("playerName", player.getName());
        params.put("ownerId", owner.getId());
        List<Player> players = dao.findByNamedQueryAndNamedParam("playerByNameAndOwnerQuery", params);
        if (players.size() > 0) {
            keepProperties(owner, player, players.get(0));
            return players.get(0);
        }
        return null;
    }

    private void keepProperties(User owner, Player currentPlayer, Player newPlayer) {
        currentPlayer.setId(newPlayer.getId());
        if (newPlayer.getAssociation() != null) {
            if (!newPlayer.getAssociation().getId().equals(owner.getId())) {
                currentPlayer.setAssociation(newPlayer.getAssociation());
            } else {
                currentPlayer.setAssociation(owner);
            }
        }
        if (newPlayer.getInvitation() != null) {
            newPlayer.getInvitation().setPlayer(newPlayer);
            currentPlayer.setInvitation(newPlayer.getInvitation());
        }
    }

    private void findExistentPlayerInstanceAndKeepProperties(User owner, Score score,
            PlayerInstance playerInstance) {
        Map<String, Integer> params = new HashMap<String, Integer>();
        params.put("scoreId", score.getId());
        params.put("playerId", playerInstance.getPlayer().getId());
        List<PlayerInstance> playerInstances = dao.findByNamedQueryAndNamedParam("playerInstanceLeftByPlayerAndScoreQuery", params);
        playerInstances.addAll(dao.findByNamedQueryAndNamedParam("playerInstanceRightByPlayerAndScoreQuery", params));
        if (playerInstances.size() > 0) {
            keepProperties(playerInstance, playerInstances.get(0));
        }
    }

    private void keepProperties(PlayerInstance currentPlayerInstance, PlayerInstance newPlayerInstance) {
        currentPlayerInstance.setId(newPlayerInstance.getId());
        currentPlayerInstance.setApprovalResponse(newPlayerInstance.getApprovalResponse());
        currentPlayerInstance.setApprovalResponse(newPlayerInstance.getApprovalResponse());
        currentPlayerInstance.setRevisionMessage(newPlayerInstance.getRevisionMessage());
        currentPlayerInstance.setRevisionDate(newPlayerInstance.getRevisionDate());
        currentPlayerInstance.setRevisionTime(newPlayerInstance.getRevisionTime());
        currentPlayerInstance.setRevisionSet1Left(newPlayerInstance.getRevisionSet1Left());
        currentPlayerInstance.setRevisionSet1Right(newPlayerInstance.getRevisionSet1Right());
        currentPlayerInstance.setRevisionSet2Left(newPlayerInstance.getRevisionSet2Left());
        currentPlayerInstance.setRevisionSet2Right(newPlayerInstance.getRevisionSet2Right());
        currentPlayerInstance.setRevisionSet3Left(newPlayerInstance.getRevisionSet3Left());
        currentPlayerInstance.setRevisionSet3Right(newPlayerInstance.getRevisionSet3Right());
        currentPlayerInstance.setRevisionSet4Left(newPlayerInstance.getRevisionSet4Left());
        currentPlayerInstance.setRevisionSet4Right(newPlayerInstance.getRevisionSet4Right());
        currentPlayerInstance.setRevisionSet5Left(newPlayerInstance.getRevisionSet5Left());
        currentPlayerInstance.setRevisionSet5Right(newPlayerInstance.getRevisionSet5Right());
    }

    public Score findById(Integer scoreId) {
        return dao.findByPk(Score.class, scoreId);
    }

    public <T> T findById(Class<T> clazz, Integer scoreId) {
        return dao.findByPk(clazz, scoreId);
    }

    public PlayerInstanceComment findCommentByPlayerInstanceId(Integer playerInstanceId) {
        List<Integer> playerInstanceIds = new ArrayList<Integer>();
        playerInstanceIds.add(playerInstanceId);
        List<PlayerInstanceComment> comments = dao.findByNamedQuery("commentByScoreIdsQuery", playerInstanceIds);
        return comments.size() > 0 ? comments.get(0) : null;
    }

    public void removeScore(Integer scoreId, Integer userId) {
        Score score = findById(scoreId);
        if (score.getOwner().getId().equals(userId)) {
            Set<Integer> commentIdsToBeRemoved = new HashSet<Integer>();
            for (PlayerInstance playerInstance : score.getAllPlayers()) {
                playerInstance = (PlayerInstance) dao.mergeAndInitialize(playerInstance, "comments");
                for (PlayerInstanceComment comment : playerInstance.getComments()) {
                    commentIdsToBeRemoved.add(comment.getId());
                }
            }
            dao.execute("removeCommentsByIdsQuery", commentIdsToBeRemoved);
            dao.remove(score);
        }
    }

    public void hideScore(Integer scoreId, Integer userId) {
        Score score = findById(scoreId);
        if (!score.getOwner().getId().equals(userId)) {
            PlayerInstance player = score.getAssociatedPlayer(userId);
            player.setApprovalResponse(ApprovalResponseEnum.HIDDEN);

            if (!score.hasConnectedPlayerInOtherSideOfOwner()) {
                score.setConfirmed(null);
            }
            dao.saveOrUpdate(score);
        }
    }

    public void acceptScore(Integer userId, Integer scoreId) {
        Score score = findById(scoreId);
        PlayerInstance player = score.getAssociatedPlayer(userId);

        if (score.isOwnerAndPlayerInstanceInDifferentSidesOfScore(player)) {
            for (PlayerInstance playerInstance : score.getAllPlayers()) {
                playerInstance.setApprovalResponse(ApprovalResponseEnum.ACCEPTED);
            }
            score.setConfirmed(Boolean.TRUE);
            dao.saveOrUpdate(score);

        } else {
            player.setApprovalResponse(ApprovalResponseEnum.ACCEPTED);
            dao.saveOrUpdate(player);
        }
    }

    public void ignoreScore(Integer userId, Integer scoreId) {
        Score score = findById(scoreId);
        PlayerInstance player = score.getAssociatedPlayer(userId);
        player.setApprovalResponse(ApprovalResponseEnum.IGNORED);
        dao.saveOrUpdate(player);
    }

    public void reviewScore(Integer loggedUserId, Integer scoreId, Date date, Date time, String message,
            Integer set1Left, Integer set1Right, Integer set2Left, Integer set2Right, Integer set3Left,
            Integer set3Right, Integer set4Left, Integer set4Right, Integer set5Left, Integer set5Right) {
        Score score = findById(scoreId);

        PlayerInstance player = score.getAssociatedPlayer(loggedUserId);
        player.setRevisionDate(date);
        player.setRevisionTime(time);
        player.setRevisionSet1Left(set1Left);
        player.setRevisionSet1Right(set1Right);
        player.setRevisionSet2Left(set2Left);
        player.setRevisionSet2Right(set2Right);
        player.setRevisionSet3Left(set3Left);
        player.setRevisionSet3Right(set3Right);
        player.setRevisionSet4Left(set4Left);
        player.setRevisionSet4Right(set4Right);
        player.setRevisionSet5Left(set5Left);
        player.setRevisionSet5Right(set5Right);
        player.setRevisionMessage(message);
        player.setApprovalResponse(ApprovalResponseEnum.IN_REVISION);

        dao.saveOrUpdate(player);
    }

    public List<Score> findPendingScoreApprovals(Integer ownerId) {
        return dao.findByNamedQuery("pendingScoreApprovalsQuery", ownerId);
    }

    public void approveRevision(Integer scoreId, Integer revisionRequesterId) {
        Score score = dao.findByPk(Score.class, scoreId);
        PlayerInstance revisionRequester = score.getPlayerInstance(revisionRequesterId);
        if (score.isOwnerAndPlayerInstanceInDifferentSidesOfScore(revisionRequester)) {
            for (PlayerInstance playerInstance : score.getAllPlayers()) {
                playerInstance.setApprovalResponse(ApprovalResponseEnum.ACCEPTED);
            }
            score.setConfirmed(Boolean.TRUE);
            score.copyDateAndScoreFrom(revisionRequester);
            dao.saveOrUpdate(score);

        } else {
            revisionRequester.setApprovalResponse(ApprovalResponseEnum.ACCEPTED);
            score.copyDateAndScoreFrom(revisionRequester);
            dao.saveOrUpdate(score);
        }
    }

    public void ignoreRevision(Integer playerInstanceId) {
        PlayerInstance playerInstance = dao.findByPk(PlayerInstance.class, playerInstanceId);
        playerInstance.setApprovalResponse(ApprovalResponseEnum.IGNORED);
        dao.saveOrUpdate(playerInstance);
    }

    public List<Score> findPendingScoreRevisions(Integer ownerId) {
        return dao.findByNamedQuery("pendingScoreRevisionsQuery", ownerId);
    }

    public Pair<List<Score>,Integer> findScores(Integer pageNumber, String term, ScoreOutcomeEnum outcome, boolean asc, Integer ownerId) {
        List<Integer> playerInstanceIds = graphBo.findConnectedPlayerInstancesByAssociation(ownerId, outcome);

        MutablePair<List<Score>, Integer> result = new MutablePair<List<Score>, Integer>();
        result.setLeft(new ArrayList<Score>());
        result.setRight(1);
        if (playerInstanceIds.isEmpty()) {
            return result;
        }

        List<Object[]> fieldAndValuePairs = toFieldAndValuePairs(term, playerInstanceIds);

        Pair<List<PlayerInstance>, Integer> searchData = dao.searchInLucene(pageNumber, PAGE_SIZE, PlayerInstance.class, null, fieldAndValuePairs);

        result.getLeft().addAll(extractScores(searchData.getLeft()));
        sortScores(result.getLeft(), asc);
        if (searchData.getRight() % PAGE_SIZE > 0) {
            result.setRight((searchData.getRight() / PAGE_SIZE) + 1);
        } else {
            result.setRight(searchData.getRight() / PAGE_SIZE);
        }

        fillComments(ownerId, result.getLeft());

        return result;
    }

    private List<Object[]> toFieldAndValuePairs(String term, List<Integer> playerInstanceIds) {
        List<Object[]> fieldAndValuePairs = new ArrayList<Object[]>();
        fieldAndValuePairs.add(new Object[] { "id",
                StringUtils.collectionToDelimitedString(playerInstanceIds, " ") });
        if (term != null && !term.isEmpty()) {
            fieldAndValuePairs
                    .add(new Object[] {
                            "comments.comment score.playerInstances.player.name",
                            term });
        }
        return fieldAndValuePairs;
    }

    public Pair<Integer, Integer> countWinLoss(String term, Integer ownerId) {
        MutablePair<Integer, Integer> result = new MutablePair<Integer, Integer>();
        
        List<Integer> playerInstanceIds = graphBo.findConnectedPlayerInstancesByAssociation(ownerId, ScoreOutcomeEnum.WIN);
        List<Object[]> fieldAndValuePairs = toFieldAndValuePairs(term, playerInstanceIds);
        result.setLeft(dao.countInLucene(PlayerInstance.class, fieldAndValuePairs));

        playerInstanceIds = graphBo.findConnectedPlayerInstancesByAssociation(ownerId, ScoreOutcomeEnum.LOSS);
        fieldAndValuePairs = toFieldAndValuePairs(term, playerInstanceIds);
        result.setRight(dao.countInLucene(PlayerInstance.class, fieldAndValuePairs));

        return result;
    }
    
    private void fillComments(Integer ownerId, List<Score> result) {
        List<Integer> ids = new ArrayList<Integer>();
        Map<Integer, Score> scoresByIdMap = new HashMap<Integer, Score>();
        for (Score score : result) {
            Integer associatedPlayerId = score.getAssociatedPlayer(ownerId).getId();
            ids.add(associatedPlayerId);
            scoresByIdMap.put(associatedPlayerId, score);
        }

        if (!ids.isEmpty()) {
            List<PlayerInstanceComment> comments = dao.findByNamedQuery("commentByScoreIdsQuery", ids);
            for (PlayerInstanceComment comment : comments) {
                scoresByIdMap.get(comment.getPlayerInstance().getId()).setComment(comment);
            }
        }
    }

    private void sortScores(List<Score> result, boolean asc) {
        Collections.sort(result, new Comparator<Score>() {
            @Override
            public int compare(Score o1, Score o2) {
                if (o1 != null && o1.getDate() != null && o2 != null && o2.getDate() != null) {
                    return o1.getDate().compareTo(o2.getDate());
                } else if (o1 == null && o2 == null) {
                    return 0;
                } else if (o1 == null) {
                    return 1;
                } else if (o2 == null) {
                    return -1;
                }
                return 0;
            }
        });
        if (!asc) {
            Collections.reverse(result);
        }
    }

    private Set<Score> extractScores(List<PlayerInstance> playerInstances) {
        Set<Score> result = new HashSet<Score>();
        for (PlayerInstance playerInstance : playerInstances) {
            result.add(playerInstance.getScore());
        }
        return result;
    }

    public Set<PlayerInstance> getConnectedPlayersFromScoreWithoutOwner(User loggedUser, Integer scoreId) {
        Score score = findById(scoreId);
        Set<PlayerInstance> connectedPlayersInScore = new HashSet<PlayerInstance>(score.getConnectedPlayersInScore());
        connectedPlayersInScore.remove(score.getAssociatedPlayer(loggedUser.getId()));
        return connectedPlayersInScore;
    }

    public void forward(Integer scoreId, Integer newOwnerId, User loggedUser) {
        Score score = findById(scoreId);
        PlayerInstance playerInstanceToBeNewOwner = score.getAssociatedPlayer(newOwnerId);
        if (playerInstanceToBeNewOwner.isScoreConnected()) {
            score.setOwner(playerInstanceToBeNewOwner.getAssociation());
            save(score.getOwner(), loggedUser, score, null);
        }
    }
}