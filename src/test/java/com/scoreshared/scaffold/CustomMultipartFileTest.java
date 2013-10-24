package com.scoreshared.scaffold;

import java.io.IOException;
import java.net.MalformedURLException;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/test-ctx.xml"})
public class CustomMultipartFileTest {

    @Test
    public void testCreateCustomMultipartFile() {
        try {
            CustomMultipartFile file = new CustomMultipartFile("http://graph.facebook.com/784446251/picture");
            Assert.assertTrue(file.getSize() > 0);
        } catch (MalformedURLException e) {
            Assert.fail(e.toString());
        } catch (IOException e) {
            Assert.fail(e.toString());
        }
    }
}
