package com.scoreshared.business.bo;

import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.jms.JMSException;
import javax.jms.MapMessage;
import javax.jms.Message;
import javax.jms.Session;

import org.springframework.context.MessageSource;
import org.springframework.jms.core.MessageCreator;

import com.scoreshared.business.dao.GenericOperationsDao;
import com.scoreshared.scaffold.CustomJmsTemplate;
import com.scoreshared.scaffold.FreemarkerTemplateParser;

public class BaseBo<T> {

    protected static final int PAGE_SIZE = 10;

    @Inject
    protected GenericOperationsDao dao;

    @Inject
    protected CustomJmsTemplate jmsTemplate;

    @Inject
    protected MessageSource messageResource;

    @Inject
    private FreemarkerTemplateParser templateParser;

    protected void sendMail(final String from, final String fromName, final String to, final String subject,
            final String body) {
        if (jmsTemplate.getEnabled()) {
            jmsTemplate.send(new MessageCreator() {
                @Override
                public Message createMessage(Session session) throws JMSException {
                    MapMessage message = session.createMapMessage();
                    message.setString("from", from);
                    message.setString("fromName", fromName);
                    message.setString("to", to);
                    message.setString("subject", subject);
                    message.setString("body", body);
                    return message;
                }
            });
        }
    }

    protected String parseTemplate(String templateName, Map<String, String> params, Locale locale) {
        String resourceName = messageResource.getMessage(templateName + "_file", null, locale);
        return templateParser.parse(resourceName, params);
    }

    protected String getSubjectByTemplateName(String templateName, Locale locale) {
        return messageResource.getMessage(templateName + "_subject", null, locale);
    }

    public void initializeLuceneIndex() {
        dao.initializeLuceneIndex();
    }
}