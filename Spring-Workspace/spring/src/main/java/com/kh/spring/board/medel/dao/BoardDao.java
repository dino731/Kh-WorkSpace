package com.kh.spring.board.medel.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.board.medel.vo.Attachment;
import com.kh.spring.board.medel.vo.Board;
import com.kh.spring.board.medel.vo.BoardExt;
import com.kh.spring.board.medel.vo.BoardType;

@Repository
public class BoardDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<BoardType> selectBoardTypeList(){
		return sqlSession.selectList("boardMapper.selectBoardTypeList");
	}
	
	public List<Board> selectList(int currentPage, Map<String, Object> paramMap){
		int offset = (currentPage -1)*5;
		int limit = 5;
		
		RowBounds rewBounds = new RowBounds(offset,limit);
		
		return sqlSession.selectList("boardMapper.selectList", paramMap, rewBounds);
	}
	
	public int selectListCount( Map<String, Object> paramMap) {
		return sqlSession.selectOne("boardMapper.selectListCount",paramMap);
	}
	
	public int insertBoard(Board b) {
		int result = 0;
		
		result = sqlSession.insert("boardMapper.insertBoard",b);
		if(result>0) {
			result = b.getBoardNo();
			// 게시글 삽입 성공시 selectkey태그를 사용하여 셋팅한 boarNo 값을 b에 담아줌
		}
		return result;
	}
	
	public int insertAttachment(Attachment attach) {
		return sqlSession.insert("boardMapper.insertAttachment",attach);
	}
	
	public int insertAttachment(List<Attachment>list) {
		return sqlSession.insert("boardMapper.insertAttachmentList",list);
	}
	
	public BoardExt selectBoard(int boardNo) {
		return sqlSession.selectOne("boardMapper.selectBoard",boardNo);
	}
	
	public int increaseCount(int bno) {
		return sqlSession.update("boardMapper.increaseCount",bno);
	}
	
	public Attachment selectAttachment(int fileNo) {
		return sqlSession.selectOne("boardMapper.selectAttachment", fileNo);
	}
	
	public int updateBoard(Board b) {
		return sqlSession.update("boardMapper.updateBoard",b);
	}
	public int deleteAttachment(Map<String, Object> map) {
		return sqlSession.
	}
	public int updateAttachment(Attachment at) {
		return sqlSession.update("boardMapper.updateAttachment",at);
	}
	
	public List<String> selectFileList(){
		return sqlSession.selectList("boardMapper.selectFileList");
	}
}