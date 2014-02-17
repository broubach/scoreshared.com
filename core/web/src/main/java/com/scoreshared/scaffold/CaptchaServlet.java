package com.scoreshared.scaffold;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nl.captcha.Captcha;
import nl.captcha.servlet.CaptchaServletUtil;
import nl.captcha.text.renderer.DefaultWordRenderer;

public class CaptchaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String PARAM_HEIGHT = "height";
    private static final String PARAM_WIDTH = "width";

    protected int _width = 200;
    protected int _height = 50;

    @Override
    public void init() throws ServletException {
        if (getInitParameter(PARAM_HEIGHT) != null) {
            _height = Integer.valueOf(getInitParameter(PARAM_HEIGHT));
        }

        if (getInitParameter(PARAM_WIDTH) != null) {
            _width = Integer.valueOf(getInitParameter(PARAM_WIDTH));
        }
    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Captcha captcha = new Captcha.Builder(_width, _height).addText(new DefaultWordRenderer()).gimp().addBorder()
                .build();
        req.getSession().setAttribute(Captcha.NAME, captcha);
        CaptchaServletUtil.writeImage(resp, captcha.getImage());
    }
}
