package com.scoreshared.business.bo;

import javax.inject.Inject;

import org.springframework.stereotype.Component;

import com.scoreshared.business.persistence.GenericOperationsDao;
import com.scoreshared.business.persistence.User;

@Component
public class UserBo {

    @Inject
    private GenericOperationsDao dao;

    public void createUser(User user) {
        dao.saveOrUpdate(user);
    }

    public boolean checkEmailExists(String email) {
        return !dao.findByNamedQueryAndNamedParam(User.class, "existentEmailQuery", new String[] { "email" },
                new String[] { email }).isEmpty();
    }
}
