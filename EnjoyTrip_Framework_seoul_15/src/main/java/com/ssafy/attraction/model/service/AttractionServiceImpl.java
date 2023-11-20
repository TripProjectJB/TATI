package com.ssafy.attraction.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.attraction.model.AttractionDto;
import com.ssafy.attraction.model.mapper.AttractionMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AttractionServiceImpl implements AttractionService {
	
	private AttractionMapper attractionMapper;
	
	@Autowired
	public AttractionServiceImpl(AttractionMapper attractionMapper) {
		super();
		this.attractionMapper = attractionMapper;
	}



	@Override
	public List<AttractionDto> getAttractions() throws Exception {
		int k = (int) (Math.random()*30000);
		return attractionMapper.getAttractions(k);
	}



	@Override
	public AttractionDto getDetail(int id) throws Exception {
		return attractionMapper.getDetail(id);
	}



	@Override
	public List<AttractionDto> getRank() throws Exception {
		return attractionMapper.getRank();
	}

}
