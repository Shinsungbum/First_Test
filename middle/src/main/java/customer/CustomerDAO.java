package customer;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerDAO {
	@Autowired @Qualifier("hanul") private SqlSession sql;

	public List<CustomerVO> customer_list() {
		return sql.selectList("customer.list");
	}

	public CustomerVO customer_detail(int id) {
		return sql.selectOne("customer.detail", id);
	}

	
	public int customer_update(CustomerVO vo) {
		return sql.update("customer.update", vo);
	}

	public int customer_delete(int id) {
		return sql.delete("customer.delete", id);
	}
}
