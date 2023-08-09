package com.kh.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.board.model.vo.Board;
import com.kh.common.model.vo.PageInfo;

public class BoardDao {
	public int selectListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("boardMapper.selectListCount");
	}
	public ArrayList<Board> selectList(SqlSession sqlSession, PageInfo pi){
		// return sqlSession.selectList("boardMapper.selectList");
		/*
		 * 마이바티스에서는 페이징 처리를 위해 RowBounds라는 클래스를 제공한다.
		 * *offset : 전체 조회된 게시글에서 몇 개의 게시글을 건너 뛰고 조회할건지에 대한 값.
		 * 			 (즉, 조회를 시작할 행의 값)
		 * ex) boardLimit가 5일 경우
		 * 								offset(건너 뛸 숫자) 	|   Limit(조회할 숫자)
		 * currentPage : 1 => 1~5			0						5
		 * currentPAge : 2 => 6~10			5						5
		 * currentPage : 3 => 11~15			10						5
		 *  */
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*5;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		/*
		 * RowBounds를 객체로 넘겨야할 경우
		 * selectList메소드의 오버로딩된 형태 중 매개변수가 3개인 메소드를 사용해야한다
		 * 딱히 두번째 ㅐㅁ개변수 자리에 넘길 값이 없다면, null을 넘기기
		 * 
		 * */
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", null , rowBounds);
	}
	public int boardCount(SqlSession sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.boardCount",boardNo);
	}
	
	public Board boardDetailList(SqlSession sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.boardDetailList",boardNo);
	}
	
	public int selectSearchCount(SqlSession sqlSession, HashMap<String, String>map) {
		return sqlSession.selectOne("boardMapper.selectSearchCount",map);
	}
	
	public ArrayList<Board>selectSearchList(SqlSession sqlSession, HashMap<String, String>map, PageInfo pi){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("boardMapper.selectSearchList",map,rowBounds);
	}

}
