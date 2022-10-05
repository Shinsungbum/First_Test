package andreview;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;



@Repository
public class ReviewDAO {
	@Autowired @Qualifier("cteam") private SqlSession sql;
	
	//리뷰 리스트 -jk
	public List<ReviewVO> review_list(String email) {
		return sql.selectList("andReview.list", email);
	}

	//리뷰 삭제 - jk
	public int delete(String email) {
		return sql.delete("andReview.delete",email);
	}
	
	//리뷰 등록 
	public int insert(ReviewVO vo) {
		return sql.insert("andReview.insert", vo);
	}

	//내 리뷰관리-->수정버튼 눌렀을때 jk
	public ReviewVO review_detail(int star_code) {
		return sql.selectOne("andReview.detail", star_code);
	}

	//내 리뷰 수정 update jk
	public int review_update(ReviewVO vo) {
		return sql.update("andReview.update", vo);
	}
}
