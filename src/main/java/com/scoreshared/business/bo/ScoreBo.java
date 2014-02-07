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

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.scoreshared.business.persistence.ApprovalResponseEnum;
import com.scoreshared.business.persistence.Player;
import com.scoreshared.business.persistence.PlayerInstance;
import com.scoreshared.business.persistence.PlayerInstanceComment;
import com.scoreshared.business.persistence.Score;
import com.scoreshared.business.persistence.User;
import com.scoreshared.webapp.controller.ScoreOutcomeEnum;

@Component
public class ScoreBo extends BaseBo<Score> {
    
    @Inject
    private GraphBo graphBo;

    private static final int PAGE_SIZE = 25;

    public void save(User owner, User loggedUser, Score score, PlayerInstanceComment comment) {
        consist(owner, loggedUser, score, comment);

        updateProfileWithNewestPreferences(score);

        saveScoreAndComment(score, comment);

        // TODO: post in twitter or facebook
    }

    private void updateProfileWithNewestPreferences(Score score) {
        if (score.getOwner().getProfile() != null) {
            score.getOwner().getProfile().setSport(score.getSport());
            if (score.getCoach() != null) {
                score.getOwner().getProfile().setCoach(score.getCoach());
            }
        }
    }

    private void consist(User owner, User loggedUser, Score score, PlayerInstanceComment comment) {
        if (owner.getId().equals(loggedUser.getId())) {
            owner = loggedUser;
        }
        score.setOwner(owner);
        score.setWinnerDefined(score.hasWinner());

        consist(owner, score, score.getLeftPlayers());
        consist(owner, score, score.getRightPlayers());

        score.getAssociatedPlayer(loggedUser.getId()).setApprovalResponse(ApprovalResponseEnum.ACCEPTED);

        if (score.getCoach() != null) {
            Player coach = null;
            if (!score.getLeftPlayers().contains(score.getCoach()) && !score.getRightPlayers().contains(score.getCoach())) {
                coach = findExistentPlayerAndKeepProperties(owner, score.getCoach());
            } else {
                for (PlayerInstance player : score.getAllPlayers()) {
                    if (player.equals(score.getCoach())) {
                        coach = player.getPlayer();
                        break;
                    }
                }
            }
            if (coach != null) {
                score.setCoach(coach);
            }
        }
        if (comment != null) {
            score.getAssociatedPlayer(loggedUser.getId()).setComments(new HashSet<PlayerInstanceComment>());
            score.getAssociatedPlayer(loggedUser.getId()).getComments().add(comment);
            comment.setPlayerInstance(score.getAssociatedPlayer(loggedUser.getId()));
            comment.setOwner(loggedUser);
        }
    }

    private void saveScoreAndComment(Score score, PlayerInstanceComment comment) {
        dao.saveOrUpdate(score);
        if (comment != null) {
            dao.saveOrUpdate(comment);
        }
    }

    private void consist(User owner, Score score, Set<PlayerInstance> players) {
        for (PlayerInstance playerInstance : players) {
            Player player = findExistentPlayerAndKeepProperties(owner, playerInstance.getPlayer());
            if (player != null && score.getId() != null) {
                findExistentPlayerInstanceAndKeepId(owner, score, playerInstance);
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

    private void findExistentPlayerInstanceAndKeepId(User owner, Score score,
            PlayerInstance playerInstance) {
        Map<String, Integer> params = new HashMap<String, Integer>();
        params.put("scoreId", score.getId());
        params.put("playerId", playerInstance.getPlayer().getId());
        List<PlayerInstance> playerInstances = dao.findByNamedQueryAndNamedParam("playerInstanceLeftByPlayerAndScoreQuery", params);
        playerInstances.addAll(dao.findByNamedQueryAndNamedParam("playerInstanceRightByPlayerAndScoreQuery", params));
        if (playerInstances.size() > 0) {
            playerInstance.setId(playerInstances.get(0).getId());
        }
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
            dao.remove(score);
        }
    }
    
    public void hideScore(Integer scoreId, Integer userId) {
        Score score = findById(scoreId);
        if (!score.getOwner().getId().equals(userId)) {
            PlayerInstance player = score.getAssociatedPlayer(userId);
            player.setApprovalResponse(ApprovalResponseEnum.HIDDEN);
            dao.saveOrUpdate(player);
        }
    }

    public Integer[] calculateWinLoss(Integer ownerId) {
        List<Score> scores = dao.findByNamedQuery("scoresForWinLossQuery", ownerId);
        populateLeftPlayers(scores);

        return calculateWinLoss(scores, ownerId);
    }

    
    public Integer[] calculateWinLoss(List<Score> scores, Integer ownerId) {
        Integer win = 0;
        Integer loss = 0;
        for (Score score : scores) {
            if (score.hasWinner(ownerId)) {
                win++;
            } else {
                loss++;
            }
        }

        return new Integer[] { win, loss };
    }

    private void populateLeftPlayers(List<Score> scores) {
        if (scores.size() <= 0) {
            return;
        }
        Map<Integer, Score> scoresById = new HashMap<Integer, Score>();
        for (Score score : scores) {
            scoresById.put(score.getId(), score);
            score.setLeftPlayers(new HashSet<PlayerInstance>());
        }
        Object[] scoreIdAndPlayer = null;
        for (Object obj : dao.findByNamedQuery("scoreIdAndLeftPlayerQuery", new Object[] {scoresById.keySet()})) {
            scoreIdAndPlayer = (Object[]) obj;
            scoresById.get(scoreIdAndPlayer[0]).getLeftPlayers().add((PlayerInstance) scoreIdAndPlayer[1]);
        }
    }

    public void acceptScore(Integer userId, Integer scoreId) {
        Score score = findById(scoreId);
        PlayerInstance player = score.getAssociatedPlayer(userId);

        if (isOwnerAndPlayerInstanceInDifferentSidesOfScore(score, player)) {
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
        if (isOwnerAndPlayerInstanceInDifferentSidesOfScore(score, revisionRequester)) {
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

    private boolean isOwnerAndPlayerInstanceInDifferentSidesOfScore(Score score, PlayerInstance revisionRequester) {
        return score.hasWinner(score.getOwner().getId()) && !score.hasWinner(revisionRequester.getAssociation().getId())
                || !score.hasWinner(score.getOwner().getId()) && score.hasWinner(revisionRequester.getAssociation().getId());
    }

    public void ignoreRevision(Integer playerInstanceId) {
        PlayerInstance playerInstance = dao.findByPk(PlayerInstance.class, playerInstanceId);
        playerInstance.setApprovalResponse(ApprovalResponseEnum.IGNORED);
        dao.saveOrUpdate(playerInstance);
    }

    public List<Score> findPendingScoreRevisions(Integer ownerId) {
        return dao.findByNamedQuery("pendingScoreRevisionsQuery", ownerId);
    }

    public List<Score> findScores(Integer pageNumber, String term, ScoreOutcomeEnum outcome, boolean asc, Integer ownerId) {
        List<Integer> playerInstanceIds = graphBo.findConnectedPlayerInstancesByAssociation(ownerId, outcome);

        List<Score> result = new ArrayList<Score>();
        if (playerInstanceIds.isEmpty()) {
            return result;
        }

        List<Object[]> fieldAndValuePairs = new ArrayList<Object[]>();
        fieldAndValuePairs.add(new Object[] { "id",
                StringUtils.collectionToDelimitedString(playerInstanceIds, " ") });
        if (term != null && !term.isEmpty()) {
            fieldAndValuePairs
                    .add(new Object[] {
                            "comments.comment score.playerInstances.player.name",
                            term });
        }

        List<PlayerInstance> playerInstances = dao.searchInLucene(pageNumber, PAGE_SIZE, PlayerInstance.class, null, fieldAndValuePairs);

        result.addAll(extractScores(playerInstances));
        sortScores(result, asc);

        fillComments(ownerId, result);

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
}