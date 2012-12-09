package com.scoreshared.webapp.dto;

import org.springframework.core.convert.converter.Converter;

import com.scoreshared.business.persistence.Comment;

public class CommentConverter implements Converter<ScoreModel, Comment> {

    @Override
    public Comment convert(ScoreModel src) {
        Comment dest = null;
        if (src.getComment() != null && !src.getComment().isEmpty()) {
            dest = new Comment();
            dest.setPrivate(src.getPrivate());
            dest.setDescription(src.getComment());
        }

        return dest;
    }

}
