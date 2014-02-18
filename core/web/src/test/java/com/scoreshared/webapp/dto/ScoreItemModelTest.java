package com.scoreshared.webapp.dto;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.inject.Inject;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.MessageSource;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.servlet.LocaleResolver;

import com.scoreshared.domain.entity.PlayerInstance;
import com.scoreshared.domain.entity.Score;
import com.scoreshared.domain.entity.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/test-ctx.xml"})
public class ScoreItemModelTest {

    private User user1;
    private User user2;

    private Score score;

    @Inject
    private MessageSource messageResource;

    @Inject
    private LocaleResolver localeResolver;

    @Before
    public void setup() {
        user1 = new User();
        user1.setId(1);
        user1.setFirstName("Pete");
        user1.setLastName("Sampras");

        user2 = new User();
        user2.setId(2);
        user2.setFirstName("Mr. Andre");
        user2.setLastName("Agassi");

        score = new Score();
        score.setDate(new Date());
        score.setTime(new Date());
        score.setId(1);
        score.setOwner(user1);

        Set<PlayerInstance> leftPlayers = new HashSet<PlayerInstance>();
        PlayerInstance playerInstance = new PlayerInstance(user1.getFullName(), user1);
        playerInstance.setAssociation(user1);
        leftPlayers.add(playerInstance);
        score.setLeftPlayers(leftPlayers);

        Set<PlayerInstance> rightPlayers = new HashSet<PlayerInstance>();
        playerInstance = new PlayerInstance("Andre Agassi", user2);
        playerInstance.setAssociation(user2);
        rightPlayers.add(playerInstance);
        score.setRightPlayers(rightPlayers);

        score.setSet1Left(6);
        score.setSet1Right(1);
    }

    @Test
    public void testGetItemText() {
        ScoreItemModel model = new ScoreItemModel(score, null, user1, messageResource, localeResolver.resolveLocale(new MockHttpServletRequest()));
        Assert.assertTrue("expected string", "6x1 against Andre Agassi".equals(model.getDetailText()));

        score.setSet2Left(2);
        score.setSet2Right(6);
        score.setSet3Left(6);
        score.setSet3Right(4);
        Assert.assertTrue("expected string", "6x1 2x6 6x4 against Andre Agassi".equals(model.getDetailText()));

        model = new ScoreItemModel(score, null, user2, messageResource, localeResolver.resolveLocale(new MockHttpServletRequest()));
        Assert.assertTrue("inverted point of view", "1x6 6x2 4x6 against Pete Sampras".equals(model.getDetailText()));
    }
    
    @Test
    public void testGetItemTextPart1() {
        ScoreItemModel model = new ScoreItemModel(score, null, user1, messageResource, localeResolver.resolveLocale(new MockHttpServletRequest()));
        Assert.assertTrue("expected string", "6x1".equals(model.getDetailTextPart1()));

        score.setSet2Left(2);
        score.setSet2Right(6);
        score.setSet3Left(6);
        score.setSet3Right(4);
        Assert.assertTrue("expected string", "6x1 2x6 6x4".equals(model.getDetailTextPart1()));

        model = new ScoreItemModel(score, null, user2, messageResource, localeResolver.resolveLocale(new MockHttpServletRequest()));
        Assert.assertTrue("inverted point of view", "1x6 6x2 4x6".equals(model.getDetailTextPart1()));
    }

    @Test
    public void testGetItemTextPart2() {
        ScoreItemModel model = new ScoreItemModel(score, null, user1, messageResource, localeResolver.resolveLocale(new MockHttpServletRequest()));
        Assert.assertTrue("expected string", "against Andre Agassi".equals(model.getDetailTextPart2()));

        score.setSet2Left(2);
        score.setSet2Right(6);
        score.setSet3Left(6);
        score.setSet3Right(4);
        Assert.assertTrue("expected string", "against Andre Agassi".equals(model.getDetailTextPart2()));

        model = new ScoreItemModel(score, null, user2, messageResource, localeResolver.resolveLocale(new MockHttpServletRequest()));
        Assert.assertTrue("inverted point of view", "against Pete Sampras".equals(model.getDetailTextPart2()));
    }

    @Test
    public void testGetDetailTextHighlightingWinner() {
        ScoreItemModel model = new ScoreItemModel(score, null, user1, messageResource, localeResolver.resolveLocale(new MockHttpServletRequest()));
        Assert.assertTrue("expected string", "1x<span class='winner'>6</span>".equals(model.getDetailTextHighlightingWinnerWithLoggedUserAtRight()));

        score.setSet2Left(2);
        score.setSet2Right(6);
        score.setSet3Left(6);
        score.setSet3Right(4);
        Assert.assertTrue("expected string", "1x<span class='winner'>6</span> <span class='winner'>6</span>x2 4x<span class='winner'>6</span>".equals(model.getDetailTextHighlightingWinnerWithLoggedUserAtRight()));

        model = new ScoreItemModel(score, null, user2, messageResource, localeResolver.resolveLocale(new MockHttpServletRequest()));
        Assert.assertTrue("inverted point of view", "<span class='winner'>6</span>x1 2x<span class='winner'>6</span> <span class='winner'>6</span>x4".equals(model.getDetailTextHighlightingWinnerWithLoggedUserAtRight()));
    }
}