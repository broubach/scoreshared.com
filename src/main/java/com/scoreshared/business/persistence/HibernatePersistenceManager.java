package com.scoreshared.business.persistence;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Logger;

import org.springframework.dao.DataAccessException;
import org.springframework.orm.ObjectRetrievalFailureException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * @author Alessio Pace
 * http://forum.springsource.org/showthread.php?25160-Adding-GenericDAO-classes-to-Spring
 */
public class HibernatePersistenceManager extends HibernateDaoSupport {

    protected Logger logger = Logger.getLogger(HibernatePersistenceManager.class.getName());

    public <T> List<T> findAll(Class<T> entityClass) throws DataAccessException {
        List<T> results = getHibernateTemplate().loadAll(entityClass);

        Set<T> set = new HashSet<T>(results);
        results = new ArrayList<T>(set);
        return results;
    }

    public <T> T findById(Class<T> entityClass, Long id) throws DataAccessException {
        T o = getHibernateTemplate().get(entityClass, id);
        if (o == null) {
            logger.warning("uh oh, document with id '" + id + "' not found...");
            throw new ObjectRetrievalFailureException(entityClass, id);
        } else {
            return o;
        }
    }

    public <T> void saveOrUpdate(T entity) throws DataAccessException {
        getHibernateTemplate().saveOrUpdate(entity);
    }

    public <T> T merge(T entity) throws DataAccessException {
        return getHibernateTemplate().merge(entity);
    }

    public <T> void remove(T entity) throws DataAccessException {
        getHibernateTemplate().delete(entity);
    }

    public <T> void removeAll(Class<T> entityClass) throws DataAccessException {
        getHibernateTemplate().deleteAll(this.findAll(entityClass));
    }

    public <T> List<T> findByNamedQueryAndNamedParam(Class<T> entityClass, String queryName, String[] paramNames,
            Object[] values) throws DataAccessException {

        return getHibernateTemplate().findByNamedQueryAndNamedParam(queryName, paramNames, values);
    }

    public <T> List<T> findByNamedQueryAndNamedParam(Class<T> entityClass, String queryName, Map<String, ?> params)
            throws DataAccessException {

        String[] paramNames = new String[params.size()];
        Object[] values = new Object[params.size()];

        List<String> keys = new ArrayList<String>(params.keySet());
        for (int i = 0; i < keys.size(); i++) {
            String k = keys.get(i);
            paramNames[i] = k;
            values[i] = params.get(k);
        }

        return this.findByNamedQueryAndNamedParam(entityClass, queryName, paramNames, values);
    }

    public <T> List<T> findByNamedParam(Class<T> entityClass, String query, String[] paramNames, Object[] values)
            throws DataAccessException {

        return getHibernateTemplate().findByNamedParam(query, paramNames, values);
    }

    public <T> List<T> findByNamedParam(Class<T> entityClass, String query, Map<String, ?> params)
            throws DataAccessException {

        String[] paramNames = new String[params.size()];
        Object[] values = new Object[params.size()];

        List<String> keys = new ArrayList<String>(params.keySet());
        for (int i = 0; i < keys.size(); i++) {
            String k = keys.get(i);
            paramNames[i] = k;
            values[i] = params.get(k);
        }

        return getHibernateTemplate().findByNamedParam(query, paramNames, values);
    }
}