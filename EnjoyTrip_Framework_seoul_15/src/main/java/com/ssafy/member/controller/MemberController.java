package com.ssafy.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.member.model.MemberDto;
import com.ssafy.member.model.service.MemberService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import lombok.extern.slf4j.Slf4j;

@RestController
//@Controller
@RequestMapping("/user")
@CrossOrigin("*")
@Api(tags = { "MemberController" })
@Slf4j
public class MemberController {

//	private final Logger logger = LoggerFactory.getLogger(MemberController.class);

	private MemberService memberService;

	public MemberController(MemberService memberService) {
		super();
		this.memberService = memberService;
	}

	@ApiOperation(value = "idCheck", notes = "아이디확인.")
	@GetMapping("/{userid}")
	public String idCheck(@PathVariable("userid") String userId) throws Exception {
		log.debug("idCheck userid : {}", userId);
		int cnt = memberService.idCheck(userId);
		return cnt + "";
	}

	@ApiOperation(value = "회원가입", notes = "회원의 정보를 받아 처리.")
	@PostMapping(value = "/join")
	public ResponseEntity<?> userRegister(@RequestBody MemberDto memberDto) throws Exception {
		log.debug("memberDto info : {}", memberDto);
		memberService.joinMember(memberDto);
		List<MemberDto> list = memberService.listMember(null);
		return new ResponseEntity<List<MemberDto>>(list, HttpStatus.CREATED);
	}

	@ApiOperation(value = "로그인", notes = "회원의 ID, PWD를 받아 로그인.")
	@PostMapping("/login")
	public ResponseEntity<?> login(@RequestBody MemberDto memberDto, HttpSession session, HttpServletResponse response) throws Exception {
			System.out.println("login gogogogo");
			Map<String, String> map = new HashMap<>();
			map.put("userid", memberDto.getUserId());
			map.put("userpwd", memberDto.getUserPwd());
			log.debug("login map : {}", map);
			MemberDto login = memberService.loginMember(map);
			if (login!= null) {
				session.setAttribute("userinfo", memberDto);
				
				return new ResponseEntity<MemberDto>(login, HttpStatus.OK);
			} else {
				 return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("아이디 또는 비밀번호 확인 후 다시 로그인하세요!");
		}
	}
	@ApiOperation(value = "로그아웃", notes = "로그아웃.")
	@GetMapping("/logout")
	public ResponseEntity<?> logout(HttpSession session) throws Exception{
		session.invalidate();
		return ResponseEntity.ok("Logout successful");
	}

	@ApiOperation(value = "회원목록", notes = "회원의 <big>전체 목록</big>을 반환해 줍니다.")
	@GetMapping("/list")
	public ResponseEntity<?> list() throws Exception {
		log.debug("userlist call");
		List<MemberDto> list = memberService.listMember(null);
		if(list != null && !list.isEmpty()) {
			return new ResponseEntity<List<MemberDto>>(list, HttpStatus.OK);
		} else {
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		}
	}

}
