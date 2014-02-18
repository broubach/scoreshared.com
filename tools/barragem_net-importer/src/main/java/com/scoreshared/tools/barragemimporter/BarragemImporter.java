package com.scoreshared.tools.barragemimporter;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.scoreshared.domain.entity.Player;
import com.scoreshared.domain.entity.PlayerInstanceComment;
import com.scoreshared.domain.entity.Score;
import com.scoreshared.domain.entity.User;

public class BarragemImporter {
    private static Logger logger = Logger.getLogger(BarragemImporter.class);
    
    private Map<String, Object> context = new HashMap<String, Object>();

    public static void main(String args[]) {
        Session barragemSession = null;
        Session scoresharedSession = null;
        Transaction t = null;
        try {
            SessionFactory barragemSessionFactory = new Configuration().configure("barragem-hib.cfg.xml")
                    .buildSessionFactory();
            barragemSession = barragemSessionFactory.openSession();

            SessionFactory scoresharedSessionFactory = new Configuration().configure("scoreshared-hib.cfg.xml")
                    .buildSessionFactory();
            scoresharedSession = scoresharedSessionFactory.openSession();
            t = scoresharedSession.beginTransaction();

            BarragemImporter importer = new BarragemImporter();
            importer.executeETL(scoresharedSession, barragemSession);
            t.commit();
            System.exit(0);
        } catch (HibernateException e) {
            e.printStackTrace();
            logger.error(e);
            if (t != null) {
                t.rollback();
            }

        } finally {
            if (barragemSession != null) {
                barragemSession.close();
            }
            if (scoresharedSession != null) {
                scoresharedSession.close();
            }
        }
    }

    private void executeETL(Session scoresharedSession, Session barragemSession) {
        ExtractorAndTransformer extractorAndTransformer = new ExtractorAndTransformer();
        extractorAndTransformer.execute(context, scoresharedSession, barragemSession);

        logger.info("Users about to import: " + extractorAndTransformer.getUsers().size());
        for (User user : extractorAndTransformer.getUsers()) {
            scoresharedSession.save(user);
        }
        scoresharedSession.flush();
        logger.info("Imported: " + extractorAndTransformer.getUsers().size());
        
        logger.info("Players about to import: " + extractorAndTransformer.getPlayers().size());
        for (Player player : extractorAndTransformer.getPlayers()) {
            scoresharedSession.saveOrUpdate(player);
        }
        scoresharedSession.flush();
        logger.info("Imported: " + extractorAndTransformer.getPlayers().size());

        logger.info("Scores about to import: " + extractorAndTransformer.getScores().size());
        for (Score score : extractorAndTransformer.getScores()) {
            scoresharedSession.save(score);
        }
        scoresharedSession.flush();
        logger.info("Imported: " + extractorAndTransformer.getScores().size());

        logger.info("Comments about to import: " + extractorAndTransformer.getComments().size());
        for (PlayerInstanceComment comments : extractorAndTransformer.getComments()) {
            scoresharedSession.save(comments);
        }
        scoresharedSession.flush();
        logger.info("Imported: " + extractorAndTransformer.getComments().size());
    }
}