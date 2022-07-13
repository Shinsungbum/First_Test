package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.no")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private RequestDispatcher rd;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//list.no : 공지글목록화면 요청
		//detail.no: 공지글상세화면 요청
		//new.no: 신규 공지글화면 요청
		String uri = request.getServletPath();
		String view = "";
		if(uri.equals("/list.no")) {
			//응답할화면 연결 - 공지글 목록 화면
			//request.getRequestDispatcher("/notice/list.jsp");
			view = "/notice/list.jsp";
		}else if(uri.equals("/new.no")) {
			//신규 공지글 쓰기화면 요청
			
			//응답화면 연결 - 공지글쓰기 화면
			view = "/notice/new.jsp";
		}
		
		//화면연결방식 : 
		//forward, redirect
		request.getRequestDispatcher(view).forward(request, response);
		
		
	}

}