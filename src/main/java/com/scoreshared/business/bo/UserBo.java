package com.scoreshared.business.bo;

import javax.inject.Inject;

import org.springframework.stereotype.Component;

import com.scoreshared.business.persistence.GenericOperationsDao;

@Component
public class UserBo {

    @Inject
    private GenericOperationsDao dao;

}
