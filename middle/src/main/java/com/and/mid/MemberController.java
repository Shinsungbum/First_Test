package com.and.mid;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import member.MemberDAO;
import member.MemberVO;
@RestController
public class MemberController {

	@Autowired MemberDAO dao;
	
	@RequestMapping(value =  "/login.mb" , produces = "text/html;charset=utf-8")
	public String login(String id , String pw) {
		
		MemberVO vo = dao.member_login(id, pw);
		Gson gson = new Gson();
		
		if(id == null || pw==null) {
			return gson.toJson(null);
		}
		
		System.out.println(gson.toJson(vo));
		
		
		return gson.toJson(vo);
	}
}
