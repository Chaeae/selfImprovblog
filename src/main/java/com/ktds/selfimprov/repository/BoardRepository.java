package com.ktds.selfimprov.repository;

import com.ktds.selfimprov.dto.BoardDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class BoardRepository {
    private final SqlSessionTemplate sql;
    public int save(BoardDTO boardDTO) {
        return sql.insert("Board.save", boardDTO);
    }

    public List<BoardDTO> findAll() {
        return sql.selectList("Board.findAll");
    }

    public void updateHits(Long post_id) {
        sql.update("Board.updateHits", post_id);
    }

    public BoardDTO findById(Long post_id) {
        return sql.selectOne("Board.findById", post_id);
    }
    public List<BoardDTO> findByUserId(Long post_author) {return sql.selectList("Board.findByUserId", post_author);
    }
    public void delete(Long post_id) {
        sql.delete("Board.delete", post_id);
    }

    public void update(BoardDTO boardDTO) {
        sql.update("Board.update", boardDTO);
    }

    public List<BoardDTO> pagingList(Map<String, Integer> pagingParams) {
        return sql.selectList("Board.pagingList", pagingParams);
    }

    public int boardCount() {
        return sql.selectOne("Board.boardCount");
    }


}