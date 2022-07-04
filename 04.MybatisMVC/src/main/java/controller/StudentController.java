package controller;

import java.io.IOException;
//import java.sql.Connection;
//import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import student.StudentDAO;
import student.StudentDTO;
//*.aa
// <a href="test.aa"> </a>
@WebServlet("*.st")// *<-전체를 받는 url패턴(맵핑)사용할때는 /<- 빼야됨 오류남
public class StudentController extends HttpServlet {
	RequestDispatcher rd ;
	StudentDAO dao = new StudentDAO();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		rd = req.getRequestDispatcher("error/404.jsp"); // 나중에 추가 예정(2022.06.30 KYM)
		
		if(req.getServletPath().equals("/list.st")) {	
			//추후 DB에서 가져온 정보를 이용 =>지금은 ArrayList를 수동으로 만들기
			ArrayList<StudentDTO> list = dao.getLIst();
			req.setAttribute("list", list);
			// JSP 에 보내서 출력 해보기 
			rd = req.getRequestDispatcher("Student/list.jsp");
			
		}else if(req.getServletPath().equals("/test.st")) {
			//디비연결 테스트했음
			System.out.println( dao.getLIst().size());
		
		
		}else if(req.getServletPath().equals("/detail.st")) {
			StudentDTO dto = dao.getStudentInfo(req.getParameter("studentno"),req.getParameter("user_id") );
			
//			System.out.println(req.getParameter("studentno"));
//			System.out.println(req.getParameter("user_id"));
			req.setAttribute("dto", dto);
			rd = req.getRequestDispatcher("Student/detail.jsp");
		
		}else if(req.getServletPath().equals("/update.st")) {
			StudentDTO dto = dao.getStudentInfo(req.getParameter("student_no"),req.getParameter("user_id") );
			req.setAttribute("dto", dto);
			rd = req.getRequestDispatcher("Student/update.jsp");
		
		}else if(req.getServletPath().equals("/delete.st")) {
			rd = req.getRequestDispatcher("Student/delete.jsp");
		}

		
		
		rd.forward(req, resp);
	}

}
