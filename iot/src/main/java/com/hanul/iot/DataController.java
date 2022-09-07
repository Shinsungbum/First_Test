package com.hanul.iot;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.CommonService;

@Controller
public class DataController {
	private String key 
	= "FPgj2NXbJw46TcGkmAfZEiYFDbxilys7KLjk3KaB7AfeJE00ZhPNM0M8unwbsI69fSmT8SNfVEimE6ZZ2U14hA%3D%3D";
	private String animalURL = "http://apis.data.go.kr/1543061/abandonmentPublicSrvc/";
	
	@Autowired private CommonService common;
	
	//유기동물목록 요청
	//@ResponseBody 
	@RequestMapping("/data/animal/list")
	//public Object animal_list(int pageNo, int rows, Model model) {
	public Object animal_list(@RequestBody HashMap<String, Object> map, Model model) {
		StringBuffer url
		= new StringBuffer( animalURL + "abandonmentPublic" );
		url.append("?serviceKey=").append(key);
		url.append("&_type=json");
		url.append("&pageNo=").append(map.get("pageNo"));
		url.append("&numOfRows=").append(map.get("rows"));
		//return common.requestAPItoMap(url);
		model.addAttribute("list", common.requestAPItoMap(url));
		model.addAttribute("pageNo", map.get("pageNo"));
		return "data/animal/animal_list";
	}
	
	
	//약국목록 요청
	@ResponseBody @RequestMapping("/data/pharmacy")
	//public Map<String, Object> pharmacy_list() {
	public Object pharmacy_list(int pageNo, int rows) {
		StringBuffer url 
		= new StringBuffer("http://apis.data.go.kr/B551182/pharmacyInfoService/getParmacyBasisList");
		url.append("?ServiceKey=").append(key);
		url.append("&_type=json");
		url.append("&pageNo=").append(pageNo);
		url.append("&numOfRows=").append(rows);
		return common.requestAPItoMap(url);
		//common.requestAPI( url );
		//http://apis.data.go.kr/B551182/pharmacyInfoService/getParmacyBasisList
		//?ServiceKey=FPgj2NXbJw46TcGkmAfZEiYFDbxily
		//&_type=json
		
	}
	
	
	//공공데이터 목록화면 요청
	@RequestMapping("/list.da")
	public String list(HttpSession session) {
		session.setAttribute("category", "da");
		//응답화면연결
		return "data/list";
	}
}
