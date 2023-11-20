package com.ssafy.attraction.model.service;

import java.util.List;

import com.ssafy.attraction.model.AttractionDto;

public interface AttractionService {

	List<AttractionDto> getAttractions() throws Exception;
	AttractionDto getDetail(int id) throws Exception;
	List<AttractionDto> getRank() throws Exception;
	AttractionDto getRandom() throws Exception;
}
