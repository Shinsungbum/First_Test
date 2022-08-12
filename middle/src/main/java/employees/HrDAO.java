package employees;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class HrDAO {
	@Autowired @Qualifier("hr") private SqlSession sql;
	
	public List<HrVO> employee_list(String keyword) {
		return sql.selectList("employee.list", keyword);
	}

}
