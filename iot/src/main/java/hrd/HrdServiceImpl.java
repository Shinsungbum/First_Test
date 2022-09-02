package hrd;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HrdServiceImpl implements HrdService {

	@Autowired private HrdDAO dao;
	
	@Override
	public int hrd_insert(HrdVO vo) {
		return 0;
	}

	@Override
	public HrdVO hrd_detail(int id) {
		return dao.hrd_detail(id);
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
	public List<HrdVO> hrd_list( ) {
		return dao.hrd_list();
	}

	

}
