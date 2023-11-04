package com.ssafy.board.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.board.model.BoardDto;
import com.ssafy.board.model.service.BoardService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/board")
@CrossOrigin("*")
@Api(tags = {"Board Controller"})
public class BoardController {
	
	private BoardService boardService;
	
	@Autowired
	public BoardController(BoardService boardService) {
		super();
		this.boardService = boardService;
	}
	

	@GetMapping("/list") @ApiOperation(value = "글 목록")
	public ResponseEntity<?> listG() throws Exception {
		System.out.println("**********************목록");
		List<BoardDto> list = boardService.listArticle(new HashMap<String, String>());
		return ResponseEntity.ok().body(list);
	}
	
	
	@GetMapping("/article/{no}") @ApiOperation(value = "글 상세보기")
	public ResponseEntity<?> articleG(@PathVariable("no") int no) throws Exception {
		System.out.println("상세보기"+no);
		BoardDto boardDto = boardService.getArticle(no);
		return ResponseEntity.ok().body(boardDto);
	}
	
	@PostMapping("/article") @ApiOperation(value = "글 등록")
	public ResponseEntity<?> articleP(@RequestBody BoardDto boardDto) throws Exception {
		boardService.writeArticle(boardDto);
		return ResponseEntity.ok().build();
	}
	
	@DeleteMapping("/article/{no}") @ApiOperation(value = "글 삭제")
	public ResponseEntity<?> articleD(@PathVariable("no") int no) throws Exception {
		System.out.println("삭제"+no);
		boardService.deleteArticle(no);
		return ResponseEntity.ok().build();
	}

	@PutMapping("/article") @ApiOperation(value = "글 수정")
	public ResponseEntity<?> articleM(@RequestBody BoardDto boardDto) throws Exception {
		boardService.modifyArticle(boardDto);
		return ResponseEntity.ok().build();
	}
	
	
}
