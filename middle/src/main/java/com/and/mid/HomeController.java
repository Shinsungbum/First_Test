package com.and.mid;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import customer.CustomerDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired CustomerDAO dao ;
	
	@ResponseBody
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		System.out.println(dao.customer_list().size());
		
		
		return "home";
	}
	
}
