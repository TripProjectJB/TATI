package com.ssafy.board.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.board.model.BoardDto;
import com.ssafy.board.model.service.BoardService;

import io.swagger.v3.oas.annotations.parameters.RequestBody;

@RestController
@RequestMapping("/article")
public class BoardController {
	
	private BoardService boardService;
	private 
	
	@Autowired
	public BoardController(BoardService boardService) {
		super();
		this.boardService = boardService;
	}

	@GetMapping("/list")
	public ResponseEntity<?> list() throws Exception {
		List<BoardDto> list = boardService.listArticle(new HashMap<String, String>());
		return ResponseEntity.ok().body(list);
	}
	
	@PostMapping("/list")
	public ResponseEntity<?> list(@RequestBody BoardDto boardDto) throws Exception {
		List<BoardDto> list = boardService.listArticle(new HashMap<String, String>());
		return ResponseEntity.ok().body(list);
	}
	
	@DeleteMapping("/list")
	public ResponseEntity<?> list(@RequestBody String no) throws Exception {
		boardService.deleteArticle(no, path);
		return ResponseEntity.ok().body(list);
	}
	
	
	
	
	
	
	
}
