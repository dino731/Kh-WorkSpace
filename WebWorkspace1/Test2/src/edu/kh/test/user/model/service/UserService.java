package edu.kh.test.user.model.service;

import java.sql.Connection;

import static common.JDBCTemplate.*;

import edu.kh.test.user.model.dao.UserDAO;
import edu.kh.test.user.model.vo.User;

public class UserService {
	
	
	public User userSearch(String userId) {
		Connection conn = getConnection();
		
		User m = new UserDAO().userSearch(conn, userId);

		close(conn);
		return m;
		
	}

}
