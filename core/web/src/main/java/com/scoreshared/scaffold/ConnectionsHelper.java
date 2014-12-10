package com.scoreshared.scaffold;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
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

    public void populateModelMapWithConnections(ModelMap modelMap, boolean isPasswordEmpty) {
        populateModelMapWithConnections(modelMap, isPasswordEmpty, true);
    }

    public void populateModelMapWithConnections(ModelMap modelMap, boolean isPasswordEmpty, boolean needAccount) {
        Connection<Twitter> twitterConnection = connectionRepository.findPrimaryConnection(Twitter.class);
        String accountIdentifier = null;
        if (twitterConnection != null) {
            if (needAccount) {
                accountIdentifier = twitterConnection.fetchUserProfile().getUsername();
                if (!StringUtils.isEmpty(accountIdentifier)) {
                    modelMap.addAttribute("twitterAccount", accountIdentifier);
                } else {
                    modelMap.addAttribute("twitterAccount", twitterConnection.fetchUserProfile().getEmail());
                }
            }
            modelMap.addAttribute("twitterConnected", true);
        } else {
            modelMap.addAttribute("twitterConnected", false);
        }

        Connection<Facebook> facebookConnection = connectionRepository.findPrimaryConnection(Facebook.class);
        if (facebookConnection != null) {
            if (needAccount) {
                accountIdentifier = facebookConnection.fetchUserProfile().getUsername();
                if (!StringUtils.isEmpty(accountIdentifier)) {
                    modelMap.addAttribute("facebookAccount", accountIdentifier);
                } else {
                    modelMap.addAttribute("facebookAccount", facebookConnection.fetchUserProfile().getEmail());
                }
            }
            modelMap.addAttribute("facebookConnected", true);
        } else {
            modelMap.addAttribute("facebookConnected", false);
        }

        if (isPasswordEmpty) {
            if (twitterConnection != null && facebookConnection != null) {
                modelMap.addAttribute("canDisconnect", true);
            } else if (twitterConnection != null || facebookConnection != null) {
                modelMap.addAttribute("canDisconnect", false);
            }
        } else {
            modelMap.addAttribute("canDisconnect", true);
        }
    }
}
