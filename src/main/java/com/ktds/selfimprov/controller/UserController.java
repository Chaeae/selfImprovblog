package com.ktds.selfimprov.controller;

import com.ktds.selfimprov.dto.BoardDTO;
import com.ktds.selfimprov.dto.CommentDTO;
import com.ktds.selfimprov.dto.PageDTO;
import com.ktds.selfimprov.dto.UserDTO;
import com.ktds.selfimprov.repository.UserRepository;
import com.ktds.selfimprov.service.BoardService;
import com.ktds.selfimprov.service.CommentService;
import com.ktds.selfimprov.service.UserService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.*;
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
            return "redirect:/user/login";
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
                        HttpServletResponse response,
                        Model model) {
        System.out.println("postMapping login진입");
        UserDTO userDTO = userService.findById(user_ID);
        if (userDTO != null){ //ID가 DB에 있으면
            System.out.println("UserDTO = " + userDTO);
            System.out.println("userDTO.getUser_pw()"+userDTO.getUser_pw());
            System.out.println("user_pw"+user_pw);
            if(user_pw.equals(userDTO.getUser_pw())){ //PW가 DB와 동일하면
                System.out.println("cookie함수 진입");

                Cookie userIdCookie = new Cookie("user_ID", user_ID);
                System.out.println(userIdCookie);
                userIdCookie.setMaxAge(60 * 60 * 24); // 24시간 동안 유효
                //userIdCookie.setHttpOnly(true); // JS를 통한 접근 방지
                userIdCookie.setPath("/");
                response.addCookie(userIdCookie); // 응답에 쿠키 추가
                System.out.println(userDTO.getUser_pk());

                // user_pk를 위한 쿠키
                Cookie userPkCookie = new Cookie("user_pk", String.valueOf(userDTO.getUser_pk())); // user_pk를 String으로 변환
                userPkCookie.setMaxAge(60 * 60 * 24); // 24시간 동안 유효
                //userPkCookie.setHttpOnly(true); // JS를 통한 접근 방지
                userPkCookie.setPath("/");
                response.addCookie(userPkCookie); // 응답에 쿠키 추가
                return "redirect:/board/home/";
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
