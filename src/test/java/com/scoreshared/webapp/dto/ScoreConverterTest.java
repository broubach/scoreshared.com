package com.scoreshared.webapp.dto;

import java.text.ParseException;

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

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/test-ctx.xml"})
public class ScoreConverterTest {

    @Inject
    protected MessageSource messageResource;

    @Inject
    protected LocaleResolver localeResolver;

    private ScoreConverter fromEntityConverter;

    @Before
    public void setup() {
        fromEntityConverter = new ScoreConverter();
        fromEntityConverter.setMessageResource(messageResource);
        fromEntityConverter.setLocaleResolver(localeResolver);
        fromEntityConverter.setRequest(new MockHttpServletRequest());
    }

    @Test
    public void testGetSets() {
        Integer[][] sets = null;
        try {
            sets = fromEntityConverter.getSets("6x4 6x3 6x2");
            Assert.assertTrue("correct sets read", sets[0][0].equals(6));
            Assert.assertTrue("correct sets read", sets[0][1].equals(4));
            Assert.assertTrue("correct sets read", sets[1][0].equals(6));
            Assert.assertTrue("correct sets read", sets[1][1].equals(3));
            Assert.assertTrue("correct sets read", sets[2][0].equals(6));
            Assert.assertTrue("correct sets read", sets[2][1].equals(2));
        } catch (ParseException e) {
            Assert.fail("sets parsing should not fail");
        }

        try {
            fromEntityConverter.getSets("an invalid set pattern");
        } catch (ParseException e) {
            Assert.assertTrue("sets parsing failed as expected", true);
        }

        try {
            fromEntityConverter.getSets("                ");
        } catch (ParseException e) {
            Assert.assertTrue("sets parsing failed as expected", true);
        }

        try {
            fromEntityConverter.getSets("6x4 6 2 7x ");
        } catch (ParseException e) {
            Assert.assertTrue("sets parsing failed as expected", true);
        }

        try {
            sets = fromEntityConverter.getSets("2x6 6x1 7x5");
            Assert.assertTrue("correct sets read", sets[0][0].equals(2));
            Assert.assertTrue("correct sets read", sets[0][1].equals(6));
            Assert.assertTrue("correct sets read", sets[1][0].equals(6));
            Assert.assertTrue("correct sets read", sets[1][1].equals(1));
            Assert.assertTrue("correct sets read", sets[2][0].equals(7));
            Assert.assertTrue("correct sets read", sets[2][1].equals(5));
        } catch (ParseException e) {
            Assert.fail("sets parsing should not fail");
        }
    }
}