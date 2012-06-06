package com.scoreshared.business.bo;

import java.lang.reflect.ParameterizedType;

import javax.inject.Inject;

import com.scoreshared.business.persistence.GenericOperationsDao;

public class BaseBo<T> {

    @Inject
    protected GenericOperationsDao dao;

    public T findByPk(int id) {
        return (T) dao.findByPk(
                (Class) ((ParameterizedType) this.getClass().getGenericSuperclass()).getActualTypeArguments()[0], id);
    }
}