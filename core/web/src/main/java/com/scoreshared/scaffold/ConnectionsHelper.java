package com.scoreshared.scaffold;

import javax.inject.Inject;

import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.twitter.api.Twitter;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

@Component
public class ConnectionsHelper {

    public static final String IS_USER_IN_WELCOME_STEPS = "isUserInWelcomeSteps";

    @Inject
    private ConnectionRepository connectionRepository;

    public void populateModelMapWithConnections(ModelMap modelMap) {
        Connection<Twitter> twitterConnection = connectionRepository.findPrimaryConnection(Twitter.class);
        if (twitterConnection != null) {
            modelMap.addAttribute("twitterAccount", twitterConnection.fetchUserProfile().getUsername());
            modelMap.addAttribute("twitterConnected", true);
        } else {
            modelMap.addAttribute("twitterConnected", false);
        }

        Connection<Facebook> facebookConnection = connectionRepository.findPrimaryConnection(Facebook.class);
        if (facebookConnection != null) {
            modelMap.addAttribute("facebookAccount", facebookConnection.fetchUserProfile().getUsername());
            modelMap.addAttribute("facebookConnected", true);
        } else {
            modelMap.addAttribute("facebookConnected", false);
        }
    }
}
