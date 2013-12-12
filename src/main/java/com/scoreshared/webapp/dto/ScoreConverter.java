package com.scoreshared.webapp.dto;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.springframework.core.convert.converter.Converter;

import com.scoreshared.business.persistence.Player;
import com.scoreshared.business.persistence.PlayerInstance;
import com.scoreshared.business.persistence.Score;
import com.scoreshared.business.persistence.SportEnum;

public class ScoreConverter extends BaseConverter implements Converter<ScoreModel, Score> {

    @Override
    public Score convert(ScoreModel src) {
        try {
            Score dest = new Score();
            dest.setId(src.getId());
            dest.setDate(getDate(src.getDate()));
            if (!StringUtils.isEmpty(src.getTime())) {
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

            Set<PlayerInstance> leftPlayers = new HashSet<PlayerInstance>();
            PlayerInstance playerInstance = null;
            for (String playerLeft : src.getPlayersLeft()) {
                if (!StringUtils.isEmpty(playerLeft)) {
                    playerInstance = new PlayerInstance(playerLeft.trim(), src.getOwner());
                    leftPlayers.add(playerInstance);
                    if (src.getNewPlayersNotToBeRemembered().contains(playerLeft.trim())) {
                        playerInstance.setShouldNotReinvite(Boolean.TRUE);
                    }
                }
            }
            dest.setLeftPlayers(leftPlayers);

            Set<PlayerInstance> rightPlayers = new HashSet<PlayerInstance>();
            for (String playerRight : src.getPlayersRight()) {
                if (!StringUtils.isEmpty(playerRight)) {
                    playerInstance = new PlayerInstance(playerRight.trim(), src.getOwner());
                    rightPlayers.add(playerInstance);
                    if (src.getNewPlayersNotToBeRemembered().contains(playerRight.trim())) {
                        playerInstance.setShouldNotReinvite(Boolean.TRUE);
                    }
                }
            }
            dest.setRightPlayers(rightPlayers);

            if (!StringUtils.isEmpty(src.getCoach())) {
                Player coach = new Player(src.getCoach().trim(), src.getOwner());
                dest.setCoach(coach);
                if (src.getNewPlayersNotToBeRemembered().contains(src.getCoach().trim())) {
                    coach.setShouldNotReinvite(Boolean.TRUE);
                }
            }

            if (src.getSportId() != null) {
                dest.setSport(SportEnum.values()[src.getSportId()]);
            }

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