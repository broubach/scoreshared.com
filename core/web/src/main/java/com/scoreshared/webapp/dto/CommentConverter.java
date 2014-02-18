package com.scoreshared.webapp.dto;

import org.springframework.core.convert.converter.Converter;

import com.scoreshared.domain.entity.PlayerInstanceComment;

public class CommentConverter extends BaseConverter implements Converter<ScoreModel, PlayerInstanceComment> {

    @Override
    public PlayerInstanceComment convert(ScoreModel src) {
        PlayerInstanceComment dest = null;
        if ((src.getCommentId() == null && !src.getComment().isEmpty()) || src.getCommentId() != null) {
            dest = new PlayerInstanceComment();
            dest.setId(src.getCommentId());
            dest.setComment(src.getComment());
        }

        return dest;
    }

}
