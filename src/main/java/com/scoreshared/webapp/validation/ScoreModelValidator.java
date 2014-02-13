package com.scoreshared.webapp.validation;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import org.springframework.context.MessageSource;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.scoreshared.business.persistence.Player;
import com.scoreshared.webapp.dto.ScoreModel;

public class ScoreModelValidator implements Validator {
    private Player associatedPlayer = null;
    private MessageSource messageResource;
    private Locale locale;
    private DateFormat dateFormat;

    public ScoreModelValidator(Player associatedPlayer, MessageSource messageResource, Locale locale) {
        this.associatedPlayer = associatedPlayer;
        this.messageResource = messageResource;
        this.locale = locale;

        dateFormat = DateFormat.getInstance();
        String datePattern = messageResource.getMessage("system.date_format", null, locale);
        ((SimpleDateFormat) dateFormat).applyPattern(datePattern);
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return ScoreModel.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        if (!Boolean.valueOf(errors.getFieldValue("updatable").toString())) {
            return;
        }

        // date mandatory 
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "date", "error.field_is_required",
                new Object[] { messageResource.getMessage("label.validation_date", null, locale) });
        if (errors.getFieldError("date") == null) {
            try {
                dateFormat.parse((String) errors.getFieldValue("date"));
            } catch (ParseException e) {
                errors.rejectValue("date", "error.invalid_date_format");
            }
        }

        // there must be a player at left
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "playersLeft", "error.field_is_required",
                new Object[] { messageResource.getMessage("label.validation_players_at_left", null, locale) });

        // the current logged user must be listed among the players
        String allPlayers = new StringBuilder().append(errors.getFieldValue("playersLeft")).append(", ").append(errors.getFieldValue("playersRight")).toString();
        if (errors.getFieldError("playersLeft") == null) {
            boolean userNotPresent = true;
            for (String player : allPlayers.trim().split(",")) {
                if (player.trim().equalsIgnoreCase(associatedPlayer.getName())) {
                    userNotPresent = false;
                    break;
                }
            }
            if (userNotPresent) {
                errors.rejectValue("playersLeft", "error.please_make_sure_you_are_listed_among_the_players");
            }
        }

        // check to see if the same player is typed twice
        Set<String> players = new HashSet<String>();
        List<String> duplicatedPlayers = new ArrayList<String>();
        for (String player : allPlayers.trim().split(",")) {
            if (!players.add(player.trim())) {
                duplicatedPlayers.add(player.trim());
            }
        }
        if (!duplicatedPlayers.isEmpty()) {
            errors.rejectValue("playersLeft", "error.please_make_sure_each_player_is_listed_only_once");
        }
        
    }
}