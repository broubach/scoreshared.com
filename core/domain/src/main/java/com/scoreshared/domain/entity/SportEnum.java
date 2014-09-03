package com.scoreshared.domain.entity;

import org.apache.commons.lang3.text.WordUtils;

public enum SportEnum {
    TENNIS, TABLE_TENNIS, BADMINTON, SQUASH, BEACH_TENNIS, PADDLE, OTHER;

    public String capitalize() {
        if (SportEnum.OTHER.equals(this)) {
            return "";
        }
        return WordUtils.capitalizeFully(toString(), new char[]{'_'}).replaceAll("_", " ");
    }
}