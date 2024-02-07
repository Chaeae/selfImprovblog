package com.ktds.selfimprov.controller;

import com.ktds.selfimprov.dto.BoardDTO;
import com.ktds.selfimprov.dto.CommentDTO;
import com.ktds.selfimprov.dto.PageDTO;
import com.ktds.selfimprov.dto.UserDTO;
import com.ktds.selfimprov.repository.UserRepository;
import com.ktds.selfimprov.service.BoardService;
import com.ktds.selfimprov.service.CommentService;
import com.ktds.selfimprov.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {
    private final UserService userService;

    @GetMapping("/signup")
    public String signupForm() {
        return "signup";
    }

    @PostMapping("/signup")
    public String signup(@ModelAttribute UserDTO userDTO) {
        System.out.println("UserDTO = " + userDTO);
        UserDTO dupliResult = userService.findById(userDTO.getUser_ID());
        System.out.println("dupliResult = " + dupliResult);
        if (dupliResult == null){ //중복 아이디 없으면
            int saveResult = userService.signup(userDTO); //save
            return "redirect:/user/signup";
        }
        else{
            return "signup";
        }
    }

    @GetMapping("/login")
    public String longinForm() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam("user_ID") String user_ID,
                        @RequestParam("user_pw") String user_pw,
                        Model model) {
        System.out.println("postMapping login진입");
        UserDTO userDTO = userService.findById(user_ID);
        if (userDTO != null){ //ID가 DB에 있으면
            System.out.println("UserDTO = " + userDTO);
            System.out.println("userDTO.getUser_pw()"+userDTO.getUser_pw());
            System.out.println("user_pw"+user_pw);
            if(user_pw.equals(userDTO.getUser_pw())){ //PW가 DB와 동일하면
                return "redirect:/board/paging";
            }
            else{
                return "login";
            }
        }
        else{
            return "login";
        }

    }

}
