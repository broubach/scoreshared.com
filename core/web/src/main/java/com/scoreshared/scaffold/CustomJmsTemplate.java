package com.scoreshared.scaffold;

import org.springframework.jms.core.JmsTemplate;

public class CustomJmsTemplate extends JmsTemplate {

    private Boolean enabled = true;

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }
}
