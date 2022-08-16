package member;

import java.util.HashMap;

public interface MemberService {
	//CRUD(Create, Read, Update, Delete)
	int member_join(MemberVO vo); //회원가입시 회원정보 저장
	MemberVO member_myinfo(String userid); //내정보보기(마이페이지, 마이프로필)
	MemberVO member_login(HashMap<String, String> map);//로그인처리
	boolean member_id_check(String userid);//회원가입시 아이디중복확인(아이디존재여부)
	String member_salt(String userid);//회원의 salt 조회
	int member_update();//마이페이지에서 회원정보변경
	int member_delete();//회원탈퇴시 회원정보 삭제
	
}
