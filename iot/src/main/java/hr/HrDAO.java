package hr;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class HrDAO implements HrService {
	@Autowired @Qualifier("hr") private SqlSession sql;
	
	@Override
	public int employee_insert(EmployeeVO vo) {
		return 0;
	}

	@Override
	public List<EmployeeVO> employee_list() {
		return sql.selectList("hr.list");
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
