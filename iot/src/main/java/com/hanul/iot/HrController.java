package com.hanul.iot;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import hr.EmployeeVO;
import hr.HrServiceImpl;

@Controller
public class HrController {
	@Autowired private HrServiceImpl service;
	
	//사원목록화면 요청
	@RequestMapping("/list.hr")
	public String list(HttpSession session, Model model) {
		session.setAttribute("category", "hr");
		//DB에서 사원 목록을 조회해와 : 비지니스 로직
		List<EmployeeVO> list = service.employee_list();
		//화면에 출력할 수 이쏘록 Model에 담는다
		model.addAttribute("list" , list);
		//응답화면 열결
		return "employee/list";
	}
	
}