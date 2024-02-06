package com.ktds.selfimprov.repository;

import com.ktds.selfimprov.dto.BoardDTO;
import com.ktds.selfimprov.dto.CommentDTO;
import com.ktds.selfimprov.dto.UserDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class UserRepository {
    private final SqlSessionTemplate sql;

    public int signup(UserDTO userDTO) {
        return sql.insert("User.saveUser", userDTO);
    }

    public UserDTO findById(String user_ID) {
        return sql.selectOne("User.findById", user_ID);
    }

    public UserDTO findByPk(Long user_pk) {
        return sql.selectOne("User.findByPk", user_pk);
    }
}
