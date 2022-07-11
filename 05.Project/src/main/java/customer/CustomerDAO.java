package customer;


import java.util.List;



import test.TestDAO;

public class CustomerDAO extends TestDAO{

	
	public List<CustomerDTO> getList() {
		List<CustomerDTO> list = sql.selectList("cus.selectlist");
		return list;
	}

	public int delete(String id) {
		return sql.delete("cus.delete",id);
	}
	
	
	
	
}
