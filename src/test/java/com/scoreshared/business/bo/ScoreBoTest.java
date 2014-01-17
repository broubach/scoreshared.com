package com.scoreshared.business.bo;

import javax.inject.Inject;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.scoreshared.business.persistence.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/test-ctx.xml"})
public class ScoreBoTest {

    @Inject
    private ScoreBo bo;

    private User loggedUser;

    @Before
    public void setup() {
        loggedUser = bo.findById(User.class, 38);
        bo.initializeLuceneIndex();
    }

    @Test
    public void testSearchScore() {
//        // 'vergonha' is a word present in my comments, so it will be found
//        List<Score> scores = bo.searchScore("vergonha", ScoreOutcomeFilterEnum.ALL, true);
//        Assert.assertEquals("found 'vergonha', all outcomes, asceding order", scores.size() == 1);
//
//        // pete's comments wont be found
//        scores = bo.searchScore("vergonha pete", ScoreOutcomeFilterEnum.ALL, true);
//        Assert.assertTrue("wont find 'vergonha pete', all outcomes, asceding order", scores.isEmpty());
//
//        // pete is a player who played with me, so a score in which he participated should be found
//        scores = bo.searchScore("pete", ScoreOutcomeFilterEnum.ALL, true);
//        Assert.assertTrue("found 'pete', all outcomes, asceding order", scores.size() == 1);
//
//        // 'vergonha' is a word present in my comments in a match which I lost, so it will be found
//        scores = bo.searchScore("vergonha", ScoreOutcomeFilterEnum.LOSS, true);
//        Assert.assertTrue("found 'vergonha', loss outcomes, asceding order", scores.size() == 1);
//
//        // 'vergonha' is a word present in my comments, but in a match that I didn't win, so it wont be found
//        scores = bo.searchScore("vergonha", ScoreOutcomeFilterEnum.WIN, true);
//        Assert.assertTrue("wont find 'vergonha', win outcomes, asceding order", scores.isEmpty());
//
//        // pete is a player who played with me, but in a match that I didnt win, so it wont be found
//        scores = bo.searchScore("pete", ScoreOutcomeFilterEnum.WIN, true);
//        Assert.assertTrue("found 'pete', win outcomes, asceding order", scores.size() == 1);
    }
}