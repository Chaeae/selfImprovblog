package com.ktds.selfimprov.service;

import com.ktds.selfimprov.dto.CommentDTO;
import com.ktds.selfimprov.repository.CommentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CommentService {
    private final CommentRepository commentRepository;

    public void save(CommentDTO commentDTO) {
        commentRepository.save(commentDTO);
    }

    public List<CommentDTO> findAll(Long post_id) {
        return commentRepository.findAll(post_id);
    }
}