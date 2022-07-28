package hr;

import java.util.List;

public interface HrService {
	int employee_insert(EmployeeVO vo);//신규사원등록 - 신규저장
	List<EmployeeVO> employee_list();//사원목록조회
	EmployeeVO employee_detail(int employee_id);//사원상세조회
	int employee_update(EmployeeVO vo);//사원정보변경저장
	int employee_delete(int employee_id); //사원정보삭제
	
}
