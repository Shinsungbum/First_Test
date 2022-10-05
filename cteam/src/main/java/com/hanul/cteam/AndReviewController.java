package com.hanul.cteam;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import andreview.ReviewDAO;
import andreview.ReviewVO;


@RestController
public class AndReviewController {
		@ Autowired ReviewDAO dao;;
		Gson gson = new Gson();
		

		//내 리뷰 수정 -> update jk
		
		@RequestMapping(value = "/andReviewUpdate", produces = "text/html;charset=utf-8")
		public String review_update(String vo) {
			ReviewVO  update = gson.fromJson(vo, ReviewVO.class);
//			String writer = update.getWritedate();
//			System.out.println(writer);
//			 writer = update.getWritedate().substring(0,10);
//			//SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
//			java.sql.Date sqldate = java.sql.Date.valueOf(writer);
//		    System.out.println(sqldate);
		    
		  
		    
			dao.review_update(update);
			
			return gson.toJson(update);
		}

	//내 리뷰목록에서 리뷰를 클릭했을때 ! 리뷰 detail - jk 2022/10/02
		@RequestMapping(value = "/andReviewDetail", produces = "text/html;charset=utf-8")
		public String review_detail(int star_code) {
		//	System.out.println(star_code);
			ReviewVO detail = new ReviewVO();
			detail = dao.review_detail(star_code);
			// System.out.println(detail.getKind());
			return gson.toJson(detail);
			
		}
		
		//리뷰 작성 -jk
	@RequestMapping(value = "/andReview", produces = "text/html;charset=utf-8")
	public String review_insert(String vo) {
		ReviewVO  insert = gson.fromJson(vo, ReviewVO.class);
		
		return "";
	}
	
}
