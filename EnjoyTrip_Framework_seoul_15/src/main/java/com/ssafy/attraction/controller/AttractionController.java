package com.ssafy.attraction.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.attraction.model.AttractionDto;
import com.ssafy.attraction.model.service.AttractionService;
import com.ssafy.board.model.BoardDto;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/atrraction")
@Slf4j
@Api(tags = {"Attraction Controller"})
public class AttractionController {
	
	private AttractionService attractionService;
	
	@Autowired
	public AttractionController(AttractionService attractionService) {
		super();
		this.attractionService = attractionService;
	}

	
	@GetMapping
	public ResponseEntity<?> getAttraction() {
		log.info("getAttraction - 호출 ");
		try {
			List<AttractionDto> attractionDto = attractionService.getAttractions();
			return ResponseEntity.status(HttpStatus.OK).body(attractionDto);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).build();
		}
	}
	
	@GetMapping("/detail/{id}")
	public ResponseEntity<?> getAttraction(@PathVariable("id") String id) {
		log.info("getAttractionDetail - 호출 ");
		try {
			AttractionDto attractionDto =  attractionService.getDetail(Integer.parseInt(id));
			return ResponseEntity.status(HttpStatus.OK).body(attractionDto);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).build();
		}
	}
	
	@GetMapping("/rank")
	public ResponseEntity<?> getRank() {
		log.info("getRank - 호출 ");
		try {
			List<AttractionDto> attractionDtos =  attractionService.getRank();
			return ResponseEntity.status(HttpStatus.OK).body(attractionDtos);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).build();
		}
	}
	
	
}
