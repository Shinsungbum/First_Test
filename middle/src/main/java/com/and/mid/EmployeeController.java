package com.and.mid;


import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import employees.HrDAO;
import employees.HrVO;


@RestController
public class EmployeeController {
	@Autowired HrDAO dao;
	// 새로 패키지를 만들었으면 어노 테이션
	@RequestMapping(value = "/list.hr", produces = "text/html;charset=utf-8")
	public String getList(String keyword) {
		List<HrVO> list = dao.employee_list(keyword);
		Gson gson = new Gson();
		return gson.toJson(list);
	}
}
