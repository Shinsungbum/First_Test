package pack04.odjbc;

import java.sql.Connection;

public class JdbcMain {
	public static void main(String[] args) {
		JdbcDAO dao = new JdbcDAO();
		Connection conn = dao.getConn();
		
		try {
			if (conn.isClosed()) {
				System.out.println("닫힘");
			} else {
				System.out.println("열림");
				for (int i = 0; i < dao.studentMember().size(); i++) {
					System.out.print(dao.studentMember().get(i).getStudent_no() + "\t");										
					System.out.println(dao.studentMember().get(i).getStudent_name());										
				}
			} // if

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
