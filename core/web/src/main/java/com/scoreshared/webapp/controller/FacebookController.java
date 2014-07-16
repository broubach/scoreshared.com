package com.scoreshared.webapp.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.text.WordUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

import com.scoreshared.business.bo.ScoreBo;
import com.scoreshared.domain.entity.ScoreShared;
import com.scoreshared.domain.entity.SportEnum;

@Controller
public class FacebookController extends BaseController {
    
    @Inject
    private ScoreBo bo;

    @Inject
    private MessageSource messageResource;

    @Inject
    private LocaleResolver localeResolver;

    @Value("${http_server_address_port}")
    private String httpServerAddressPort;

    @RequestMapping(value = "/facebook/{hash}", method = RequestMethod.GET)
    public ModelAndView getPage(@PathVariable String hash, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("facebook/facebook");
        
        ScoreShared scoreShared = bo.findScoreSharedByHash(hash);

        String name = scoreShared.getOwner().getFirstName();
        Locale locale = localeResolver.resolveLocale(request);
        String pronoun = getPronoun(scoreShared.getOwner().getGender(), locale);
        String sport = getSport(scoreShared.getOwner().getProfile().getSport());
        String date = formatDate(scoreShared.getScore().getDate(), locale);
        Float win = scoreShared.getWin() * 1f;
        Float loss = scoreShared.getLoss() * 1f;

        String title = messageResource.getMessage("label.score_shared_title", new Object[] {name, pronoun, sport}, locale);
        mav.addObject("title", title);

        String subtitle = messageResource.getMessage(
                "label.score_shared_subtitle",
                new Object[] { date, pronoun, win.intValue(), loss.intValue(),
                        Float.valueOf(((win / (win + loss)) * 100)).intValue() }, locale);
        mav.addObject("subtitle", subtitle);

        mav.addObject("subject", name);
        mav.addObject("personalMessage", scoreShared.getMessage());
        mav.addObject("win", win);
        mav.addObject("loss", loss);
        mav.addObject("hash", hash);
        mav.addObject("http_server_address_port", httpServerAddressPort);

        return mav;
    }

    private String formatDate(Date date, Locale locale) {
        SimpleDateFormat sdf = new SimpleDateFormat(messageResource.getMessage("system.date_format", null, locale));
        return sdf.format(date);
    }

    private String getSport(SportEnum sport) {
        if (SportEnum.OTHER.equals(sport)) {
            return "";
        }
        return WordUtils.capitalizeFully(sport.toString(), new char[]{'_'}).replaceAll("_", " ");
    }

    private String getPronoun(char gender, Locale locale) {
        String result = null;
        if ('M' == gender || gender == '0') {
            result = messageResource.getMessage("label.score_shared_male_personal_pronoun", null, locale);
        } else if ('F' == gender) {
            result = messageResource.getMessage("label.score_shared_female_personal_pronoun", null, locale);
        }
        return result;
    }
}