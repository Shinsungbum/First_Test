package com.hanul.iot;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;



import hrd.HrdServiceImpl;
import hrd.HrdVO;

@Controller
public class HrdController {
	@Autowired private HrdServiceImpl service;
	
	//새로운 직업정보등록
	@RequestMapping("/new.jo")
	public String insert() {
		//응답화면 요청
		return "hrd/new";
	}
	
	
	
	
	//직업정보 상세화면 요청
	@RequestMapping("/detail.jo")
	public String detail(@ModelAttribute("id") int id, Model model) {
		//해당 직업정보를 DB에서 조회해와 화면에 출력할 수 있도록 Model에 담는다
		model.addAttribute("vo", service.hrd_detail(id));
		//응답화면 연결
		return "hrd/detail";
	}
	
	
	
	//직업정보 목록화면 요청
	@RequestMapping("/list.jo")
	public String list(Model model, HrdVO vo) {
		//DB에서 직업정보 목록을 조회해와 화면에 출력하도록 모델에 담는다
		List<HrdVO> list = service.hrd_list();
		model.addAttribute("list",  list);
		//응답화면 연결
		return "hrd/list";
	}
	
}
