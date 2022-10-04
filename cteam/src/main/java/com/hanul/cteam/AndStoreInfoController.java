package com.hanul.cteam;




import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import andbookmark.AndBookmarkVO;
import common.Common;
import storeinfo.BasketVO;
import storeinfo.StoreInfoDAO;
import storeinfo.StoreInfoVO;
import storeinfo.StoreMenuVO;

@RestController
public class AndStoreInfoController {

  @Autowired StoreInfoDAO dao;
  @Autowired Common common;
	Gson gson = new Gson();
	
	//가게 리뷰 조회-jk
	@RequestMapping(value = "/andStoreReview", produces = "text/html;charset=utf-8")
	public String store_Review(int store_code) {
		//StoreInfoVO vo = gson.fromJson(store_code, StoreInfoVO.class);
		
		List<StoreInfoVO> list = dao.store_Review(store_code);
		Gson gson = new Gson();
		return gson.toJson(list);
		
	}
	
	
	//가게리스트 조회
	@RequestMapping(value = "/andStoreList", produces = "text/html;charset=utf-8")
	public String storeList() {
		List<StoreInfoVO> list = dao.store_list();
		Gson gson = new Gson();
		return gson.toJson(list);
		
	}
	
	//가게 메뉴리스트 조회 - sb 10/04
	@RequestMapping(value = "/storeMenuList", produces = "text/html;charset=utf-8")
	public String storeMenuList(int store_code) {
		List<StoreMenuVO> list = dao.store_menu_list(store_code);
		Gson gson = new Gson();
		return gson.toJson(list);	
	}
	
	//장바구니 추가 - sb 10/04
		@RequestMapping(value = "/andBasketInsert", produces = "text/html; charset=utf-8")
		public String basket_insert(String menu, int id) {
			StoreMenuVO vo = new Gson().fromJson(menu, StoreMenuVO.class);
			dao.baketInsert(vo, id);
			return gson.toJson(vo);
		}
		
	
		//장바구니 리스트 출력 - sb 10 /04
		@RequestMapping(value = "/andBasketList", produces = "text/html; charset=utf-8")
		public String basket_list(int id) {
			List<BasketVO> list = dao.basket_list(id);
			return gson.toJson(list);
		}
		
	
		//장바구니 중복체크
				@RequestMapping(value = "/andBasket", produces = "text/html; charset=utf-8")
				public String baskett() {
					List<BasketVO> list = dao.basket();
					return gson.toJson(list);
				}
				
				//장바구니 리스트 출력 - sb 10 /04
				@RequestMapping(value = "/andBasketDelete", produces = "text/html; charset=utf-8")
				public String basket_delet(String menu) {
					BasketVO vo = new Gson().fromJson(menu, BasketVO.class);
					dao.baketDelete(vo);
					return gson.toJson(vo);
				}
				
				//장바구니 리스트 출력 - sb 10 /04
				@RequestMapping(value = "/andBasketDeleteAll", produces = "text/html; charset=utf-8")
				public int basket_delet_all() {
					return dao.baketDeleteAll();
				}
				
	
}
