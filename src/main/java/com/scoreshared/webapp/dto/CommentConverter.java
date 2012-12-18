package com.scoreshared.webapp.dto;

import org.springframework.core.convert.converter.Converter;

import com.scoreshared.business.persistence.Comment;

public class CommentConverter extends BaseConverter implements Converter<ScoreModel, Comment> {

    @Override
    public Comment convert(ScoreModel src) {
        Comment dest = null;
        if ((src.getCommentId() == null && !src.getComment().isEmpty()) || src.getCommentId() != null) {
            dest = new Comment();
            dest.setId(src.getCommentId());
            dest.setPrivate(src.getPrivate());
            dest.setDescription(src.getComment());
        }

        return dest;
    }

}
