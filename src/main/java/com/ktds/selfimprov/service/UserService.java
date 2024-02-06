package com.ktds.selfimprov.service;

import com.ktds.selfimprov.dto.BoardDTO;
import com.ktds.selfimprov.dto.PageDTO;
import com.ktds.selfimprov.dto.CommentDTO;
import com.ktds.selfimprov.dto.UserDTO;
import com.ktds.selfimprov.repository.BoardRepository;
import com.ktds.selfimprov.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;

    public int signup(UserDTO userDTO) {
        return userRepository.signup(userDTO);
    }

    public UserDTO findById(String user_ID) {
        return userRepository.findById(user_ID);
    }
    public UserDTO findByPk(Long user_pk) {
        return userRepository.findByPk(user_pk);
    }

}
