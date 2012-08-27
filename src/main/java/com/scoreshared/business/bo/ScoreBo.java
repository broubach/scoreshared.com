package com.scoreshared.business.bo;

import java.util.ArrayList;
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

        // TODO: find a way to keep the graph persistence synchronized
        dao.saveOrUpdate(score);

        if (comment != null) {
            comment.setScore(score);
            comment.setOwner(loggedUser);
            dao.saveOrUpdate(comment);
        }
        // TODO: post in twitter or facebook
    }

    private void replaceExistentPlayersAndSetLoggedUser(User loggedUser, Set<Player> players) {
        List<Player> playersFound = new ArrayList<Player>();
        for (Player player : players) {
            List<Player> result = dao.findByNamedQuery("playerByNameAndOwner", player.getName(), loggedUser.getId());
            if (result.size() > 0) {
                playersFound.add(result.get(0));
            } else {
                player.setOwner(loggedUser);
            }
        }
        for (Player player : playersFound) {
            // using equals/hashcode implementation to remove old and add new player
            players.remove(player);
            players.add(player);
        }
    }

    public boolean userHas(User loggedUser, String player) {
        return !dao.findByNamedQuery("playerByNameAndOwner", player, loggedUser.getId()).isEmpty();
    }

    public List<String> listPlayersName(User loggedUser) {
        return dao.findByNamedQuery("playerNameByOwner", loggedUser.getId());
    }
}
