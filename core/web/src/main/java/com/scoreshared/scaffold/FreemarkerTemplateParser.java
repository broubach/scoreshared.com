package com.scoreshared.scaffold;

import java.io.IOException;
import java.io.StringWriter;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Component;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

@Component
public class FreemarkerTemplateParser {

    @Inject
    private Configuration cfg;

    public String parse(String templateName, Map<String, String> params) {
        try {
            Template temp = cfg.getTemplate(templateName);

            StringWriter str = new StringWriter();
            temp.process(params, str);
            return str.toString();
        } catch (IOException ex) {
            throw new RuntimeException(ex);
        } catch (TemplateException ex) {
            throw new RuntimeException(ex);
        }
    }
}