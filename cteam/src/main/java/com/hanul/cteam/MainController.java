package com.hanul.cteam;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {

@RequestMapping("/index")
	public String test() {
		
	   return"";
	}
	
}
