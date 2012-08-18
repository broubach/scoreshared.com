package com.scoreshared.business.bo;

import org.springframework.stereotype.Component;

import com.scoreshared.business.persistence.Score;
import com.scoreshared.business.persistence.User;

@Component
public class ScoreBo extends BaseBo<Score> {

    public void save(User loggedUser, Score score) {
        // TODO: persist score, player and comment
        dao.saveOrUpdate(score);
        // TODO: post in twitter or facebook
    }

}
