package com.hanul.iot;

import java.util.HashMap;
import java.util.UUID;

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
	
	
	
	
	
	//비밀번호변경 처리 요청
	@RequestMapping("/changePw")
	public String change(HttpSession session, String userpw) {
		//화면에서 입력한 새비밀번호로 DB에 변경저장
		MemberVO vo =  (MemberVO) session.getAttribute("loginInfo");
		//로그인 사용자의 salt를 사용해
		//입력한 새 비밀번호를 암호화 
		userpw = common.getEncrypt(vo.getSalt(), userpw);
		vo.setUserpw(userpw);
		service.member_reset_password(vo);
		//세션의 로그인 사용자 정보를 변경된 정보로 바꿔 담는다
		session.setAttribute("loginInfo", vo);
		//응답화면연결
		return "redirect:/";
		
	}
	
	
	//로그아웃처리 요청
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		//세션의 로그인정보를 삭제
		session.removeAttribute("loginInfo");
		
		return "redirect:/";
	}
	
	
	
	//비밀번호변경 화면 요청
	@RequestMapping("/password")
	public String password() {
		//응답화면 연결
		return "member/password";
	}
	
	
	
	
	//비밀번호 재발급 처리
	@ResponseBody @RequestMapping(value="/resetPw"
										, produces="text/html; charset=utf-8")
	public String reset(MemberVO vo) {
		//화면에서 입력한 아이디와 이메일이 일치하는지 확인한 후
		if(service.member_userid_email(vo) == 0) {
			StringBuffer msg = new StringBuffer("<script>");
			msg.append("alert('")
			.append(vo.getName()).append("님\\n아이디나 이메일이 맞지 않습니다\\n")
			.append("확인하세요!")
			.append("');");
			msg.append("history.go(-1);");
			msg.append("</script>");
			return msg.toString();
		}
		
		//화면에서 입력한 아이디 사용자에 대해 지정한 이메일로 임시비밀번호를 발급해서 보낸다.
		//임시 비밀번호로 사용할 랜덤 문자열 생성
		String pw = UUID.randomUUID().toString(); 
		pw = pw.substring(pw.lastIndexOf("-")+1);
		
		//임시비번을 암호화하는데 사용할 salt 생성하기
		String salt = common.generateSalt();
		//salt를 사용해 임시비번을 암호화하기
		vo.setUserpw(common.getEncrypt(salt, pw));
		vo.setSalt(salt);
		//임시비번을 DB에 저장한 후 이메일로 임시비번을 전송한다
		StringBuffer msg = new StringBuffer("<script>");
		if(common.sendPassword(vo.getEmail(), vo.getUserid(), vo.getName(), pw) && service.member_reset_password(vo) == 1) {
			msg.append("alert('임시 비밀번호가 발급되었습니다. \\n이메일을 확인하세요');");
			msg.append("location='login';");
		}else {
			msg.append("alert('임시 비밀번호 발급 실패ㅠㅠ');");
			msg.append("history.go(-1);");
		}
		msg.append("</script>");
		return msg.toString();
			
			
		}
		
		
	
	
	
	
	
	
	
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
