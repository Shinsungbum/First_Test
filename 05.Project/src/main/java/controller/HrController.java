package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hr.DeptDTO;
import hr.EmployeeDTO;
import hr.HrDAO;


@WebServlet({"/list.emp", "/list.dept"})
public class HrController extends HttpServlet {
	RequestDispatcher rd;
	HrDAO dao = new HrDAO();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		if(req.getServletPath().equals("/list.emp")) {
			//사원 테이블 처리
			List<EmployeeDTO>list = dao.getEmpList();
			System.out.println(list.size());
			req.setAttribute("list", list);
			rd = req.getRequestDispatcher("hr/emplist.jsp");
		
			
			
			
			
		}else if(req.getServletPath().equals("/list.dept")) {
			//부서 테이블 처리
			List<DeptDTO>list = dao.getdeptList();
			req.setAttribute("list", list);
			rd = req.getRequestDispatcher("hr/deptlist.jsp");
		
		}
		
		rd.forward(req, resp);
	}
}
