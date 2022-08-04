package com.hanul.iot;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hr.DepartmentVO;
import hr.EmployeeVO;
import hr.HrServiceImpl;
import hr.JobVO;

@Controller
public class HrController {
	@Autowired private HrServiceImpl service;
	
	//신규사원 등록처리 요청
	@RequestMapping("/insert.hr")
	public String insert_employee(EmployeeVO vo) {
		service.employee_insert(vo);
		return "redirect:list.hr";
	}
	
	
	
	//신규사원등록화면 요청
	@RequestMapping("/new.hr")
	public String employee(Model model) {
		//신규사원정보입력화면 
		//부서를 선택할 수 있도록 회사의 전체부서목목을 조회해와
		//전체업무목록을 조회해와
		//전체사원목록(매니저)를 조회해와
		List<DepartmentVO> departments = service.department_list();
		List<JobVO> jobs = service.job_list();
		List<EmployeeVO> managers = service.manager_list();
		model.addAttribute("departments", departments);
		model.addAttribute("jobs",jobs);
		model.addAttribute("managers",managers);
		//신규화면에 출력할 수 있도록 Model에 담는다
		return "employee/new";
	}
	
	
	
	
	//사원정보 변경저장 처리 요청
	@RequestMapping("/update.hr")
	public String update(EmployeeVO vo) {
		//화면에서 변경ㅇ비력한 정보를 DB에 변경저장한 후
		service.employee_update(vo);
		//응답화면연결
		return "redirect:detail.hr?id="+ vo.getEmployee_id();
	}
	
	
	
	
	//사원정보 수정화면 요청
	@RequestMapping("/modify.hr")
	public String modify(int id, Model model) {
		//선택한 사원의 정보, 부서목록을 DB에서 조회해와
		EmployeeVO vo = service.employee_detail(id);
		List<DepartmentVO> departments = service.department_list();
		List<JobVO> jobs = service.job_list();
		//화면에 출력할 수 있도록 Model에 담는다
		model.addAttribute("vo", vo);
		model.addAttribute("departments", departments);
		model.addAttribute("jobs", jobs);
		//응답화면 연결
		return "employee/modify";
	}
	
	
	
	
	//사원정보 삭제처리 요청
	@RequestMapping("/delete.hr")
	public String delete(int id) {
		//화면에서 선택한 사원의정보를 DB에서 삭제한 후 : 비지니스로직
		service.employee_delete(id);
		//응답화면 연결
		return "redirect:list.hr";
	}
	
	
	
	//사원상세화면 요청
	@RequestMapping("/detail.hr")
	public String detail(int id, Model model) {
		//선택한 사원의 정보를 DB에서 조회해외 : 비지니스로직
		EmployeeVO vo = service.employee_detail(id);
		//화면에 출력할 수 있도록 Model에 담는다
		model.addAttribute("vo", vo);
		//응답화면 연결
		return "employee/detail";
	}
	
	

	
	
	//사원목록화면 요청
	@RequestMapping("/list.hr")
	public String list(HttpSession session, @RequestParam(defaultValue = "-1") int department_id, Model model) {
		session.setAttribute("category", "hr");
		
		//DB에서 사원 목록 부서목록을 조회해와 : 비지니스 로직
		List<EmployeeVO> list;
		if( department_id == -1 )
			list = service.employee_list();
		else
			list = service.employee_list(department_id);
			
			List<DepartmentVO> departments = service.employee_department_list();
		
		//화면에 출력할 수 있도록 Model에 담는다
		model.addAttribute("list" , list);
		model.addAttribute("departments", departments);
		model.addAttribute("departments_id", department_id);
		
		//응답화면 열결
		return "employee/list";
	}
	
}//class