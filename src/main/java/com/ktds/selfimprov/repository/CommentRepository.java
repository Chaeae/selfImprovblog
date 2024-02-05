package com.ktds.selfimprov.repository;

import com.ktds.selfimprov.dto.BoardDTO;
import com.ktds.selfimprov.dto.CommentDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class CommentRepository {
    private final SqlSessionTemplate sql;

    public void save(CommentDTO commentDTO) {
        sql.insert("Comment.save", commentDTO);
    }

    public List<CommentDTO> findAll(Long cmm_postId) {
        return sql.selectList("Comment.findAll", cmm_postId);
    }

    public CommentDTO findById(Long cmm_postId) {
        return sql.selectOne("Comment.findById", cmm_postId);
    }

    public void updateComment(CommentDTO commentDTO) { sql.update("Comment.updateComment", commentDTO);
    }
}