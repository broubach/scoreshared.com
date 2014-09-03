package com.scoreshared.webapp.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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
    
    @Value("${facebook_image_server_port}")
    private String facebookImageServerPort;

    @RequestMapping(value = "/facebook/{hash}", method = RequestMethod.GET)
    public ModelAndView getPage(@PathVariable String hash, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("facebook/facebook");
        
        ScoreShared scoreShared = bo.findScoreSharedByHash(hash);

        Locale locale = localeResolver.resolveLocale(request);
        String date = formatDate(scoreShared.getScore().getDate(), locale);
        Float win = scoreShared.getWin() * 1f;
        Float loss = scoreShared.getLoss() * 1f;

        String title = messageResource.getMessage("label.score_shared_title",
                new Object[] { scoreShared.getPlayerFirstName(), scoreShared.getSport().capitalize() },
                localeResolver.resolveLocale(request));
        mav.addObject("title", title);

        String subtitle = messageResource.getMessage(
                "label.score_shared_subtitle",
                new Object[] { date, String.valueOf(win.intValue()), String.valueOf(loss.intValue()),
                        String.valueOf(Double.valueOf(((win * 1f) / (win + loss)) * 100).intValue()) },
                localeResolver.resolveLocale(request));
        mav.addObject("subtitle", subtitle);
        mav.addObject("win", String.valueOf(win));
        mav.addObject("loss", String.valueOf(loss));
        mav.addObject("subject", scoreShared.getPlayerFirstName());
        mav.addObject("personalMessage", scoreShared.getSocialMessage());
        mav.addObject("hash", hash);
        mav.addObject("type", scoreShared.getSport().name().toLowerCase() + "_record");
        mav.addObject("http_server_address_port",
                new StringBuilder().append(httpServerAddressPort).append(":").append(facebookImageServerPort)
                        .toString());

        return mav;
    }

    private String formatDate(Date date, Locale locale) {
        SimpleDateFormat sdf = new SimpleDateFormat(messageResource.getMessage("system.date_format", null, locale));
        return sdf.format(date);
    }
}