package com.ktds.selfimprov.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserDTO {
    private Long user_pk;
    private String user_ID;
    private String user_pw;
    private String user_name;
    private String user_age;
    private String user_job;
    private String user_email;
    private int user_hits;
}
