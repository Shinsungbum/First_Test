package member;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired MemberDAO dao;
	@Override
	public int member_join(MemberVO vo) {
		return 0;
	}

	@Override
	public MemberVO member_myinfo(String userid) {
		return null;
	}

	@Override
	public MemberVO member_login(HashMap<String, String> map) {
		return dao.member_login(map);
	}

	@Override
	public boolean member_id_check(String userid) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int member_update() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int member_delete() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String member_salt(String userid) {
		dao.member_salt(userid);
		return null;
	}

}
