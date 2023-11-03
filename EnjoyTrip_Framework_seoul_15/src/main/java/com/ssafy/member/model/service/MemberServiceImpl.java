package com.ssafy.member.model.service;

import com.ssafy.member.model.MemberDto;
import com.ssafy.member.model.dao.MemberDao;
import com.ssafy.member.model.dao.MemberDaoImpl;

public class MemberServiceImpl implements MemberService {
	
	private static MemberService memberService = new MemberServiceImpl();
	private MemberDao memberDao;
	
	private MemberServiceImpl() {
		memberDao = MemberDaoImpl.getMemberDao();
	}
	
	public static MemberService getMemberService() {
		return memberService;
	}

	@Override
	public int idCheck(String userId) throws Exception {
		return memberDao.idCheck(userId);
	}

	@Override
	public int joinMember(MemberDto memberDto) throws Exception {
		//비밀번호 해쉬화
		String hashPwd = hashPassword(memberDto.getUserPwd());
		memberDto.setUserPwd(hashPwd);
		return memberDao.joinMember(memberDto);
	}

	@Override
	public MemberDto loginMember(String userId, String userPwd) throws Exception {
		//비밀번호 해쉬화
		String hashPwd = hashPassword(userPwd);
		return memberDao.loginMember(userId, hashPwd);
	}

	@Override
	public int modifyMember(MemberDto member) throws Exception {
		String hashPwd = hashPassword(member.getUserPwd());
		member.setUserPwd(hashPwd);
		return memberDao.modifyMember(member);
	}

	@Override
	public int deleteMember(String userId) throws Exception {
		return memberDao.deleteMember(userId);
	}

	@Override
	public String hashPassword(String userPwd) throws Exception {
		int key = 0717;
		StringBuilder sb = new StringBuilder();
		char[] pwd = userPwd.toCharArray();
		int len = userPwd.length();
		for (int i = 0; i < len; i++) {
			char c = (char) ((pwd[i] * len * key + 33) % 127);
			if (33 > c) c+=33;
			System.out.println((int)c + " " + c);
			sb.append(c);
		}
		return sb.toString();
	}
}
