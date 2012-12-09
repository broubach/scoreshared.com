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

import com.scoreshared.business.persistence.Player;
import com.scoreshared.business.persistence.Score;
import com.scoreshared.business.persistence.User;

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

        Set<Player> leftPlayers = new HashSet<Player>();
        Player player = new Player(user1.getFullName(), user1);
        player.setAssociation(user1);
        leftPlayers.add(player);
        score.setLeftPlayers(leftPlayers);

        Set<Player> rightPlayers = new HashSet<Player>();
        player = new Player("Andre Agassi", user2);
        player.setAssociation(user2);
        rightPlayers.add(player);
        score.setRightPlayers(rightPlayers);

        score.setSet1Left(6);
        score.setSet1Right(1);
    }

    @Test
    public void testGetItemText() {
        ScoreItemModel model = new ScoreItemModel(score, null, user1, messageResource, localeResolver.resolveLocale(new MockHttpServletRequest()));
        Assert.assertTrue("expected string", "6x1, contra Andre Agassi".equals(model.getDetailText()));

        score.setSet2Left(2);
        score.setSet2Right(6);
        score.setSet3Left(6);
        score.setSet3Right(4);
        Assert.assertTrue("expected string", "6x1 2x6 6x4, contra Andre Agassi".equals(model.getDetailText()));

        model = new ScoreItemModel(score, null, user2, messageResource, localeResolver.resolveLocale(new MockHttpServletRequest()));
        Assert.assertTrue("inverted point of view", "1x6 6x2 4x6, contra Pete Sampras".equals(model.getDetailText()));
    }
}
