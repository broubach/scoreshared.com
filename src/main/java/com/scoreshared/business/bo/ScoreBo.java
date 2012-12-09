package com.scoreshared.business.bo;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.scoreshared.business.persistence.Comment;
import com.scoreshared.business.persistence.Player;
import com.scoreshared.business.persistence.Score;
import com.scoreshared.business.persistence.User;

@Component
public class ScoreBo extends BaseBo<Score> {

    private static final int PAGE_SIZE = 25;

    public void save(User loggedUser, Score score, Comment comment) {
        score.setOwner(loggedUser);
        score.setWinnerDefined(score.hasWinner());
        replaceExistentPlayersAndSetLoggedUser(loggedUser, score.getLeftPlayers());
        replaceExistentPlayersAndSetLoggedUser(loggedUser, score.getRightPlayers());

        if (comment != null) {
            comment.setScore(score);
            comment.setOwner(loggedUser);
            dao.saveOrUpdate(comment);
        } else {

            dao.saveOrUpdate(score);
        }
        // TODO: post in twitter or facebook
    }

    private void replaceExistentPlayersAndSetLoggedUser(User loggedUser, Set<Player> players) {
        Set<Player> replacedPlayers = new HashSet<Player>();
        Player player = null;
        for (Iterator<Player> it = players.iterator(); it.hasNext(); ) {
            player = it.next();

            List<Player> result = dao.findByNamedQuery("playerByNameAndOwner", player.getName(), loggedUser.getId());
            if (result.size() > 0) {
                // replaces the user object just to garantee the graph is concise
                result.get(0).setOwner(loggedUser);
                if (result.get(0).getAssociation() != null && result.get(0).getAssociation().getId().equals(loggedUser.getId())) {
                    result.get(0).setAssociation(loggedUser);
                }

                it.remove();
                replacedPlayers.add(result.get(0));
            }
        }
        
        players.addAll(replacedPlayers);
    }

    public boolean hasAlreadyAssociatedPlayer(User user, String playerName) {
        return !dao.findByNamedQuery("playerByNameAndOwnerAndAssociated", playerName, user.getId()).isEmpty();
    }

    public List<String> listPlayersName(User loggedUser) {
        return dao.findByNamedQuery("playerNameByOwner", loggedUser.getId());
    }

    public boolean hasScores(User loggedUser) {
        return !dao.findByNamedQuery("hasScoreWithOwnerId", loggedUser.getId()).isEmpty();
    }

    public List<Object[]> findScores(Integer pageNumber, String orderField, Boolean ascending) {
        String query = new StringBuilder().append("select score, comment from Comment comment right outer join comment.score score order by score.").append(orderField).append(ascending ? " asc" : " desc").toString();
        return dao.findByQueryWithLimits(query, (pageNumber - 1) * PAGE_SIZE, PAGE_SIZE);
	}
}
