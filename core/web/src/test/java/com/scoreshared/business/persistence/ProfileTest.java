package com.scoreshared.business.persistence;

import org.apache.commons.beanutils.BeanUtilsBean;
import org.apache.commons.beanutils.ConvertUtilsBean;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.scoreshared.domain.entity.File;
import com.scoreshared.domain.entity.Profile;
import com.scoreshared.domain.entity.SportEnum;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/test-ctx.xml"})
public class ProfileTest {

    private Profile initialState;
    
    @Before
    public void setup() {
        ConvertUtilsBean convertUtilsBean = BeanUtilsBean.getInstance().getConvertUtils();
        convertUtilsBean.register(false, true, -1);

        initialState = new Profile();
        initialState.setCity("");
        initialState.setCountry("");
        initialState.setAcademy("Lob Tenis");
        initialState.setLeftHanded(Boolean.FALSE);
        initialState.setShowContactInfoToFriends(Boolean.TRUE);
        initialState.setPhone("31 96862253");;
        initialState.setAvatarHash("some hash");
        initialState.setStyle("Reasonable style.");
        initialState.setSite(null);
        initialState.setAvatar(new File());
        initialState.setSmallAvatar(new File());
        initialState.setSport(SportEnum.TENNIS);
        initialState.setSignupProcessCompleted(Boolean.TRUE);
    }

    @Test
    public void testCopyDirtyAttributesFrom() {
        Profile currentState = (Profile) initialState.clone();
        currentState.setCity("Ipatinga");
        currentState.setCountry("Brasil");
        currentState.setAcademy("Lob Tênis");
        currentState.setAvatarHash("some hash");
        currentState.setStyle("Reasonable STYLE.");

        initialState.copyDirtyPropertiesFrom(currentState);

        BeanWrapper initialStateWrapper = new BeanWrapperImpl(initialState);
        Assert.assertEquals("city was updated", initialStateWrapper.getPropertyValue("city"), "Ipatinga");
        Assert.assertEquals("country was updated", initialStateWrapper.getPropertyValue("country"), "Brasil");
        Assert.assertEquals("academy was updated", initialStateWrapper.getPropertyValue("academy"), "Lob Tênis");
        Assert.assertTrue("avatarHash was NOT updated", initialStateWrapper.getPropertyValue("avatarHash") == initialState.getAvatarHash());
        Assert.assertEquals("style was updated", initialStateWrapper.getPropertyValue("style"), "Reasonable STYLE.");
    }
}