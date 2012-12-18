package com.scoreshared.webapp.dto;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

import com.scoreshared.business.persistence.Player;
import com.scoreshared.business.persistence.Score;

public class ScoreModelConverter extends BaseConverter implements Converter<Score, ScoreModel> {
    
    @Override
    public ScoreModel convert(Score src) {
        try {
            ScoreModel dest = new ScoreModel();
            
            dest.setId(src.getId());
            dest.setDate(getDate(src.getDate()));
            dest.setTime(getTime(src.getTime()));
            dest.setSet1Left(src.getSet1Left());
            dest.setSet1Right(src.getSet1Right());
            dest.setSet2Left(src.getSet2Left());
            dest.setSet2Right(src.getSet2Right());
            dest.setSet3Left(src.getSet3Left());
            dest.setSet3Right(src.getSet3Right());
            dest.setSet4Left(src.getSet4Left());
            dest.setSet4Right(src.getSet4Right());
            dest.setSet5Left(src.getSet5Left());
            dest.setSet5Right(src.getSet5Right());
            dest.setCommentId(src.getComment() != null ? src.getComment().getId() : null);
            dest.setComment(src.getComment() != null ? src.getComment().getDescription() : null);
            dest.setPrivate(false);
            dest.setPostInTwitter(false);
            dest.setPostInFacebook(false);

            StringBuilder leftPlayers = new StringBuilder();
            for (Player playerLeft : src.getLeftPlayers()) {
                leftPlayers.append(playerLeft.getName()).append(",");
            }
            dest.setPlayersLeft(leftPlayers.toString());

            StringBuilder rightPlayers = new StringBuilder();
            for (Player playerRight : src.getRightPlayers()) {
                rightPlayers.append(playerRight.getName()).append(",");
            }
            dest.setPlayersRight(rightPlayers.toString());

            return dest;
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    private String getTime(Date time) throws ParseException {
        DateFormat df = DateFormat.getTimeInstance();
        ((SimpleDateFormat) df).applyPattern("HH:mm");
        return df.format(time);
    }

    private String getDate(Date date) throws ParseException {
        DateFormat df = DateFormat.getDateInstance();
        return df.format(date);
    }
}