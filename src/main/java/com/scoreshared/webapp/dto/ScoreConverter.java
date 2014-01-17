package com.scoreshared.webapp.dto;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
                    playerInstance.setScoreLeft(dest);
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
                    playerInstance.setScoreRight(dest);
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

    public Date getTime(String time) throws ParseException {
        DateFormat df = DateFormat.getTimeInstance();
        df.setLenient(false);
        ((SimpleDateFormat) df).applyPattern(messageResource.getMessage("system.time_format", null, localeResolver.resolveLocale(request)));
        return df.parse(time);
    }

    public Date getDate(String date) throws ParseException {
        DateFormat df = DateFormat.getDateInstance();
        df.setLenient(false);
        ((SimpleDateFormat) df).applyPattern(messageResource.getMessage("system.date_format", null, localeResolver.resolveLocale(request)));
        return df.parse(date);
    }

    public Integer[][] getSets(String scoreAsText) throws ParseException {
        Integer[][] result = new Integer[5][2];
        String scoreAsPaddedText = StringUtils.rightPad(scoreAsText, 19);
        String strPattern = "(\\dx\\d) ([\\d| ][x| ][\\d| ]) ([\\d| ][x| ][\\d| ]) ([\\d| ][x| ][\\d| ]) ([\\d| ][x| ][\\d| ])";
        Pattern pattern = Pattern.compile(strPattern);
        Matcher matcher = pattern.matcher(scoreAsPaddedText);
        if (matcher.find()) {
            for (int i = 1; i < matcher.groupCount(); i++) {
                String set = matcher.group(i);
                if (!StringUtils.isEmpty(set.trim())) {
                    try {
                        Integer setLeft = Integer.valueOf(set.substring(0, 1));
                        Integer setRight = Integer.valueOf(set.substring(2, 3));
                        result[i - 1][0] = setLeft;
                        result[i - 1][1] = setRight;
                    } catch (NumberFormatException nfe) {
                        throw new ParseException("invalid pattern expected. ie 6x3 4x6 7x5", 0);
                    }
                }
            }
            return result;
        } else {
            throw new ParseException("invalid pattern expected. ie 6x3 4x6 7x5", 0);
        }
    }
}