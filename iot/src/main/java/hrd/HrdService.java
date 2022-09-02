package hrd;

import java.util.List;

public interface HrdService {
	int hrd_insert(HrdVO vo);//직업정보 신규저장
	List<HrdVO> hrd_list();//직업정보 목록 조회
	HrdVO hrd_detail(int id);//직업정보 상세조회
	int hrd_update(HrdVO vo);//직업정보 변경저장
	int Hrd_delete(int id); //직업정보 삭제
}
