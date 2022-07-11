package hr;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class HrDAO {

public static SqlSession sql;
	
	static {
		String resource = "mybatis/config2.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			sql = sqlSessionFactory.openSession(true); //AutoCommit설정을 true로 줌
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public List<EmployeeDTO> getEmpList() {
		List<EmployeeDTO> list = sql.selectList("hr.emplist");
		
		return list;
	}

	public List<DeptDTO> getdeptList() {
		List<DeptDTO> list = sql.selectList("hr.deptlist");
		
		return list;
	}

}
