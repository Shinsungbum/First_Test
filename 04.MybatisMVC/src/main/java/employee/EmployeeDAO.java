package employee;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import student.StudentDTO;

public class EmployeeDAO {
	Connection conn;
	PreparedStatement ps; //질의문객체
	ResultSet rs ;
	
	
	//디비 연결 메소드
	public Connection getConn() {
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "hr";
		String password = "0000";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getConn Error !");
		} 
		return conn;
	}
	
	//디비종료 메소드
	public void dbClose() {
		try { 
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();// 2
			}
			if (conn != null) {
				conn.close();// 1
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public ArrayList<EmployeeDTO> getLIst(){
		ArrayList<EmployeeDTO> list = new ArrayList<EmployeeDTO>();
		conn = getConn();
		String sql = " SELECT      e.employee_id 사번, e.first_name||' '||e.last_name 이름, "
				+ "            e.email 이메일, "
				+ "            e.department_id 부서코드, "
				+ "            e.phone_number 휴대전화, "
				+ "            d.department_name 부서명, "
				+ "            c.country_name||''||l.city||''||l.state_province||''||l.street_address||''||l.postal_code 전체주소, "
				+ "            m.max_sal 부서최대급여, "
				+ "            m.min_sal 부서최소급여, "
				+ "            m.avg_sal 부서평균급여 "
				+ " FROM        employees e LEFT OUTER JOIN departments d "
				+ " ON          e.department_id = d.department_id "
				+ " LEFT OUTER JOIN locations l "
				+ " ON          d.location_id = l.location_id "
				+ " LEFT OUTER JOIN countries c "
				+ " ON          c.country_id = l.country_id "
				+ " LEFT OUTER JOIN (SELECT department_id, MAX(salary) max_sal,  "
				+ "                 MIN(salary) min_sal,  "
				+ "                 ROUND(AVG(salary),2) avg_sal "
				+ "                 FROM   employees "
				+ "                 GROUP BY department_id ) m "
				+ " ON          e.department_id = m.department_id ";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery(); 
			while(rs.next()) {
				list.add( new EmployeeDTO(
						rs.getInt("사번"),
						rs.getString("이름"),
						rs.getString("이메일"),
						rs.getInt("부서코드"),
						rs.getString("휴대전화"),
						rs.getString("부서명"),
						rs.getString("전체주소"),
						rs.getDouble("부서최대급여"),
						rs.getDouble("부서최소급여"),
						rs.getDouble("부서평균급여")
						));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
		return list;
	}
	
		
	











}
	
	
	
	
	
	
	
	
	
	
	

