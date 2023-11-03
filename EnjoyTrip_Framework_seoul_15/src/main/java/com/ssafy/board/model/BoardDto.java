package com.ssafy.board.model;

import java.util.List;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NonNull;

@Data
@ApiModel(value = "BoardDto")
public class BoardDto {
	
	@ApiModelProperty(value = "번호")
	@NonNull private int articleNo;
	
	@ApiModelProperty(value = "작성자 아이디")
	private String userId;
	
	@ApiModelProperty(value = "작성자 이름")
	private String userName;
	
	@ApiModelProperty(value = "제목")
	private String subject;
	
	@ApiModelProperty(value = "내용")
	private String content;
	
	@ApiModelProperty(value = "조회수")
	@NonNull private int hit;
	
	@ApiModelProperty(value = "작성시간")
	private String registerTime;
	
	@ApiModelProperty(value = "파일")
	private List<FileInfoDto> fileInfos;

}
