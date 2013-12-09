package com.scoreshared.business.bo;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.scoreshared.business.persistence.ApprovalResponseEnum;
import com.scoreshared.business.persistence.Comment;
import com.scoreshared.business.persistence.Player;
import com.scoreshared.business.persistence.PlayerBehavior;
import com.scoreshared.business.persistence.PlayerPermission;
import com.scoreshared.business.persistence.Score;
import com.scoreshared.business.persistence.User;

@Component
public class ScoreBo extends BaseBo<Score> {

    private static final int PAGE_SIZE = 25;

    public void save(User owner, Score score, Comment comment) {
        consist(owner, score, comment);

        markRevisionsAsComplete(score);
        
        updateProfileWithNewestPreferences(score);

        saveScoreOrComment(score, comment);

        // TODO: post in twitter or facebook
    }

    private void updateProfileWithNewestPreferences(Score score) {
        score.getOwner().getProfile().setSport(score.getSport());
        if (score.getCoach() != null) {
            score.getOwner().getProfile().setCoach(score.getCoach());
        }
    }

    private void consist(User owner, Score score, Comment comment) {
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
                Set<PlayerPermission> source = new HashSet<PlayerPermission>();
                if (score.getLeftPlayers().contains(score.getCoach())) {
                    source.addAll(score.getLeftPlayers());
                } else {
                    source.addAll(score.getRightPlayers());
                }
                for (PlayerPermission playerInSource : source) {
                    if (playerInSource.equals(score.getCoach())) {
                        coach = playerInSource.getPlayer();
                        break;
                    }
                }
            }
            if (coach != null) {
                score.setCoach(coach);
            }
        }
        if (comment != null) {
            comment.setScore(score);
            comment.setOwner(owner);
        }
    }

    private void saveScoreOrComment(Score score, Comment comment) {
        if (comment != null) {
            dao.saveOrUpdate(comment);
        } else {
            dao.saveOrUpdate(score);
        }
    }

    private void consist(User owner, Score score, Set<PlayerPermission> players) {
        Set<PlayerPermission> replacedPlayers = new HashSet<PlayerPermission>();
        PlayerPermission playerPermission = null;
        for (Iterator<PlayerPermission> it = players.iterator(); it.hasNext(); ) {
            playerPermission = it.next();

            PlayerPermission existentPlayerPermission = replaceExistentPlayerOrPlayerPermissionAndKeepProperties(owner, score, playerPermission);
            if (existentPlayerPermission != null) {
                it.remove();
                replacedPlayers.add(existentPlayerPermission);
            }
        }
        players.addAll(replacedPlayers);
    }

    private PlayerPermission replaceExistentPlayerOrPlayerPermissionAndKeepProperties(User owner, Score score, PlayerPermission playerPermission) {
        PlayerPermission result = null;
        if (score.getId() != null) {
            result = findExistentPlayerPermissionAndKeepProperties(owner, score, playerPermission);
        }

        if (result == null) {
            Player player = findExistentPlayerAndKeepProperties(owner, playerPermission);
            if (player != null) {
                playerPermission.setPlayer(player);
            }
        }
        return result;
    }

    private PlayerPermission findExistentPlayerPermissionAndKeepProperties(User owner, Score score,
            PlayerPermission playerPermission) {
        Map<String, Integer> params = new HashMap<String, Integer>();
        params.put("scoreId", score.getId());
        params.put("playerId", playerPermission.getPlayer().getId());
        List<PlayerPermission> playerPermissions = dao.findByNamedQueryAndNamedParam("playerPermissionLeftByPlayerAndScoreQuery", params);
        playerPermissions.addAll(dao.findByNamedQueryAndNamedParam("playerPermissionRightByPlayerAndScoreQuery", params));
        if (playerPermissions.size() > 0) {
            keepProperties(owner, playerPermissions.get(0), playerPermission);
            return playerPermissions.get(0);
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
        newPlayer.setInvitationShouldNotBeRemembered(oldPlayer.getInvitationShouldNotBeRemembered());
        newPlayer.setOwner(owner);
        if (newPlayer.getAssociation() != null && newPlayer.getAssociation().getId().equals(owner.getId())) {
            newPlayer.setAssociation(owner);
        }
    }

    public List<Object[]> findScores(Integer pageNumber, Boolean ascending, User owner) {
        String query = new StringBuilder().append("select score, comment from Comment comment right outer join comment.score score join score.leftPlayers lp join score.rightPlayers rp where (lp.approvalResponse = 0 and lp.player.association.id = :ownerId and lp.visible = 1) or (rp.approvalResponse = 0 and rp.player.association.id = :ownerId and rp.visible = 1)) order by cast(score.date as date)").append(ascending ? " asc" : " desc").append(", score.time").append(ascending ? " asc" : " desc").toString();
        return dao.findByQueryWithLimits(query, pageNumber != null ? ((pageNumber - 1) * PAGE_SIZE) : null, pageNumber != null ? PAGE_SIZE : null, owner.getId());
	}

    public Score findById(Integer scoreId) {
        return dao.findByPk(Score.class, scoreId);
    }

    public Comment findCommentByScoreId(Integer scoreId) {
        List<Comment> comments = dao.findByNamedQuery("commentByScoreIdQuery", scoreId);
        return comments.size() > 0 ? comments.get(0) : null;
    }

    public void deleteScores(Integer[] ids, Integer userId) {
        List<Score> scores = dao.findByNamedQuery("scoresByIdsQuery", ids);
        for (Score score : scores) {
            PlayerPermission player = score.getAssociatedPlayer(userId);
            player.setVisible(Boolean.FALSE);
            dao.saveOrUpdate(player);
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
            score.setLeftPlayers(new HashSet<PlayerPermission>());
        }
        Object[] scoreIdAndPlayer = null;
        for (Object obj : dao.findByNamedQuery("scoreIdAndLeftPlayerQuery", new Object[] {scoresById.keySet()})) {
            scoreIdAndPlayer = (Object[]) obj;
            scoresById.get(scoreIdAndPlayer[0]).getLeftPlayers().add((PlayerPermission) scoreIdAndPlayer[1]);
        }
    }

    public void acceptScore(Integer userId, Integer scoreId) {
        Score score = findById(scoreId);
        PlayerPermission player = score.getAssociatedPlayer(userId);
        player.setApprovalResponse(ApprovalResponseEnum.ACCEPTED);
        dao.saveOrUpdate(player);
    }

    public void ignoreScore(Integer userId, Integer scoreId) {
        Score score = findById(scoreId);
        PlayerPermission player = score.getAssociatedPlayer(userId);
        player.setApprovalResponse(ApprovalResponseEnum.IGNORED);
        dao.saveOrUpdate(player);
    }

    public void reviewScore(Integer userId, Integer scoreId, String message) {
        Score score = findById(scoreId);
        PlayerPermission player = score.getAssociatedPlayer(userId);
        player.setRevisionMessage(message);
        dao.saveOrUpdate(player);
    }

    public List<Score> findPendingScoreApprovals(Integer ownerId) {
        return dao.findByNamedQuery("pendingScoreApprovalsQuery", ownerId);
    }

    public void reviewRevision(Integer scoreId) {
        Score score = dao.findByPk(Score.class, scoreId);
        score.setInRevision(Boolean.TRUE);
        dao.saveOrUpdate(score);
    }

    public void ignoreRevision(Integer playerPermissionId) {
        PlayerPermission playerPermission = dao.findByPk(PlayerPermission.class, playerPermissionId);
        playerPermission.setRevisionMessage(null);
        dao.saveOrUpdate(playerPermission);
    }

    public List<Score> findPendingScoreRevisions(Integer ownerId) {
        return dao.findByNamedQuery("pendingScoreRevisionsQuery", ownerId);
    }

    private void markRevisionsAsComplete(Score score) {
        score.setInRevision(Boolean.FALSE);

        for (PlayerPermission playerPermission : score.getAllPlayers()) {
            playerPermission.setRevisionMessage(null);
        }
    }
}