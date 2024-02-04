package com.ktds.selfimprov.dto;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;

@Getter
@Setter
@ToString
public class BoardDTO {
    private Long post_id;
    private String post_title;
    private Long post_author;
    private Long post_categoryId;
    private Timestamp post_postDate;
    private String post_contents;
    private int post_likeNum;
    private int post_viewNum;
}
