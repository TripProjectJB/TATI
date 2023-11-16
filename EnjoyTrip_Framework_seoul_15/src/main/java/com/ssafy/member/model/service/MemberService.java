package com.ssafy.member.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.member.model.MemberDto;

public interface MemberService {

	int idCheck(String userId) throws Exception;
	MemberDto login(MemberDto memberDto) throws Exception;
	MemberDto userInfo(String userId) throws Exception;
	void joinMember(MemberDto memberDto) throws Exception;
	void saveRefreshToken(String userId, String refreshToken) throws Exception;
	Object getRefreshToken(String userId) throws Exception;
	void deleRefreshToken(String userId) throws Exception;
	
	/* Admin */
	List<MemberDto> listMember(Map<String, Object> map) throws Exception;
	MemberDto getMember(String userId) throws Exception;
	void updateMember(MemberDto memberDto) throws Exception;
	void deleteMember(String userid) throws Exception;
	
	/* Follower Following*/
	List<String> getFollower(String userId);
	List<String> getFollowing(String userId);
	void addFollow(Map<String, String> map);
	void deleteFollow(Map<String, String> map);
	
	
}
