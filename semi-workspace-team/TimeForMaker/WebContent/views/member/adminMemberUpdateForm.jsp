<%@ page import="java.util.ArrayList, member.model.vo.Member, common.model.vo.PageInfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* System.out.println("member에서 호출"); */
	
	//pageInfo pi = (PageInfo) request.getAttribute("pi");
	
	//ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list");
	
	//int currentPage = pi.getCurrentPage();
	//int startPage   = pi.getStartPage();
	//int endPage     = pi.getEndPage();
	//int maxPage     = pi.getMaxPage(); 
	
	Member me = (Member) session.getAttribute("me");
	//Member me = new Member();
	
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>memberUpdate</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="/TimeForMaker/assets/img/TFM_icon.png">

    <link rel="stylesheet" href="/TimeForMaker/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/TimeForMaker/assets/css/templatemo.css">

    <!--메인 css링크 (슬기)-->
    <link rel="stylesheet" href="/TimeForMaker/assets/css/admin-header.css"><!--유저 헤드+푸터 부분css-->
    <link rel="stylesheet" href="/TimeForMaker/assets/css/member.css"><!--이건 메인 바디부분 css-->

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="/TimeForMaker/assets/css/fontawesome.min.css">

</head>
<style>
    .ad_userUpdate{
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        box-sizing: border-box;
        border-radius: 10px;
        background-color: #FAF0E4;
        width: 100%;
        height: 440px;
        z-index: 9992;
        text-align: center;
    }
</style>
<body>
    <%@ include file="/views/common/admin-header.jsp" %>

    <div class="adminmemberupdate_all">
        <section class="container py-5 "> <!-- 컨테이너가 상단바에 맞춰서 중간 정렬-->
            <br>
            <form method="post" class="ad_userUpdate"  action="<%=contextPath %>/adminmemupdate.me">
                <br><br>
                <h4>회원 정보 수정</h4>
                <br>
                아이디&nbsp;&nbsp;&nbsp;&nbsp; <input  name = "userId" value=""> <br><br>
               
                이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="userName" value=""><br><br>
                
                닉네임&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="userNick" value=""><br><br>
         
                휴대전화&nbsp;<input type="text" name="phone" value="" placeholder="-없이 번호만입력"><br><br>

                
                
                
                
                <div class="ad_userUpdate_btn">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" class="ad_userUpdate_btn" style="width: 150px;">수정</button>&nbsp;&nbsp;
                
                </div>
            </form>

        </section>
	</div>
	
    <!-- Start Script -->
    <script src="/TimeForMaker/assets/js/jquery-1.11.0.min.js"></script>
    <script src="/TimeForMaker/assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="/TimeForMaker/assets/js/bootstrap.bundle.min.js"></script>
    <script src="/TimeForMaker/assets/js/templatemo.js"></script>
    <!-- End Script -->
</body>

</html>