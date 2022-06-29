package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex01_Response")
public class Ex01_Response extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex01_Response() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//페이지 전환 RequestDispatcher
		// JSP Container 에서 받아서 사용하게끔 만들어 놓음.(서버 스타트시 알아서 객체를 내장개체화 해둠)
		request.setAttribute("id", "admin");
		request.setAttribute("pw", "admin1234");
		RequestDispatcher rd = request.getRequestDispatcher("Ex02_Response/Ex01_Redirect.jsp");
		rd.forward(request, response);
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
