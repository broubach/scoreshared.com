package com.scoreshared.business.bo;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.tuple.Pair;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.core.convert.ConversionService;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.scoreshared.domain.entity.PlayerInstanceComment;
import com.scoreshared.domain.entity.Score;
import com.scoreshared.domain.entity.User;
import com.scoreshared.webapp.controller.ScoreOutcomeEnum;
import com.scoreshared.webapp.dto.ScoreModel;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/test-ctx.xml"})
public class ScoreBoTest {

    @Inject
    private ScoreBo scoreBo;

    @Inject
    private ConversionService conversionService;

    private User loggedUser1;
    private User loggedUser2;

    @Before
    public void setup() {
        scoreBo.initializeLuceneIndex();

        // Benardo
        loggedUser1 = scoreBo.findById(User.class, 38);
        // Sampras
        loggedUser2 = scoreBo.findById(User.class, 39);

        ScoreModel scoreModel = new ScoreModel();
        scoreModel.setSet1Left(6);
        scoreModel.setSet1Right(0);
        scoreModel.setDate("17/01/2014");

        List<String> playersLeft = new ArrayList<String>();
        playersLeft.add("Pete Sampras");
        playersLeft.add("Andre Agassi");
        scoreModel.setPlayersLeft(playersLeft);

        List<String> playersRight = new ArrayList<String>();
        playersRight.add("Bernardo Roubach");
        playersRight.add("Patrick Rafter");
        scoreModel.setPlayersRight(playersRight);
        scoreModel.setNewPlayersNotToBeRemembered(new ArrayList<String>());
        scoreModel.setSportId(0);
        scoreModel.setOwnerId(38);

        scoreModel.setComment("Uau! Ganhamos do Andre Agassi! Muito bom!! 6x0!");

        Score score = conversionService.convert(scoreModel, Score.class);

        PlayerInstanceComment comment = conversionService.convert(scoreModel, PlayerInstanceComment.class);

        scoreBo.save(score.getOwner(), loggedUser1, score, comment, false);

        scoreModel = new ScoreModel();
        scoreModel.setSet1Left(6);
        scoreModel.setSet1Right(3);
        scoreModel.setSet2Left(6);
        scoreModel.setSet2Right(4);
        scoreModel.setSet3Left(5);
        scoreModel.setSet3Right(7);
        scoreModel.setSet4Left(6);
        scoreModel.setSet4Right(4);
        scoreModel.setDate("26/08/2002");

        playersLeft = new ArrayList<String>();
        playersLeft.add("Pete Sampras");
        scoreModel.setPlayersLeft(playersLeft);

        playersRight = new ArrayList<String>();
        playersRight.add("Andre Agassi");
        scoreModel.setPlayersRight(playersRight);
        scoreModel.setNewPlayersNotToBeRemembered(new ArrayList<String>());
        scoreModel.setSportId(0);
        scoreModel.setOwnerId(39);

        scoreModel.setComment("Que final jogada!! meoo deoos!");

        score = conversionService.convert(scoreModel, Score.class);

        comment = conversionService.convert(scoreModel, PlayerInstanceComment.class);

        scoreBo.save(score.getOwner(), loggedUser2, score, comment, false);

        scoreModel = new ScoreModel();
        scoreModel.setSet1Left(6);
        scoreModel.setSet1Right(3);
        scoreModel.setSet2Left(3);
        scoreModel.setSet2Right(6);
        scoreModel.setDate("26/08/2002");

        playersLeft = new ArrayList<String>();
        playersLeft.add("Pete Sampras");
        scoreModel.setPlayersLeft(playersLeft);

        playersRight = new ArrayList<String>();
        playersRight.add("Andre Agassi");
        scoreModel.setPlayersRight(playersRight);
        scoreModel.setNewPlayersNotToBeRemembered(new ArrayList<String>());
        scoreModel.setSportId(0);
        scoreModel.setOwnerId(39);

        scoreModel.setComment("Jogo empatado :/");

        score = conversionService.convert(scoreModel, Score.class);

        comment = conversionService.convert(scoreModel, PlayerInstanceComment.class);

        scoreBo.save(score.getOwner(), loggedUser2, score, comment, false);

        scoreModel = new ScoreModel();
        scoreModel.setDate("26/08/2002");

        playersLeft = new ArrayList<String>();
        playersLeft.add("Pete Sampras");
        scoreModel.setPlayersLeft(playersLeft);

        playersRight = new ArrayList<String>();
        playersRight.add("Andre Agassi");
        scoreModel.setPlayersRight(playersRight);
        scoreModel.setNewPlayersNotToBeRemembered(new ArrayList<String>());
        scoreModel.setSportId(0);
        scoreModel.setOwnerId(39);

        scoreModel.setComment("Treino!!");

        score = conversionService.convert(scoreModel, Score.class);

        comment = conversionService.convert(scoreModel, PlayerInstanceComment.class);

        scoreBo.save(score.getOwner(), loggedUser2, score, comment, false);
    }

    @Test
    public void testSearchScore() {
        // 'uau' is a word present in my comments, so it will be found
        Pair<List<Score>, Integer> scoresAndCount = scoreBo.findScores(null, "uau", ScoreOutcomeEnum.ALL, true, loggedUser1.getId());
        Assert.assertTrue("found 'uau', all outcomes, asceding order", scoresAndCount.getLeft().size() == 1);

        // pete's comments wont be found
        scoresAndCount = scoreBo.findScores(null, "final", ScoreOutcomeEnum.ALL, true, loggedUser1.getId());
        Assert.assertTrue("wont find 'final', all outcomes, asceding order", scoresAndCount.getLeft().isEmpty());

        // pete is a player who played with me, so a score in which he participated should be found
        scoresAndCount = scoreBo.findScores(null, "pete", ScoreOutcomeEnum.ALL, true, loggedUser1.getId());
        Assert.assertTrue("found 'pete', all outcomes, asceding order", scoresAndCount.getLeft().size() == 1);

        // 'uau' is a word present in my comments in a match which I lost, so it will be found
        scoresAndCount = scoreBo.findScores(null, "uau", ScoreOutcomeEnum.LOSS, true, loggedUser1.getId());
        Assert.assertTrue("found 'uau', loss outcomes, asceding order", scoresAndCount.getLeft().size() == 1);

        // 'uau' is a word present in my comments, but in a match that I didn't win, so it wont be found
        scoresAndCount = scoreBo.findScores(null, "uau", ScoreOutcomeEnum.WIN, true, loggedUser1.getId());
        Assert.assertTrue("wont find 'uau', win outcomes, asceding order", scoresAndCount.getLeft().isEmpty());

        // pete is a player who played with me, but in a match that I didnt win, so it wont be found
        scoresAndCount = scoreBo.findScores(null, "pete", ScoreOutcomeEnum.WIN, true, loggedUser1.getId());
        Assert.assertTrue("found 'pete', win outcomes, asceding order", scoresAndCount.getLeft().isEmpty());

        // pete practiced with agassi, so it will be found
        scoresAndCount = scoreBo.findScores(null, null, ScoreOutcomeEnum.PRACTICE, true, loggedUser2.getId());
        Assert.assertTrue("found practice Pete played", scoresAndCount.getLeft().size() == 1);

        // pete played a match that tied against agassi, so it will be found
        scoresAndCount = scoreBo.findScores(null, null, ScoreOutcomeEnum.TIE, true, loggedUser2.getId());
        Assert.assertTrue("found tied match Pete played", scoresAndCount.getLeft().size() == 1);
    }
}