package com.scoreshared.scaffold;

import java.util.Date;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.AuthenticationSuccessEvent;
import org.springframework.stereotype.Component;

import com.scoreshared.business.bo.GraphBo;
import com.scoreshared.business.bo.UserBo;
import com.scoreshared.business.persistence.Player;
import com.scoreshared.business.persistence.User;

@Component
public class UserLoggedListener implements ApplicationListener<AuthenticationSuccessEvent> {

    public static final String ASSOCIATED_PLAYER = "associatedPlayer";
    public static final String LOGGED_USER_AVATAR_HASH = "loggedUserAvatarHash";

    @Inject
    private GraphBo graphBo;
    
    @Inject
    private UserBo userBo;

    @Override
    public void onApplicationEvent(AuthenticationSuccessEvent appEvent) {
        AuthenticationSuccessEvent event = (AuthenticationSuccessEvent) appEvent;
        User user = (User) event.getAuthentication().getPrincipal();

        CustomWebAuthenticationDetails details = (CustomWebAuthenticationDetails) event.getAuthentication().getDetails();

        Player player = graphBo.findPlayerByAssociationAndOwner(user.getId(), user.getId());

        details.getSession().setAttribute(ASSOCIATED_PLAYER, player);

        if (user.getProfile() != null && !StringUtils.isEmpty(user.getProfile().getAvatarHash())) {
            details.getSession().setAttribute(LOGGED_USER_AVATAR_HASH, user.getProfile().getAvatarHash());
        } else {
            details.getSession().setAttribute(LOGGED_USER_AVATAR_HASH, "default");
        }

        user.setBeforeLastAccess(user.getLastAccess());
        user.setLastAccess(new Date());
        userBo.updateUser(user);
    }
}