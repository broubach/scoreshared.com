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
import com.scoreshared.business.persistence.Score;
import com.scoreshared.business.persistence.User;

@Component
public class ScoreBo extends BaseBo<Score> {

    private static final int PAGE_SIZE = 25;

    public void save(User owner, Score score, Comment comment) {
        consist(owner, score, comment);

        Integer groupingId = null;
        if (score.getId() == null) {
            for (Player player : score.getAllPlayers()) {
                if (player.getAssociation() != null && !player.getAssociation().getId().equals(owner.getId())) {
                    Score newScore = (Score) score.clone();
                    newScore.setGroupingId(groupingId);
                    Comment newComment = null;
                    if (comment != null) {
                        newComment = (Comment) comment.clone();
                    }
                    newScore.setApprovalResponse(ApprovalResponseEnum.WAITING);
                    consistAndSave(player.getAssociation(), newScore, newComment);
                    if (groupingId == null) {
                        groupingId = newScore.getId();
                        newScore.setGroupingId(groupingId);
                        dao.saveOrUpdate(newScore);
                    }
                }
            }
        }

        score.setGroupingId(groupingId);
        score.setApprovalResponse(ApprovalResponseEnum.ACCEPTED);
        saveScoreOrComment(score, comment);

        // TODO: post in twitter or facebook
    }

    private void consistAndSave(User owner, Score score, Comment comment) {
        consist(owner, score, comment);
        saveScoreOrComment(score, comment);
    }
    
    private void consist(User owner, Score score, Comment comment) {
        score.setOwner(owner);
        score.setWinnerDefined(score.hasWinner());
        replaceExistentPlayersAndSetOwner(owner, score.getLeftPlayers());
        replaceExistentPlayersAndSetOwner(owner, score.getRightPlayers());
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

    private void replaceExistentPlayersAndSetOwner(User owner, Set<Player> players) {
        Set<Player> replacedPlayers = new HashSet<Player>();
        Player player = null;
        for (Iterator<Player> it = players.iterator(); it.hasNext(); ) {
            player = it.next();

            List<Player> result = dao.findByNamedQuery("playerByNameAndOwner", player.getName(), owner.getId());
            if (result.size() > 0) {
                // replaces the user object just to garantee the graph is concise
                result.get(0).setOwner(owner);
                if (result.get(0).getAssociation() != null && result.get(0).getAssociation().getId().equals(owner.getId())) {
                    result.get(0).setAssociation(owner);
                }

                it.remove();
                replacedPlayers.add(result.get(0));
            }
        }
        
        players.addAll(replacedPlayers);
    }

    public List<String> listPlayersName(User loggedUser) {
        return dao.findByNamedQuery("playerNameByOwner", loggedUser.getId());
    }

    public boolean hasScores(User loggedUser) {
        return !dao.findByNamedQuery("hasScoreWithOwnerId", loggedUser.getId()).isEmpty();
    }

    public List<Object[]> findScores(Integer pageNumber, Boolean ascending, User owner) {
        String query = new StringBuilder().append("select score, comment from Comment comment right outer join comment.score score where score.deleted = 0 and score.approvalResponse = 1 and score.owner.id = :ownerId order by cast(score.date as date)").append(ascending ? " asc" : " desc").append(", score.time").append(ascending ? " asc" : " desc").toString();
        return dao.findByQueryWithLimits(query, pageNumber != null ? ((pageNumber - 1) * PAGE_SIZE) : null, pageNumber != null ? PAGE_SIZE : null, owner.getId());
	}

    public Score findById(Integer scoreId) {
        return dao.findByPk(Score.class, scoreId);
    }

    public Comment findCommentByScoreId(Integer scoreId) {
        List<Comment> comments = dao.findByNamedQuery("commentByScoreIdQuery", scoreId);
        return comments.size() > 0 ? comments.get(0) : null;
    }

    public void deleteScores(String[] ids) {
        for (String id : ids) {
            dao.remove(new Score(Integer.valueOf(id)));
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
            score.setLeftPlayers(new HashSet<Player>());
        }
        Object[] scoreIdAndPlayer = null;
        for (Object obj : dao.findByNamedQuery("scoreIdAndLeftPlayerQuery", new Object[] {scoresById.keySet()})) {
            scoreIdAndPlayer = (Object[]) obj;
            scoresById.get(scoreIdAndPlayer[0]).getLeftPlayers().add((Player) scoreIdAndPlayer[1]);
        }
    }

    public void acceptScore(Integer scoreId) {
        Score score = findById(scoreId);
        score.setApprovalResponse(ApprovalResponseEnum.ACCEPTED);
        saveScoreOrComment(score, null);
    }

    public void ignoreScore(Integer scoreId) {
        Score score = findById(scoreId);
        score.setApprovalResponse(ApprovalResponseEnum.IGNORED);
        saveScoreOrComment(score, null);
    }

    public void reviewScore(Integer scoreId, String message) {
        Score score = findById(scoreId);
        score.setRevisionMessage(message);
        saveScoreOrComment(score, null);
    }
}