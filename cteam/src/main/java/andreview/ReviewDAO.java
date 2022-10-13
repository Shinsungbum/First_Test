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
	public List<ReviewVO> review_list(int id) {
		return sql.selectList("andReview.list", id);
	}

	//리뷰 삭제 - jk
	public int delete(String email) {
		return sql.delete("andReview.delete",email);
	}
	
	//리뷰 등록 
	public int review_insert(String vo) {
		return sql.insert("andReview.insert", vo);
	}

	//내 리뷰관리-->수정버튼 눌렀을때 jk
	public ReviewVO review_detail(ReviewVO vo) {
		return sql.selectOne("andReview.detail", vo);
	}

	//내 리뷰 수정 update jk
	public int review_update(ReviewVO vo) {
		return sql.update("andReview.update", vo);
	}

	//내 리뷰 수정 하기 전에 리뷰 이미지 조회
	public ReviewVO review_image_detail(ReviewVO vo) {
		return sql.selectOne("andReview.detail", vo);
	}

}
