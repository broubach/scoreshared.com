package com.scoreshared.business.bo;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.scoreshared.business.persistence.GenericOperationsDao;
import com.scoreshared.business.persistence.User;

@Component("userBo")
public class UserBo implements UserDetailsService {

    @Inject
    private GenericOperationsDao dao;

    public void createUser(User user) {
        dao.saveOrUpdate(user);
    }

    public boolean checkEmailExists(String email) {
        return !dao.findByNamedQueryAndNamedParam(User.class, "existentEmailQuery", new String[] { "email" },
                new String[] { email }).isEmpty();
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<User> result = dao.findByNamedQueryAndNamedParam(User.class, "existentEmailQuery",
                new String[] { "email" }, new String[] { username });
        if (result.size() > 0) {
            return result.get(0).toSecurityUser();
        }
        throw new UsernameNotFoundException("no user found");
    }
}