package com.scoreshared.webapp.dto;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.core.convert.converter.Converter;

import com.scoreshared.domain.entity.PlayerInstance;
import com.scoreshared.domain.entity.Score;

public class ScoreModelConverter extends BaseConverter implements Converter<Score, ScoreModel> {
    
    @Override
    public ScoreModel convert(Score src) {
        try {
            ScoreModel dest = new ScoreModel();
            
            dest.setId(src.getId());
            dest.setOwnerId(src.getOwner().getId());
            dest.setDate(getDate(src.getDate()));
            if (src.getTime() != null) {
                dest.setTime(getTime(src.getTime()));
            }
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
            dest.setComment(src.getComment() != null ? src.getComment().getComment() : null);
            dest.setPostInFacebook(false);

            List<String> newPlayersNotToBeRemembered = new ArrayList<String>();
            List<String> leftPlayers = new ArrayList<String>();
            for (PlayerInstance playerLeft : src.getLeftPlayers()) {
                leftPlayers.add(playerLeft.getName());
                if (Boolean.TRUE.equals(playerLeft.getShouldNotReinvite())) {
                    newPlayersNotToBeRemembered.add(playerLeft.getName());
                }
            }
            dest.setPlayersLeft(leftPlayers);

            List<String> rightPlayers = new ArrayList<String>();
            for (PlayerInstance playerRight : src.getRightPlayers()) {
                rightPlayers.add(playerRight.getName());
                if (Boolean.TRUE.equals(playerRight.getShouldNotReinvite())) {
                    newPlayersNotToBeRemembered.add(playerRight.getName());
                }
            }
            dest.setPlayersRight(rightPlayers);
            
            if (src.getSport() != null) {
                dest.setSportId(src.getSport().ordinal());

            } else if (src.getOwner().getProfile() != null && src.getOwner().getProfile().getSport() != null) {
                dest.setSportId(src.getOwner().getProfile().getSport().ordinal());
            }

            dest.setNewPlayersNotToBeRemembered(newPlayersNotToBeRemembered);

            return dest;
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    public String getTime(Date time) throws ParseException {
        DateFormat df = DateFormat.getTimeInstance();
        ((SimpleDateFormat) df).applyPattern(messageResource.getMessage("system.time_format", null, localeResolver.resolveLocale(request)));
        return df.format(time);
    }

    public String getDate(Date date) throws ParseException {
        DateFormat df = DateFormat.getDateInstance();
        ((SimpleDateFormat) df).applyPattern(messageResource.getMessage("system.date_format", null, localeResolver.resolveLocale(request)));
       return df.format(date);
    }
}