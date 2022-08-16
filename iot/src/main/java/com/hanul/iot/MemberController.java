package com.hanul.iot;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.CommonService;
import member.MemberServiceImpl;
import member.MemberVO;

@Controller
public class MemberController {
	@Autowired private MemberServiceImpl service;
	@Autowired private CommonService common; 
	
	
	//비밀번호찾기 화면 요청
	@RequestMapping("/findPw")
	public String find() {
		//응답화면 연결
		return "default/member/find";
	}
	
	
	
	
	
	
	
	
	
	
	
	//지능형 iot회원 로그인 처리 요청
	@ResponseBody @RequestMapping("/iotlogin")
	public boolean login(String id, String pw, HttpSession session) {
		//화면에서 입력한 아이디와 비밀번호가 일치하는 회원정보가 DB에 존재하는지 확인
		//ex) hong, 1234 - 1234를 hong의 salt를 사용해 암호화한 후 그 정보와
		//DB의 userpw 정보가 일치하는지를 확인해야 한다
		String salt = service.member_salt(id);
		pw = common.getEncrypt(salt, pw); //암호화된 비번
		
		HashMap<String , String> map = new HashMap<String, String>();
		map.put("pw", pw);
		map.put("id", id);
		MemberVO vo = service.member_login(map);
		
		//조회안 회원정보를 세션에 담는다
		session.setAttribute("loginInfo", vo);
		
		return vo == null ? false : true;
	}

	
	//로그인 화면 요청
	@RequestMapping("/login")
	public String login(HttpSession session) {
		session.setAttribute("category", "login");
		//응답화면 연결 : 로그인화면
		return "default/member/login";
	}
}
