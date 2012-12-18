package com.scoreshared.webapp.controller;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.encoders.KeypointPNGEncoderAdapter;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.util.Rotation;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.LocaleResolver;

@Controller
@RequestMapping("/stats")
public class StatsController {

    @Inject
    private MessageSource messageResource;

    @Inject
    private LocaleResolver localeResolver;

    @RequestMapping(value = "/chart/{win}/{loss}", method = RequestMethod.GET)
    public void renderChart(@PathVariable Integer win, @PathVariable Integer loss, HttpServletRequest request,
            HttpServletResponse resp) throws IOException {
        String victoriesLabel = new StringBuilder()
                .append(messageResource.getMessage("label.wins", null, localeResolver.resolveLocale(request)))
                .append("(").append(win).append(")").toString();
        String defeatsLabel = new StringBuilder()
                .append(messageResource.getMessage("label.loss", null, localeResolver.resolveLocale(request)))
                .append("(").append(loss).append(")").toString();

        DefaultPieDataset pieDataset = new DefaultPieDataset();
        pieDataset.setValue(victoriesLabel, win);
        pieDataset.setValue(defeatsLabel, loss);
        JFreeChart chart = ChartFactory.createPieChart3D(null, pieDataset, true, false, false);
        chart.setBackgroundPaint(new Color(255, 255, 255, 0));
        chart.setBorderVisible(false);

        PiePlot plot = (PiePlot) chart.getPlot();
        plot.setBackgroundPaint(new Color(255, 255, 255, 0));
        plot.setSectionPaint(victoriesLabel, new Color(123, 200, 133));
        plot.setSectionPaint(defeatsLabel, new Color(13, 40, 111));
        plot.setOutlineVisible(false);
        plot.setDirection(Rotation.ANTICLOCKWISE);
        plot.setCircular(false);
        plot.setLabelLinksVisible(false);
        plot.setLabelGenerator(null);

        ((PiePlot3D) plot).setDarkerSides(true);
        ((PiePlot3D) plot).setDepthFactor(0.05d);

        KeypointPNGEncoderAdapter encoder = new KeypointPNGEncoderAdapter();
        encoder.setEncodingAlpha(true);

        resp.setContentType("image/png");
        resp.getOutputStream().write(encoder.encode(chart.createBufferedImage(200, 120, BufferedImage.BITMASK, null)));
    }
}