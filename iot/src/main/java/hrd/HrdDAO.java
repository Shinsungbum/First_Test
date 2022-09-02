package hrd;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class HrdDAO implements HrdService {
	
	@Autowired @Qualifier("hanul") private SqlSession sql;
	
	@Override
	public int hrd_insert(HrdVO vo) {
		return 0;
	}

	@Override
	public HrdVO hrd_detail(int id) {
		HrdVO vo =  sql.selectOne("hrd.detail", id);
		return vo;
	}

	@Override
	public int hrd_update(HrdVO vo) {
		return 0;
	}

	@Override
	public int Hrd_delete(int id) {
		return 0;
	}

	@Override
	public List<HrdVO> hrd_list() {
		
		return sql.selectList("hrd.list");
	}

	

}
