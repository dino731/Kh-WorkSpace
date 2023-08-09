package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Properties;

public class UserDAO {
	public UserDAO() {
		Properties prop = new Properties().getProperty("/test/JDBCTemplate.jsva");
	}
	public UserDTO UserDAO(String userNo) {
		PreparedStatement pstmt = PreparedStatement("KEY");
		Connction conn = getConnection();
		int result =0;
		UserDTO user = new UserDTO();
		
		pstmt = conn.getPreparedStatement(sql);
		pstmt.setUserNo(1 ,userNo);
		
		conn.executeQuery();

		if(userNo.next()) {
			UserDTO r = new UserDTO(
				r.getInt("userNo"),
				r.getString("userId"),
				r.getString("userName"),
				r.getInt("userAge")
				);
			user.add(r);
		}
		
		return user;
	}

}

<ENTRY KEY="KEY">
SELECT *
FORM TB_USER
WHERE USER_NO =?
</ENTRY>



