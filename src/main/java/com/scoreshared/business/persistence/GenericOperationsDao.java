package com.scoreshared.business.persistence;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import org.apache.commons.beanutils.BeanUtils;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.LazyInitializationException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class GenericOperationsDao extends HibernateDaoSupport {

    protected Logger logger = Logger.getLogger(GenericOperationsDao.class.getName());

    public <T> T findByPk(Class<T> clazz, Integer id, String... collectionsToLoad) {
        Session session = null;
        try {
            session = getHibernateTemplate().getSessionFactory().openSession();
            Object entity = session.get(clazz, id);
            if (collectionsToLoad != null) {
                for (String collection : collectionsToLoad) {
                    Hibernate.initialize(BeanUtils.getProperty(entity, collection));
                }
            }

            return (T) entity;
        } catch (HibernateException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (InvocationTargetException e) {
            throw new RuntimeException(e);
        } catch (NoSuchMethodException e) {
            throw new RuntimeException(e);
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    public List find(String query) {
        return getHibernateTemplate().find(query);
    }

    public <T> List<T> findAll(Class<T> c) {
        return getHibernateTemplate().loadAll(c);
    }

    public List findByNamedQuery(String namedQuery, Object... paramValues) {
        return getHibernateTemplate().findByNamedQuery(namedQuery, paramValues);
    }

    public List findByNamedQueryWithLimits(String namedQuery, int firstResult, int maxResults, Object... paramValues) {
        Session session = null;
        try {
            session = getHibernateTemplate().getSessionFactory().openSession();
            org.hibernate.Query query = session.getNamedQuery(namedQuery);
            query.setFirstResult(firstResult);
            query.setMaxResults(maxResults);
            if (paramValues != null) {
                for (int i = 0; i < query.getNamedParameters().length; i++) {
                    query.setParameter(query.getNamedParameters()[i], paramValues[i]);
                }
            }
            return query.list();
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    public <T> List<T> findByNamedQueryAndNamedParam(String queryName, Map<String, ?> params) {
        String[] paramNames = new String[params.size()];
        Object[] values = new Object[params.size()];

        List<String> keys = new ArrayList<String>(params.keySet());
        for (int i = 0; i < keys.size(); i++) {
            String k = keys.get(i);
            paramNames[i] = k;
            values[i] = params.get(k);
        }
        return findByNamedQueryAndNamedParam(queryName, paramNames, values);
    }

    public <T> List<T> findByNamedQueryAndNamedParam(String queryName, String[] paramNames, Object[] values) {
        return getHibernateTemplate().findByNamedQueryAndNamedParam(queryName, paramNames, values);
    }

    public <T> T findFirst(Class<T> clazz) {
        Session session = null;
        try {
            session = getHibernateTemplate().getSessionFactory().openSession();
            Criteria criteria = session.createCriteria(clazz);
            criteria.setFirstResult(0);
            criteria.setMaxResults(1);
            return (T) criteria.uniqueResult();

        } catch (HibernateException e) {
            throw new RuntimeException(e);
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    public <T extends BaseEntity> T findFirst(Class<T> clazz, T notToBe) {
        Session session = null;
        try {
            session = getHibernateTemplate().getSessionFactory().openSession();
            Criteria criteria = session.createCriteria(clazz);
            criteria.setFirstResult(0);
            criteria.setMaxResults(1);
            criteria.add(Restrictions.not(Restrictions.eq("id", notToBe.getId())));
            return (T) criteria.uniqueResult();

        } catch (HibernateException e) {
            throw new RuntimeException(e);
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    public <T> void saveOrUpdate(T entity) {
        getHibernateTemplate().saveOrUpdate(entity);
    }

    public <T> void remove(T entity) {
        getHibernateTemplate().delete(entity);
    }

    public <T> void removeAll(Class<T> entityClass) {
        getHibernateTemplate().deleteAll(this.findAll(entityClass));
    }

    public <T> T merge(T entity) {
        return getHibernateTemplate().merge(entity);
    }

    public static boolean isInitialized(Object obj, String proxy) {
        try {
            if (BeanUtils.getProperty(obj, proxy).equals("com.sun.jdi.InvocationException occurred invoking method.")) {
                return false;
            }
            return true;
        } catch (LazyInitializationException e) {
            return false;
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (InvocationTargetException e) {
            throw new RuntimeException(e);
        } catch (NoSuchMethodException e) {
            throw new RuntimeException(e);
        }
    }

    public Transaction beginTransaction() {
        return getHibernateTemplate().getSessionFactory().getCurrentSession().beginTransaction();
    }

    public void rollbackTransaction(Transaction tx) {
        tx.rollback();
        getHibernateTemplate().getSessionFactory().getCurrentSession().close();
    }

    public void execute(String namedQuery, Object... paramValues) {
        Session session = null;
        Transaction t = null;
        try {
            session = getHibernateTemplate().getSessionFactory().openSession();
            t = session.beginTransaction();
            Query query = session.getNamedQuery(namedQuery);
            if (paramValues != null) {
                for (int i = 0; i < query.getNamedParameters().length; i++) {
                    query.setParameter(query.getNamedParameters()[i], paramValues[i]);
                }
            }
            query.executeUpdate();
            t.commit();

        } catch (HibernateException e) {
            t.rollback();
            throw new RuntimeException(e);
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }
}