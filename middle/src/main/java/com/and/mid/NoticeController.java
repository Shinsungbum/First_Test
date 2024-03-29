package com.and.mid;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;


import notice.NoticeDAO;
import notice.NoticeVO;

@RestController
public class NoticeController {
	@Autowired NoticeDAO dao ;
	
	@RequestMapping(value =  "/test.no" , produces = "text/html;charset=utf-8")
	public String Test() {
		String test = dao.test();
		return test;
	}
	
	
	
	@RequestMapping(value =  "/list.no" , produces = "text/html;charset=utf-8")
	public String getList(HttpServletResponse res) {
		List<NoticeVO> list = dao.noticeList();
		Gson gson = new Gson();
		return gson.toJson(list);
	}

}
