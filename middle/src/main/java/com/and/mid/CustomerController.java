package com.and.mid;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import customer.CustomerDAO;
import customer.CustomerVO;

public class CustomerController {
	CustomerDAO dao = new CustomerDAO();
	
	@RequestMapping("/list.cu")
	public String customerList(Model model) {
		List<CustomerVO> list = dao.customer_list();
		model.addAttribute("list", list);
		return "customer/list";
	}
}
