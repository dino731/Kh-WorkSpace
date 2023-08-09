<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        // Database connection setup
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "ADMIN", "ADMIN");
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        try {
//           이거 빠지면 한글 안됨 아주중요@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
            request.setCharacterEncoding("UTF-8");
            // 예약 정보 저장 쿼리 작성
            String query = "INSERT INTO RESERVATION (RESERVATION_NO, RESERVATION_DATE, RESERVATION_STATUS, RESERVATION_TIME, PAYMENT_STATUS, USER_NUM, USER_ID, PRODUCT_NO) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            // PreparedStatement 객체 생성
            pstmt = conn.prepareStatement(query);

            // 각 컬럼에 대한 값 설정
            pstmt.setInt(1, Integer.parseInt((request.getParameter("RESERVATION_NO"))));
            pstmt.setString(2, request.getParameter("RESERVATION_DATE"));
            pstmt.setString(3, request.getParameter("RESERVATION_STATUS"));
            pstmt.setString(4, request.getParameter("RESERVATION_TIME"));
            pstmt.setString(5, request.getParameter("PAYMENT_STATUS"));
            pstmt.setInt(6, Integer.parseInt(request.getParameter("USER_NUM")));
            pstmt.setString(7, request.getParameter("USER_ID"));
            pstmt.setInt(8, Integer.parseInt(request.getParameter("PRODUCT_NO")));

            // 쿼리 실행
            pstmt.executeUpdate();

            conn.commit();



        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // PreparedStatement와 Connection을 닫음
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
%>



</body>
</html>