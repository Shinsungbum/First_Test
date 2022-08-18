package com.and.mid;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import andmember.AndMemberDAO;
import andmember.AndMemberVO;
import customer.CustomerVO;



@RestController
public class AndMemberController {
	@Autowired AndMemberDAO dao ;
	


	@RequestMapping(value =  "/login.ad" , produces = "text/html;charset=utf-8")
	public String login(String email, String pw) {
		System.out.println(email);
		
		AndMemberVO vo = dao.login(email, pw);
		Gson gson = new Gson();
		return gson.toJson(vo);
	}
	
	@RequestMapping(value =  "/join.ad" , produces = "text/html;charset=utf-8")
	public String join(String data) {
		System.out.println(data);
		AndMemberVO vo = new Gson().fromJson( data, AndMemberVO.class);
		vo.setEmail("123");
		System.out.println(vo);
		int result = dao.join(vo);
		Gson gson = new Gson();
		return gson.toJson(vo);
	}
	

	
	
}
