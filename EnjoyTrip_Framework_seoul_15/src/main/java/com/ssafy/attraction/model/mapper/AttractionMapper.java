package com.ssafy.attraction.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.attraction.model.AttractionDto;

@Mapper
public interface AttractionMapper {
	
	List<AttractionDto> getAttractions(int k) throws Exception;
	AttractionDto getDetail(int id) throws Exception;
	List<AttractionDto> getRank() throws Exception;
}
