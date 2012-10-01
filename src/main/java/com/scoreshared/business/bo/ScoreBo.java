package com.scoreshared.business.bo;

import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.scoreshared.business.persistence.Comment;
import com.scoreshared.business.persistence.Player;
import com.scoreshared.business.persistence.Score;
import com.scoreshared.business.persistence.User;

@Component
public class ScoreBo extends BaseBo<Score> {

    public void save(User loggedUser, Score score, Comment comment) {
        score.setOwner(loggedUser);
        score.setWinnerDefined(score.hasWinner());
        replaceExistentPlayersAndSetLoggedUser(loggedUser, score.getLeftPlayers());
        replaceExistentPlayersAndSetLoggedUser(loggedUser, score.getRightPlayers());

        dao.saveOrUpdate(score);

        if (comment != null) {
            comment.setScore(score);
            comment.setOwner(loggedUser);
            dao.saveOrUpdate(comment);
        }
        // TODO: post in twitter or facebook
    }

    private void replaceExistentPlayersAndSetLoggedUser(User loggedUser, Set<Player> players) {
        for (Player player : players) {
            List<Player> result = dao.findByNamedQuery("playerByNameAndOwner", player.getName(), loggedUser.getId());
            if (result.size() > 0) {
                // replaces the user object just to garantee the graph is concise
                result.get(0).setOwner(loggedUser);

                players.remove(player);
                players.add(result.get(0));
            }
        }
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
}
