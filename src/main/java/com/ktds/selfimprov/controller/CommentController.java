package com.ktds.selfimprov.controller;

import com.ktds.selfimprov.dto.BoardDTO;
import com.ktds.selfimprov.dto.CommentDTO;
import com.ktds.selfimprov.service.CommentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/comment")
public class CommentController {
    private final CommentService commentService;

    @PostMapping("/save")
    public @ResponseBody List<CommentDTO> save(@ModelAttribute CommentDTO commentDTO) {
        System.out.println("commentDTO = " + commentDTO);
        commentService.save(commentDTO);
        // 해당 게시글에 작성된 댓글 리스트를 가져옴
        List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getCmm_postId());
        return commentDTOList;
    }

//    @GetMapping("/")
//    public String findAll(Model model) {
//        List<CommentDTO> commentDTOList = commentService.findAll();
//        model.addAttribute("commentList", commentDTOList);//"boardList"라는 이름으로 위에서 생성한 boardDTOList를 model에 담아서 전송하겠다
//        return "detail";
//    }

    @GetMapping
    public String findById(@RequestParam("id") Long cmm_commentId,
                           @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                           Model model) {
        CommentDTO commentDTO = commentService.findById(cmm_commentId);
        model.addAttribute("commentDTO", commentDTO);
//        model.addAttribute("page", page);
//        List<CommentDTO> commentDTOList = commentService.findAll(cmm_postId);
//        model.addAttribute("commentList", commentDTOList);
        return "detail";
    }

//    @PostMapping("/deleteComment")
//    public @ResponseBody List<CommentDTO> delete(@ModelAttribute CommentDTO commentDTO) {
//        System.out.println("CommentController");
//        commentService.delete(commentDTO.getCmm_commentId());
//
//        List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getCmm_postId());
//        return commentDTOList;
//    }

    @PostMapping("/deleteComment")
    public @ResponseBody List<CommentDTO> delete(@RequestParam("cmm_commentId") Long cmm_commentId,
                                                 @RequestParam("cmm_postId") Long post_Id) {
        System.out.println("CommentController");
        commentService.delete(cmm_commentId);

        List<CommentDTO> commentDTOList = commentService.findAll(post_Id);
        return commentDTOList;
    }

//    @PostMapping("/updateComment")
//    public @ResponseBody CommentDTO updateComment(@ModelAttribute CommentDTO commentDTO, Model model) {
//        commentService.updateComment(commentDTO);
//        //commentService.save(commentDTO);
//        CommentDTO dto = commentService.findById(commentDTO.getCmm_commentId());
//        // 해당 게시글에 작성된 댓글 리스트를 가져옴
//        return dto;
//    }

    @PostMapping("/updateComment")
    public @ResponseBody List<CommentDTO> updateComment(@ModelAttribute CommentDTO commentDTO, Model model) {
        commentService.updateComment(commentDTO);
        //commentService.save(commentDTO);
        CommentDTO dto = commentService.findById(commentDTO.getCmm_commentId());
        // 해당 게시글에 작성된 댓글 리스트를 가져옴
        List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getCmm_postId());
        return commentDTOList;
    }


}