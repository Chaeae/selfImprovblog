package com.ktds.selfimprov.controller;


import com.ktds.selfimprov.dto.BoardDTO;
import com.ktds.selfimprov.dto.CommentDTO;
import com.ktds.selfimprov.dto.PageDTO;
import com.ktds.selfimprov.service.BoardService;
import com.ktds.selfimprov.service.CommentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {
    private final BoardService boardService;
    private final CommentService commentService;

    @GetMapping("/save")
    public String saveForm() {
        return "save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO) {
//        boardDTO.setPost_author(1L);
//        boardDTO.setPost_categoryId(1L);
        System.out.println("boardDTO = " + boardDTO);

        int saveResult = boardService.save(boardDTO);
        if (saveResult > 0) {
            return "redirect:/board/paging";
        } else {
            return "save";
        }
    }

    @GetMapping("/")
    public String findAll(Model model) {
        List<BoardDTO> boardDTOList = boardService.findAll();
        model.addAttribute("boardList", boardDTOList);
        return "list";
    }

    @GetMapping
    public String findById(@RequestParam("id") Long post_id,
                           @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                           Model model) {
        boardService.updateHits(post_id);
        BoardDTO boardDTO = boardService.findById(post_id);
        model.addAttribute("board", boardDTO);
        model.addAttribute("page", page);
        List<CommentDTO> commentDTOList = commentService.findAll(post_id);
        model.addAttribute("commentList", commentDTOList);
        return "detail";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long post_id) {
        boardService.delete(post_id);
        return "redirect:/board/";
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long post_id,
                             Model model) {
        BoardDTO boardDTO = boardService.findById(post_id);
        System.out.println(boardDTO);
        model.addAttribute("board", boardDTO);
        return "update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO, Model model) {
        boardService.update(boardDTO);
        BoardDTO dto = boardService.findById(boardDTO.getPost_id());
        model.addAttribute("board", dto);
        return "detail";
    }

    @GetMapping("/paging")
    public String paging(Model model,
                         @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
        List<BoardDTO> boardList = boardService.pagingList(page);
        PageDTO pageDTO = boardService.pagingParam(page);
        model.addAttribute("boardList", boardList);
        model.addAttribute("paging", pageDTO);
        return "paging";
    }
}