package com.scoreshared.webapp.dto;

import org.springframework.core.convert.converter.Converter;

import com.scoreshared.domain.entity.User;

public class UserConverter extends BaseConverter implements Converter<User, Object[]> {

    @Override
    public Object[] convert(User user) {
        Object[] item = new Object[4];
        item[0] = user.getId();
        item[1] = user.getProfile().getAvatarHash();
        item[2] = user.getFullName();
        item[3] = user.getProfile().getLocation();
        return item;
    }
}