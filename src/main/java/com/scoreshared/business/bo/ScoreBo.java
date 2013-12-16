package com.scoreshared.business.bo;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.scoreshared.business.persistence.ApprovalResponseEnum;
import com.scoreshared.business.persistence.Player;
import com.scoreshared.business.persistence.PlayerBehavior;
import com.scoreshared.business.persistence.PlayerInstance;
import com.scoreshared.business.persistence.PlayerInstanceComment;
import com.scoreshared.business.persistence.Score;
import com.scoreshared.business.persistence.User;

@Component
public class ScoreBo extends BaseBo<Score> {

    private static final int PAGE_SIZE = 25;

    public void save(User owner, Score score, PlayerInstanceComment comment) {
        consist(owner, score, comment);
        
        updateProfileWithNewestPreferences(score);

        saveScoreAndComment(score, comment);

        // TODO: post in twitter or facebook
    }

    private void updateProfileWithNewestPreferences(Score score) {
        score.getOwner().getProfile().setSport(score.getSport());
        if (score.getCoach() != null) {
            score.getOwner().getProfile().setCoach(score.getCoach());
        }
    }

    private void consist(User owner, Score score, PlayerInstanceComment comment) {
        score.setOwner(owner);
        score.setWinnerDefined(score.hasWinner());

        consist(owner, score, score.getLeftPlayers());
        consist(owner, score, score.getRightPlayers());

        score.getAssociatedPlayer(owner.getId()).setApprovalResponse(ApprovalResponseEnum.ACCEPTED);

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
            comment.setPlayerInstance(score.getAssociatedPlayer(owner.getId()));
            comment.setOwner(owner);
        }
    }

    private void saveScoreAndComment(Score score, PlayerInstanceComment comment) {
        dao.saveOrUpdate(score);
        if (comment != null) {
            dao.saveOrUpdate(comment);
        }
    }

    private void consist(User owner, Score score, Set<PlayerInstance> players) {
        Set<PlayerInstance> replacedPlayers = new HashSet<PlayerInstance>();
        PlayerInstance playerInstance = null;
        for (Iterator<PlayerInstance> it = players.iterator(); it.hasNext(); ) {
            playerInstance = it.next();

            PlayerInstance existentPlayerInstance = replaceExistentPlayerOrPlayerInstanceAndKeepProperties(owner, score, playerInstance);
            if (existentPlayerInstance != null) {
                it.remove();
                replacedPlayers.add(existentPlayerInstance);
            }
        }
        players.addAll(replacedPlayers);
    }

    private PlayerInstance replaceExistentPlayerOrPlayerInstanceAndKeepProperties(User owner, Score score, PlayerInstance playerInstance) {
        PlayerInstance result = null;
        if (score.getId() != null) {
            result = findExistentPlayerInstanceAndKeepProperties(owner, score, playerInstance);
        }

        if (result == null) {
            Player player = findExistentPlayerAndKeepProperties(owner, playerInstance);
            if (player != null) {
                playerInstance.setPlayer(player);
            }
        }
        return result;
    }

    private PlayerInstance findExistentPlayerInstanceAndKeepProperties(User owner, Score score,
            PlayerInstance playerInstance) {
        Map<String, Integer> params = new HashMap<String, Integer>();
        params.put("scoreId", score.getId());
        params.put("playerId", playerInstance.getPlayer().getId());
        List<PlayerInstance> playerInstances = dao.findByNamedQueryAndNamedParam("playerInstanceLeftByPlayerAndScoreQuery", params);
        playerInstances.addAll(dao.findByNamedQueryAndNamedParam("playerInstanceRightByPlayerAndScoreQuery", params));
        if (playerInstances.size() > 0) {
            keepProperties(owner, playerInstances.get(0), playerInstance);
            return playerInstances.get(0);
        }
        return null;
    }

    private Player findExistentPlayerAndKeepProperties(User owner, PlayerBehavior player) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("playerName", player.getName());
        params.put("ownerId", owner.getId());
        List<Player> players = dao.findByNamedQueryAndNamedParam("playerByNameAndOwnerQuery", params);
        if (players.size() > 0) {
            keepProperties(owner, players.get(0), player);
            return players.get(0);
        }
        return null;
    }

    private void keepProperties(User owner, PlayerBehavior newPlayer, PlayerBehavior oldPlayer) {
        newPlayer.setShouldNotReinvite(oldPlayer.getShouldNotReinvite());
        newPlayer.setOwner(owner);
        if (newPlayer.getAssociation() != null && newPlayer.getAssociation().getId().equals(owner.getId())) {
            newPlayer.setAssociation(owner);
        }
    }

    public List<Score> findScores(Integer pageNumber, Boolean ascending, User owner) {
        String query = new StringBuilder()
                .append("select distinct score from Score score join score.leftPlayers lp join score.rightPlayers rp where (lp.approvalResponse = 0 and lp.player.association.id = :ownerId) or (rp.approvalResponse = 0 and rp.player.association.id = :ownerId)) order by cast(score.date as date)")
                .append(ascending ? " asc" : " desc").append(", score.time").append(ascending ? " asc" : " desc").toString();
        List<Score> scores = dao.findByQueryWithLimits(query, pageNumber != null ? ((pageNumber - 1) * PAGE_SIZE)
                : null, pageNumber != null ? PAGE_SIZE : null, owner.getId());

        List<Integer> ids = new ArrayList<Integer>();
        Map<Integer, Score> scoresByIdMap = new HashMap<Integer, Score>();
        for (Score score : scores) {
            Integer associatedPlayerId = score.getAssociatedPlayer(owner.getId()).getId();
            ids.add(associatedPlayerId);
            scoresByIdMap.put(associatedPlayerId, score);
        }

        if (!ids.isEmpty()) {
            List<PlayerInstanceComment> comments = dao.findByNamedQuery("commentByScoreIdsQuery", ids);
            for (PlayerInstanceComment comment : comments) {
                scoresByIdMap.get(comment.getPlayerInstance().getId()).setComment(comment);
            }
        }

        return scores;
    }

    public Score findById(Integer scoreId) {
        return dao.findByPk(Score.class, scoreId);
    }

    public PlayerInstanceComment findCommentByPlayerInstanceId(Integer playerInstanceId) {
        List<PlayerInstanceComment> comments = dao.findByNamedQuery("commentByScoreIdQuery", playerInstanceId);
        return comments.size() > 0 ? comments.get(0) : null;
    }

    public void deleteScores(Integer[] ids, Integer userId) {
        List<Score> scores = dao.findByNamedQuery("scoresByIdsQuery", ids);
        for (Score score : scores) {
            if (score.getOwner().getId().equals(userId)) {
                dao.remove(score);
            } else {
                PlayerInstance player = score.getAssociatedPlayer(userId);
                player.setApprovalResponse(ApprovalResponseEnum.HIDDEN);
                dao.saveOrUpdate(player);
            }
        }
    }

    public Integer[] calculateWinLoss(Integer ownerId) {
        List<Score> scores = dao.findByNamedQuery("scoresForWinLossQuery", ownerId);
        populateLeftPlayers(scores);

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
        player.setApprovalResponse(ApprovalResponseEnum.ACCEPTED);
        dao.saveOrUpdate(player);
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

    public void reviewRevision(Integer scoreId) {
        Score score = dao.findByPk(Score.class, scoreId);
        // score.setInRevision(Boolean.TRUE);
        dao.saveOrUpdate(score);
    }

    public void ignoreRevision(Integer playerInstanceId) {
        PlayerInstance playerInstance = dao.findByPk(PlayerInstance.class, playerInstanceId);
        playerInstance.setRevisionMessage(null);
        dao.saveOrUpdate(playerInstance);
    }

    public List<Score> findPendingScoreRevisions(Integer ownerId) {
        return dao.findByNamedQuery("pendingScoreRevisionsQuery", ownerId);
    }
}