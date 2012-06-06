package com.scoreshared.business.bo;

import java.util.List;

import org.springframework.stereotype.Component;

import com.scoreshared.business.persistence.File;
import com.scoreshared.business.persistence.User;

@Component
public class FileBo extends BaseBo<File> {

    public static final String DEFAULT_AVATAR_KEY = "defaultAvatarKey";
    public static final Integer DEFAULT_AVATAR_ID = 4;
    public static final String SMALL_DEFAULT_AVATAR_KEY = "smallDefaultAvatarKey";
    public static final Integer SMALL_DEFAULT_AVATAR_ID = 7;
    public static final String CURRENT_USERS_AVATAR = "currentUsersAvatar";

    public List<Integer> getSmallAvatarIdsByHash(String hash) {
        return dao.findByNamedQuery("smallAvatarIdByHashQuery", hash);
    }

    public List<Integer> getAvatarIdsByHash(String hash) {
        return dao.findByNamedQuery("avatarIdByHashQuery", hash);
    }

    public User getUserByEmail(String email) {
        List<User> result = dao.findByNamedQuery("existentEmailQuery", email);
        return result.isEmpty() ? null : result.get(0);
    }
}
