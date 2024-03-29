package hr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HrServiceImpl implements HrService {
	@Autowired private HrDAO dao;
	
	@Override
	public int employee_insert(EmployeeVO vo) {
		return dao.employee_insert(vo);
	}

	@Override
	public List<EmployeeVO> employee_list() {
		return dao.employee_list();
	}

	@Override
	public EmployeeVO employee_detail(int employee_id) {
		return dao.employee_detail(employee_id);
	}

	@Override
	public int employee_update(EmployeeVO vo) {
		return dao.employee_update(vo);
	}

	@Override
	public int employee_delete(int employee_id) {
		return dao.employee_delete(employee_id);
	}

	@Override
	public List<DepartmentVO> employee_department_list() {
		return dao.employee_department_list();
	}

	@Override
	public List<EmployeeVO> employee_list(int department_id) {
		return dao.employee_list(department_id);
	}

	@Override
	public List<DepartmentVO> department_list() {
		return dao.department_list();
	}

	@Override
	public List<JobVO> job_list() {
		return dao.job_list();
	}

	@Override
	public List<EmployeeVO> employee_name_list() {
		return dao.employee_name_list();
	}

}
