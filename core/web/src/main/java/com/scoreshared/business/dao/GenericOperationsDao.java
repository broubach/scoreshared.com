package com.scoreshared.business.dao;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang3.tuple.MutablePair;
import org.apache.commons.lang3.tuple.Pair;
import org.apache.lucene.search.Sort;
import org.apache.lucene.search.SortField;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.LazyInitializationException;
import org.hibernate.MappingException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.hibernate.search.FullTextQuery;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.hibernate.search.query.dsl.BooleanJunction;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.hibernate.search.query.dsl.TermContext;

import com.scoreshared.domain.entity.BaseEntity;

public class GenericOperationsDao {

    private SessionFactory sessionFactory;
    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    protected Logger logger = Logger.getLogger(GenericOperationsDao.class.getName());

    public <T> T findByPk(Class<T> clazz, Integer id, String... collectionsToLoad) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
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

    public List findByNamedQuery(String namedQuery, Object... paramValues) {
        return findByNamedQueryWithLimits(namedQuery, null, null, paramValues).getLeft();
    }

    public Pair<List, Integer> findByNamedQueryWithLimits(String namedQuery, Integer firstResult, Integer maxResults, Object... paramValues) {
        Session session = null;
        MutablePair<List, Integer> result = new MutablePair<List, Integer>();
        try {
            session = sessionFactory.openSession();
            Query query = session.getNamedQuery(namedQuery);
            populateQueryAndLimits(firstResult, maxResults, query, paramValues);
            result.setLeft(query.list());
            try {
                if (firstResult != null && maxResults != null) {
                    Query countQuery = session.getNamedQuery(namedQuery + ".count");
                    populateQuery(countQuery, paramValues);
                    Number count = (Number) countQuery.uniqueResult();
                    if (count != null) {
                        if (count.intValue() % maxResults > 0) {
                            result.setRight((count.intValue() / maxResults) + 1);
                        } else {
                            result.setRight(count.intValue() / maxResults);
                        }
                    }
                }
            } catch (MappingException ex) {
                // do nothing, there's no count query mapped.
            }
            return result;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    private void populateQueryAndLimits(Integer firstResult, Integer maxResults, Query query, Object... paramValues) {
        if (firstResult != null) {
            query.setFirstResult(firstResult);
        }
        if (maxResults != null) {
            query.setMaxResults(maxResults);
        }
        populateQuery(query, paramValues);
    }

    private void populateQuery(Query query, Object... paramValues) {
        if (paramValues != null) {
            if (paramValues.length > 0 && paramValues[0] instanceof Map) {
                query.setProperties((Map) paramValues[0]);
            } else {
                for (int i = 0; i < query.getNamedParameters().length; i++) {
                    if (paramValues[i] instanceof Collection) {
                        query.setParameterList(query.getNamedParameters()[i], (Collection) paramValues[i]);
                    } else {
                        query.setParameter(query.getNamedParameters()[i], paramValues[i]);
                    }
                }
            }
        }
    }
    
    public List findByNamedQueryAndNamedParam(String queryName, Map<String, ?> params) {
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

    public List findByNamedQueryAndNamedParam(String queryName, String[] paramNames, Object[] values) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.getNamedQuery(queryName);
            for (int i = 0; i < paramNames.length; i++) {
                query.setParameter(paramNames[i], values[i]);
            }
            return query.list();

        } catch (HibernateException e) {
            throw new RuntimeException(e);
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    public <T> T findFirst(Class<T> clazz) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
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
            session = sessionFactory.openSession();
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
        Session session = null;
        Transaction tx = null;
        try {
            session = sessionFactory.openSession();
            tx = session.beginTransaction();
            session.saveOrUpdate(entity);
            tx.commit();

        } catch (HibernateException e) {
            e.printStackTrace();
            if (tx != null) {
                tx.rollback();
            }
            throw new RuntimeException(e);
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    public <T> void remove(T entity) {
        Session session = null;
        Transaction t = null;
        try {
            session = sessionFactory.openSession();
            t = session.beginTransaction();
            session.delete(entity);
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

    public <T> void removeAll(Class<T> entityClass) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            session.createQuery("delete from " + entityClass.getName()).executeUpdate();

        } catch (HibernateException e) {
            throw new RuntimeException(e);
        } finally {
            if (session != null) {
                session.close();
            }
        }
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
        return sessionFactory.getCurrentSession().beginTransaction();
    }

    public void rollbackTransaction(Transaction tx) {
        tx.rollback();
        sessionFactory.getCurrentSession().close();
    }

    public int execute(String namedQuery, Object... paramValues) {
        Session session = null;
        Transaction t = null;
        try {
            session = sessionFactory.openSession();
            t = session.beginTransaction();
            Query query = session.getNamedQuery(namedQuery);
            populateQueryAndLimits(null, null, query, paramValues);
            int result = query.executeUpdate();
            t.commit();
            return result;

        } catch (HibernateException e) {
            t.rollback();
            throw new RuntimeException(e);
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    public List findByQueryWithLimits(String queryStr, Integer firstResult, Integer maxResults, Object... paramValues) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query query = session.createQuery(queryStr);
            populateQueryAndLimits(firstResult, maxResults, query, paramValues);
            return query.list();
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    public void initializeLuceneIndex() {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            FullTextSession fullTextSession = Search.getFullTextSession(session);
            fullTextSession.createIndexer().startAndWait();
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    public <T> Pair<List<T>, Integer> searchInLucene(Integer pageNumber, Integer pageSize, Class<T> clazz, Object[] sortField, List<Object[]> fieldAndValuePairs) {
        return searchInLucene(pageNumber, pageSize, clazz, sortField, fieldAndValuePairs, false);
    }

    public <T> Integer countInLucene(Class<T> clazz, List<Object[]> fieldAndValuePairs) {
        return searchInLucene(null, null, clazz, null, fieldAndValuePairs, true).getRight();
    }

    private <T> Pair<List<T>, Integer> searchInLucene(Integer pageNumber, Integer pageSize, Class<T> clazz, Object[] sortField, List<Object[]> fieldAndValuePairs, boolean justCount) {
        MutablePair<List<T>, Integer> result = new MutablePair<List<T>, Integer>(); 
        if (fieldAndValuePairs == null || fieldAndValuePairs.isEmpty()) {
            result.setRight(0);
            return result;
        }

        Session session = null;
        try {
            session = sessionFactory.openSession();
            FullTextSession fullTextSession = Search.getFullTextSession(session);

            org.apache.lucene.search.Query finalQuery = toJoinedLuceneQuery(clazz, fullTextSession, fieldAndValuePairs);

            FullTextQuery hibQuery = fullTextSession.createFullTextQuery(finalQuery, clazz);
            if (sortField != null) {
                Sort sort = new Sort(new SortField((String) sortField[0], (Integer) sortField[1]));
                hibQuery.setSort(sort);
            }

            if (pageNumber != null && pageSize != null) {
                hibQuery.setFirstResult(pageNumber * pageSize);
                hibQuery.setMaxResults(pageSize);
            }

            if (!justCount) {
                result.setLeft(hibQuery.list());
            }
            result.setRight(hibQuery.getResultSize());

        } catch (Exception e) {
            throw new RuntimeException(e);

        } finally {
            if (session != null) {
                session.close();
            }
        }
        return result;
    }

    private org.apache.lucene.search.Query toJoinedLuceneQuery(Class clazz, FullTextSession fullTextSession, List<Object[]> fieldAndValuePairs) {
        QueryBuilder qb = fullTextSession.getSearchFactory().buildQueryBuilder().forEntity(clazz).get();
        
        TermContext termContext = qb.keyword();
        List<org.apache.lucene.search.Query> queries = new ArrayList<org.apache.lucene.search.Query>();
        for (Object[] fieldAndValuePair : fieldAndValuePairs) {
            queries.add(termContext.onFields(((String)fieldAndValuePair[0]).split(" ")).matching(fieldAndValuePair[1])
                    .createQuery());
        }
        org.apache.lucene.search.Query finalQuery = null;
        if (queries.size() > 0) {
            BooleanJunction junction = qb.bool();
            for (org.apache.lucene.search.Query query : queries) {
                junction = junction.must(query);
            }
            finalQuery = junction.createQuery();
        
        } else if (queries.size() == 1) {
            finalQuery = queries.get(0);
        }
        return finalQuery;
    }

    public BaseEntity mergeAndInitialize(BaseEntity entity, String collectionName) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            entity = (BaseEntity) session.merge(entity);

            Hibernate.initialize(PropertyUtils.getProperty(entity, collectionName));

            return entity;

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
}