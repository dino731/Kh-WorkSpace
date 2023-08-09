package edu.kh.test.user.model.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import edu.kh.test.user.model.vo.User;

public class UserDAO {
	
	
	public User userSearch(Connection conn, String userId){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		User m = null;
		String sql = "SELECT * FROM TB_USER WHERE USER_ID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
				
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new User(
						rset.getInt("USER_NO"),
						rset.getString("USER_ID"),
						rset.getString("USER_NAME"),
						rset.getInt("USER_AGE")
						);
			}
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return m;
	}

}
