package pack04.odjbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class JdbcDAO {
	//데이터베이스에서 데이터를 가지고오는 모든 처리를 담당하는 클래스(객체)
	//가지고 온 데이터를 묶어서 저장하기 위한 클래스(DTO)
	
	// Connection <= 연결로를 만드는 객체( 1. 연결 객체 )
	// ....StateMent <= ↑ 연결로를 통해서 전송을 하는객체( 2. 전송 객체 ) 
	// ResultSet <= 전송객체가 어떤 쿼리를 실행하고나서 결과를 가지고오면 담기위한 객체( 3. 결과 )
	private Connection conn; // 연결객체
	private PreparedStatement ps; // 전송객체
	private ResultSet rs; // 결과객체
	
	public void dbClose() {
		//어떤 순서대로 닫아야할까? 열때 통신연결로를 열고 전송개체를 보내고 결과 객체 받음.
		// 통신을 열때랑 역순으로 닫아주면 된다.
		try {
			if(rs != null) {
				rs.close();
			}

			if(ps != null) {
				ps.close();
			}

			if(conn != null) {
				conn.close();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//dbClose()
	
	
	
	
	
	public boolean getInt() {
		conn = getConn();
		String sql = "select '성범 짱' name from dual";
		try {
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				System.out.println(rs.getString("name"));
			}
			return true;
				
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return false;
	}//class
	
	
	
	
	
	
	public Connection getConn() {
		String url = "jdbc:oracle:thin:@221.144.89.105:3301:XE";
		String user = "hanul";
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
	
	//메소드접근제한자 리턴타입 메소드이름
	//이턴타입있음 => 리턴해줘야함
	
	//id , pw ( inputType )
	
	
	//학생정보를 조회해서 내정보만 따로 가지고오는 메소드를 만든다
	public JdbcDTO getInfo() {
		JdbcDTO dto = null;
		conn = getConn();
		String sql = "SELECT      *"
				+ "FROM        student where STUDENT_NO = 4";
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				System.out.println(rs.getInt("STUDENT_NO"));		//oracle number => int
				System.out.println(rs.getString("STUDENT_NAME"));	//oracle varchar2 => String
				
				dto = new JdbcDTO(rs.getInt("STUDENT_NO"), rs.getString("STUDENT_NAME"));
			}// 이 결과를 JdbcDTO에 담고 return하게 만들어 보기
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
		return dto;	//<= null이 아니라 내가 조회한 데이터를 어디서든 사용할수있게 리턴해주는 메소드
	}//class
	
	//학생정보를 전체 조회해서 Array타입을 리턴하는 메소드를 만든다.
	//메소드 이름 형식 등등 마음대로하기.
	public ArrayList<JdbcDTO> studentMember(){
		conn = getConn();
		ArrayList<JdbcDTO> arrayList = new ArrayList<JdbcDTO>();
		String sql = "SELECT      *"
				+ "FROM        student";
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				arrayList.add(new JdbcDTO(rs.getInt("STUDENT_NO"), rs.getString("STUDENT_NAME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return arrayList;
	}
	
	
}
