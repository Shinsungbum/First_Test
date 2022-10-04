package storeinfo;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RestController;

import common.Common;

@RestController
public class StoreInfoDAO {
	@Autowired @Qualifier("cteam") private SqlSession sql;
	@Autowired private Common common;
	
	
	
	public List<StoreInfoVO> store_list() {
		return sql.selectList("store.list");
	}



	public List<StoreMenuVO> store_menu_list(int store_code) {
		return sql.selectList("store.menu_list", store_code);
	}



	public List<StoreInfoVO> store_Review(int store_code) {
		return sql.selectList("store.review", store_code);
	}



	public int baketInsert(StoreMenuVO vo, int id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("vo", vo);
		map.put("id", id);
		return sql.insert("store.basket_insert", map);
	}



	public List<BasketVO> basket_list(int id) {
		return sql.selectList("store.basket_list", id);
	}



	public List<BasketVO> basket() {
		return sql.selectList("store.basket");
	}



	public int baketDelete(BasketVO vo) {
		return sql.delete("store.basket_delete", vo);
	}



	public int baketDeleteAll() {
		return sql.delete("store.basket_delete_all");
	}
}
