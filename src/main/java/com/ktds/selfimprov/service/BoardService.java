package com.ktds.selfimprov.service;

import com.ktds.selfimprov.dto.BoardDTO;
import com.ktds.selfimprov.dto.PageDTO;
import com.ktds.selfimprov.repository.BoardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class BoardService {
    private final BoardRepository boardRepository;
    private final int BOARDS_PER_PAGE = 3;
    private final int PAGES_PER_SCREEN = 3;
    public int save(BoardDTO boardDTO) {
        return boardRepository.save(boardDTO);
    }

    public List<BoardDTO> findAll() {
        return boardRepository.findAll();
    }

    public void updateHits(Long post_id) {
        boardRepository.updateHits(post_id);
    }

    public BoardDTO findById(Long post_id) {
        return boardRepository.findById(post_id);
    }

    public void delete(Long post_id) {
        boardRepository.delete(post_id);
    }

    public void update(BoardDTO boardDTO) {
        boardRepository.update(boardDTO);
    }

    public List<BoardDTO> pagingList(int page) {
        int pagingStart = (page - 1) * BOARDS_PER_PAGE;
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("start", pagingStart);
        pagingParams.put("limit", BOARDS_PER_PAGE);
        return boardRepository.pagingList(pagingParams);
    }

    public PageDTO pagingParam(int page) {
        // 전체 글 갯수 조회
        int boardCount = boardRepository.boardCount();
        // 전체 페이지 갯수 계산(10/3=3.33333 => 4)
        int maxPage = (int) (Math.ceil((double) boardCount / BOARDS_PER_PAGE));
        // 시작 페이지 값 계산(1, 4, 7, 10, ~~~~)
        int startPage = (((int)(Math.ceil((double) page / PAGES_PER_SCREEN))) - 1) * PAGES_PER_SCREEN + 1;
        // 끝 페이지 값 계산(3, 6, 9, 12, ~~~~)
        int endPage = startPage + PAGES_PER_SCREEN - 1;
        if (endPage > maxPage) {
            endPage = maxPage;
        }
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setStartPage(startPage);
        pageDTO.setEndPage(endPage);
        return pageDTO;
    }
}