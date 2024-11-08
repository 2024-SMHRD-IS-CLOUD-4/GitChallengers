package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class ReviewDAO {
	
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	// 리뷰검색
	public List<Review> search(String keyword){
		SqlSession sqlSession = factory.openSession(true);
		List<Review> result = sqlSession.selectList("ReviewMapper.search", keyword);
		sqlSession.close();

		return result;
	}
	
	// 리뷰 전체 불러오기
	public List<Review> selectAll(){
		SqlSession sqlSession = factory.openSession(true);
		List<Review> result = sqlSession.selectList("ReviewMapper.selectAll");
		sqlSession.close();

		return result;
	}

	// 인덱스로 리뷰 불러오기
	public Review review(int review_idx) {
		SqlSession sqlSession = factory.openSession(true);
		Review result = sqlSession.selectOne("ReviewMapper.review", review_idx);
		sqlSession.close();

		return result;
	}
	
	// 아이디로 리뷰 불러오기
	public List<Review> reviewList(String id) {
		SqlSession sqlSession = factory.openSession(true);
		List<Review> result = sqlSession.selectList("ReviewMapper.reviewList", id);
		sqlSession.close();

		return result;
	}
	
	// 베스트 리뷰
	public List<Review> bestReview() {
		SqlSession sqlSession = factory.openSession(true);
		List<Review> result = sqlSession.selectList("ReviewMapper.bestReview");
		sqlSession.close();

		return result;
	}
	
	// 리뷰 작성 수 (챌린지 완료 횟수)
	public int count(String id) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.selectOne("ReviewMapper.count", id);
		sqlSession.close();

		return result;
	}
	
	// 리뷰 작성
	public int reviewWrite(Review r) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.insert("ReviewMapper.reviewWrite", r);
		sqlSession.close();

		return result;
	}
	
	
}
