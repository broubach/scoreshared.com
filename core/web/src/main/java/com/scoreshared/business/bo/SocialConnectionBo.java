package com.scoreshared.business.bo;

import java.util.HashSet;
import java.util.Set;

import javax.inject.Inject;

import org.springframework.social.connect.jdbc.JdbcUsersConnectionRepository;
import org.springframework.stereotype.Component;

@Component
public class SocialConnectionBo {

    @Inject
    private JdbcUsersConnectionRepository connectionRepository;

    public boolean isUserConnected(String userId, String providerId, String userProviderId) {
        Set<String> providerUserIds = new HashSet<String>();
        providerUserIds.add(userProviderId);

        Set<String> usersId = connectionRepository.findUserIdsConnectedTo(providerId, providerUserIds);
        return usersId.contains(userId);
    }
}
