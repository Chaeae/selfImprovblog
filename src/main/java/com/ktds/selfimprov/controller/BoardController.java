package com.ktds.selfimprov.controller;


import com.ktds.selfimprov.dto.BoardDTO;
import com.ktds.selfimprov.dto.CommentDTO;
import com.ktds.selfimprov.dto.PageDTO;
import com.ktds.selfimprov.service.BoardService;
import com.ktds.selfimprov.service.CommentService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.*;
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
            return "redirect:/board/home/myhome";
//            return "myhome";
//            return "home";
        } else {
            return "save";
        }
    }

    @GetMapping("/")    // /board/
    public String findAll(Model model) {
        System.out.println("homeFindAll진입");
        List<BoardDTO> boardDTOList = boardService.findAll();
        model.addAttribute("boardList", boardDTOList);//"boardList"라는 이름으로 위에서 생성한 boardDTOList를 model에 담아서 전송하겠다
        return "list";
    }

    @GetMapping // /board?id=1&page=1
    public String findById(@RequestParam("id") Long post_id,
                           @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                           Model model) {
        boardService.updateHits(post_id);
        BoardDTO boardDTO = boardService.findById(post_id);
        model.addAttribute("board", boardDTO);//"board"라는 이름으로 위에서 생성한 boardDTO를 model에 담아서 전송하겠다0000000000
        model.addAttribute("page", page);
        List<CommentDTO> commentDTOList = commentService.findAll(post_id);
        model.addAttribute("commentList", commentDTOList);
        return "detail";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long post_id) {
        boardService.delete(post_id);
        System.out.println("delete성공");
        return "redirect:/board/home/myhome";
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
        System.out.println(boardDTO);
        boardService.update(boardDTO);
        System.out.println("업데이트 완료");
        BoardDTO dto = boardService.findById(boardDTO.getPost_id());
        System.out.println("postid"+boardDTO.getPost_id());
        model.addAttribute("board", dto);
        System.out.println("model출력"+model);
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

    @GetMapping("/home/")
    public String homeFindAll(Model model) {
        System.out.println("homeFindAll진입");
        List<BoardDTO> boardDTOList = boardService.findAll();
        model.addAttribute("boardList", boardDTOList);//"boardList"라는 이름으로 위에서 생성한 boardDTOList를 model에 담아서 전송하겠다
        return "home";
    }
    @GetMapping("/home/myhome")
    public String homeFindIdAndAll(HttpServletRequest request,
                                   Model model) {
        Long user_id=null;

        Cookie[] cookies = request.getCookies();
        if(cookies != null){
            for (Cookie cookie : cookies){
                if ("user_pk".equals(cookie.getName())) {// "user_pk" 쿠키를 찾음
                    user_id = Long.parseLong(cookie.getValue());// 쿠키의 값을 Long 타입으로 변환
                    break;
                }
            }
        }
        else{
            return "redirect:/user/login";
        }
        System.out.println("homeFindIdAndAll진입");
        List<BoardDTO> boardDTOList = boardService.findByUserId(user_id);
        System.out.println(boardDTOList);
        //터지면 null일때 예외처리 생각해보기
        model.addAttribute("boardList", boardDTOList);//"boardList"라는 이름으로 위에서 생성한 boardDTOList를 model에 담아서 전송하겠다
        return "myhome";
    }
}