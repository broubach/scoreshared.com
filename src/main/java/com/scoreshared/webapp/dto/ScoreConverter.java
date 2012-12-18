package com.scoreshared.webapp.dto;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.springframework.core.convert.converter.Converter;

import com.scoreshared.business.persistence.Player;
import com.scoreshared.business.persistence.Score;

public class ScoreConverter extends BaseConverter implements Converter<ScoreModel, Score> {

    @Override
    public Score convert(ScoreModel src) {
        try {
            Score dest = new Score();
            dest.setId(src.getId());
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

            Set<Player> leftPlayers = new HashSet<Player>();
            for (String playerLeft : src.getPlayersLeft().trim().split(",")) {
                leftPlayers.add(new Player(playerLeft.trim(), src.getOwner()));
            }
            dest.setLeftPlayers(leftPlayers);

            Set<Player> rightPlayers = new HashSet<Player>();
            for (String playerRight : src.getPlayersRight().trim().split(",")) {
                rightPlayers.add(new Player(playerRight.trim(), src.getOwner()));
            }
            dest.setRightPlayers(rightPlayers);

            return dest;
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    private Date getTime(String time) throws ParseException {
        DateFormat df = DateFormat.getTimeInstance();
        ((SimpleDateFormat) df).applyPattern(messageResource.getMessage("system.time_format", null, localeResolver.resolveLocale(request)));
        return df.parse(time);
    }

    private Date getDate(String date) throws ParseException {
        DateFormat df = DateFormat.getDateInstance();
        ((SimpleDateFormat) df).applyPattern(messageResource.getMessage("system.date_format", null, localeResolver.resolveLocale(request)));
        return df.parse(date);
    }
}