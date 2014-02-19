package com.scoreshared.indexloader;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;

public class IndexLoader {
    private static Logger logger = Logger.getLogger(IndexLoader.class);
    
    public static void main(String args[]) {
        Session scoresharedSession = null;
        try {
            SessionFactory scoresharedSessionFactory = new Configuration().configure("scoreshared-hib.cfg.xml")
                    .buildSessionFactory();
            scoresharedSession = scoresharedSessionFactory.openSession();

            logger.info("about to start DB read and lucene load");
            FullTextSession fullTextSession = Search.getFullTextSession(scoresharedSession);
            fullTextSession.createIndexer().startAndWait();
            logger.info("read and load successfully completed");

            System.exit(0);
        } catch (HibernateException e) {
            logger.error(e);

        } catch (InterruptedException e) {
            logger.error(e);
            
        } finally {
            if (scoresharedSession != null) {
                scoresharedSession.close();
            }
        }
    }
}