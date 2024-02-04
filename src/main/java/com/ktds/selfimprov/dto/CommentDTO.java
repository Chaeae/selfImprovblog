package com.ktds.selfimprov.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;

@Getter
@Setter
@ToString
public class CommentDTO {
    private Long cmm_commentId;
    private String cmm_text;
    private Timestamp cmm_commentDate;
    private Long cmm_writer;
    private Long cmm_postId;
}