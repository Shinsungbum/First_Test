package hr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service
public class HrServiceImpl implements HrService {
	@Autowired private HrDAO dao;
	
	
	@Override
	public int employee_insert(EmployeeVO vo) {
		return 0;
	}

	@Override
	public List<EmployeeVO> employee_list() {
		return dao.employee_list();
	}

	@Override
	public EmployeeVO employee_detail(int employee_id) {
		return null;
	}

	@Override
	public int employee_update(EmployeeVO vo) {
		return 0;
	}

	@Override
	public int employee_delete(int employee_id) {
		return 0;
	}

}
