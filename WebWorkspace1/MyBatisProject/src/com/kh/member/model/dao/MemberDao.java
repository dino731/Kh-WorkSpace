package com.kh.member.model.dao;


import org.apache.ibatis.session.SqlSession;

import com.kh.member.model.vo.Member;

public class MemberDao {
	
	
//	public Member loginMember(Connection conn, String userId, String userPwd) {
//		
//		// Select문 실행예정 => ResultSet객체에 담아줘야함
//		Member m = null;
//		
//		PreparedStatement pstmt = null;
//		
//		ResultSet rset = null;
//		
//		String sql = prop.getProperty("loginMember");
//		
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			
//			pstmt.setString(1, userId);
//			pstmt.setString(2, userPwd);
//			
//			rset = pstmt.executeQuery();
//			
//			if(rset.next()) {
//				m = new Member(
//						rset.getInt("USER_NO"),
//						rset.getString("USER_ID"), 
//						rset.getString("USER_PWD"),
//						rset.getString("USER_NAME"),
//						rset.getString("PHONE"),
//						rset.getString("EMAIL"),
//						rset.getString("ADDRESS"),
//						rset.getString("INTEREST"),
//						rset.getDate("ENROLL_DATE"),
//						rset.getDate("MODIFY_DATE"),
//						rset.getString("STATUS")
//						);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(rset);
//			close(pstmt);
//		}
//		
//		return m;
//	}
//	
	public int insertMember(SqlSession sqlSession, Member m) {
	/* 
	 * sqlSession에서 제공하는 메소드를 통해서 sql문을 찾아서 실행하고 결과를 받아볼 수 있다.
	 * sqlSession.sql문 종류에 맞는 메소드("매퍼 파일의 namespace.해당sql문의 고유한id",sql실행시 필요한 객체);
	 * => 해당 sql문이 완성된 상태라면 두번째 매개 변수는 생략이 가능하다.
	 * */
	return sqlSession.insert("memberMapper.insertMember",m);
	}
	
	public Member loginMember(SqlSession sqlSession, Member m) {
		// selectOne 메소드 : 조회 결과가 없다면 null반환
		System.out.println("DAO :"+m);
		return sqlSession.selectOne("memberMapper.loginMember",m);
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
