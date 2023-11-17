package com.ssafy.attraction.model.service;

import java.util.List;

import com.ssafy.attraction.model.AttractionDto;

public interface AttractionService {

	List<AttractionDto> getAttractions() throws Exception;
	
}
