package pack05.ojdbc2;

import java.sql.SQLException;
import java.util.Scanner;

public class UserInfoDAO extends StudentDAO{
	// 현 StudentDAO를 상속받아서 썼다면 나중에는 접속객체를 초기화 접속객체닫기등등을
	// 하나의 공통 클래스로 몰아 넣기. (재사용이 편함)
	
	// 공통으로 사용되는 로직은 commons , common 등등 공통이라는 패키지를 별도로 두고
	//프로젝트 인원들이 같이 사용하도록 유도함 .(디비접속 , 숫자를 리턴하는메소드  등등 )
	

	//2.로그인 처리를 위한 메소드를 만들기 loginUser(); // 파라메터가 필요할까?
		// ( ↑ ) , true false를 이용해서 true가 나오면 로그인 됨 <-이것만정답 x
		//        , -1은 확실히 실패 그외에는 성공 ( jdbc) ..


		//로그인
		public UserInfoDTO loginUser(String id , String pw) { // 네이버 : 아이디 입력 , 비밀번호 입력
			//연결 -> 전송 -> 결과
			UserInfoDTO dto = new UserInfoDTO();
			conn = getConn();
			String sql = " select * from USER_INFO WHERE user_id = ? and user_pw = ? ";
			// 물음표 갯수 <=> ps.set갯수 맞춰줌
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, id); // 왼쪽을기준으로 첫번째 물음표를 찾고 그물음표에 어떤값을넣음
				ps.setString(2, pw); // 
				rs = ps.executeQuery();
				while(rs.next()) {
					dto.setUser_id(rs.getString("user_id"));
					dto.setUser_pw(rs.getString("user_pw"));
					dto.setFirst_name(rs.getString("first_name"));
					dto.setLast_name(rs.getString("last_name"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
			
			
			return dto;
		}
		
		
		//회원가입
		public boolean joinUser(UserInfoDTO dto) {
			// 1.SQLD <- 되는 INSERT 쿼리를 만든다. ROLLBACK , COMMIT을 꼭함
			// 2.JAVA 작업 ( dto에 사용자가 입력한 정보들을 묶어서 저장 )
			// 3.JAVA 작업 ( dto를 메소드에 넘기고 출력 해보기 )
			// 4.JDBC 작업 
			conn = getConn();//USER_ID, USER_PW, FIRST_NAME, LAST_NAME
			String sql = " INSERT INTO USER_INFO VALUES (1, ?, ?, ?, ?, sysdate, sysdate) ";
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, dto.getUser_id());
				ps.setString(2, dto.getUser_pw());
				ps.setString(3, dto.getFirst_name());
				ps.setString(4, dto.getLast_name());
				
				System.out.println(ps.executeUpdate());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				dbClose();
			}
			
			
			// 메인 회원정보를 입력받고 => 입력받은 결과로 회원가입처리.
			//회원 가입 처리 ( CREATE_YMD , sysdate ) 
			return false;
		}
	
		//사용자에게 어떤 메세지를 보여줌과 동시에 스캐너로 값을 입력받음.
		public String rtnStrMsg(Scanner sc , String msg) {
			System.out.println(msg);
			return sc.nextLine();
		}
		
		//비밀번호 수정 메소드
		public void UpdateUserPw(UserInfoDTO dto) {
			conn = getConn();
			Scanner sc = new Scanner(System.in);
			String change = "";
			System.out.println("1.비밀번호 수정\t2.이름수정");
			String ch = sc.nextLine();
			if(ch.equals("1")) {
				dto.setUser_pw(rtnStrMsg(sc, "변경할 비밀번호를 입력하세요")); 
				change = "user_pw";
			}else if(ch.equals("2")) {
				dto.setFirst_name(rtnStrMsg(sc, "변경할 이름을 입력하세요")); 
				change = "first_name";
			}
			
			
			
			
			String sql = "UPDATE  USER_INFO "
					+ " SET     " + change + " = ? "
					+ " WHERE   USER_ID = ? ";
			try {
				String update = "";
				if(ch.equals("1")) {
					update = dto.getUser_pw();
				}else if(ch.equals("2")) {
					update = dto.getFirst_name();
				}
				
				
				ps = conn.prepareStatement(sql);
				ps.setString(1, update);
				ps.setString(2, dto.getUser_id());
				
				System.out.println(ps.executeUpdate());
				
					
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
			
		}
		
		
		
		
		
}//class

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

