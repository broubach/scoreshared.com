package com.scoreshared.business.bo;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.scoreshared.domain.entity.User;

@Component
public class FeedbackBo extends BaseBo {

    @Value("${email.from}")
    private String from;

    public void sendFeedback(User loggedUser, String message) {
        sendMail(from, loggedUser.getFullName(), "bernardo@scoreshared.com", "feedback via form", new StringBuilder()
                .append(message).append(" / reply to: ").append(loggedUser.getEmail()).toString());
    }
}