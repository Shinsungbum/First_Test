package andmember;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;



@Repository
public class AndMemberDAO {
	@Autowired @Qualifier("hanul") private SqlSession sql;
	

	
	
	public AndMemberVO login(String email, String pw) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("pw", pw);
		return sql.selectOne("andmember.login", map);
	}




	public int join(AndMemberVO vo) {
		return sql.insert("andmember.join", vo);
		
	}

}
