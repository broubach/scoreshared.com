package com.scoreshared.business.bo;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.scoreshared.business.persistence.User;

@Component("userBo")
public class UserBo extends BaseBo implements UserDetailsService {

    public void createUser(User user) {
        dao.saveOrUpdate(user);
    }

    public boolean checkEmailExists(String email) {
        return !dao.findByNamedQuery("existentEmailQuery", email).isEmpty();
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<User> result = dao.findByNamedQuery("existentEmailQuery", username);
        if (result.size() > 0) {
            return result.get(0).toSecurityUser();
        }
        throw new UsernameNotFoundException("no user found");
    }
}