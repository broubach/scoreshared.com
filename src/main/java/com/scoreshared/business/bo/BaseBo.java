package com.scoreshared.business.bo;

import javax.inject.Inject;

import com.scoreshared.business.persistence.GenericOperationsDao;

public class BaseBo<T> {

    @Inject
    protected GenericOperationsDao dao;
}