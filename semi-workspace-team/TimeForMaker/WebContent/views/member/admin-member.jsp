<%@ page import="java.util.ArrayList, member.model.vo.Member, common.model.vo.PageInfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* System.out.println("member에서 호출"); */
	
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	
	ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage   = pi.getStartPage();
	int endPage     = pi.getEndPage();
	int maxPage     = pi.getMaxPage(); 
	
	//Member me = (Member) session.getAttribute("me");
	//Member me = new Member();
	
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>member</title>
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

<body>

<%@ include file="/views/common/admin-header.jsp" %>
   
    <div class="member_all">
        <section class="container py-5 "> <!-- 컨테이너가 상단바에 맞춰서 중간 정렬-->
            <br>
            
            <h4><i class="fa fa-fw fa-user"></i>회원관리</h4>
            <br>
            <div class="member_filter">
                <i class="fa fa-filter"></i>
                <select name="member_filter_aco" id="member_filter_aco">                 
                    <option value="user_id">아이디</option>
                    <option value="user_name">이름</option>
                    <option value="user_enroll">가입일</option>
                </select>&nbsp;
            </div>
            <div class="member_search">
                <form action="" method="" class="member_search_rap">
                    <div class="input-group member_search_area">
                        <input type="text" class="mem_search_text" id="inputMemberSeach" name="" placeholder="Search ...">
                        <button type="submit" class="bg-success text-light mem_search_btn">
                            <i class="fa fa-fw fa-search text-white"></i>
                        </button>
                    </div>
                </form>
            </div>
            <div class="member_info">
                <table class="member_table">
                    <thead>
                        <tr>
                            <th width="100">아이디</th>
                            <th width="70">이름</th>
                            <th width="70">닉네임</th>
                            <th width="100">휴대폰번호</th>
                            <th width="80">가입일</th>
                            <th width="80">정보수정일</th>
                            <th width="70">회원구분</th>
                            <th width="70">회원상태</th>
                            <th width="100">관리</th>
                        </tr>
                    </thead>
                    <tbody>
                    	
                    <% if(list.isEmpty()){ %>
                    	<tr>
                    		<td> 조회된 리스트가 없습니다.</td>
                    	</tr>      
                    <%}else{ %>
                    	<%for( Member m : list){ %>
                    	<tr>
                            <td><%=m.getUserId() %></td>
                            <td ><%=m.getUserName() %></td>
                            <td ><%=m.getUserNick() %></td>
                            <td ><%=m.getUserPhone() %></td>                            
                            <td><%=m.getUserEnroll() %></td>
                            <td><%=m.getUserModify() %></td>
                            <td><%=m.getManagerType() %></td>
                            <td><%=m.getUserType() %></td>
                            <td> 
                                <button class="member_modify" href="<%=contextPath %>/adminmemupdate.me">수정</button>
                                <button class="member_delete">탈퇴</button>
                            </td>
                        </tr>
                    	<%} %>
                    <%} %>
                      
                    </tbody>
                </table>
        
            </div>
        
        </section>
        <!--페이징 바-->
		<nav id="notice-recept-board-navi" aria-label="Page navigation">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link"
					href="<%=contextPath%>/list.me?currentPage=<%=currentPage - 1%>"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<%
					for (int p = startPage; p <= endPage; p++) {
				%>
				<li class="page-item notice-recept-page-clicked"><a
					class="page-link"
					href="<%=contextPath%>/list.me?currentPage=<%=p%>"><%=p%></a></li>
				<%
					}
				%>
				<li class="page-item"><a class="page-link" href="<%=contextPath %>/list.me?currentPage=<%= currentPage+1 %>"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>

		<!--페이징 끝-->

        
    
<!-- Start Footer -->
    <footer class="main_footer" id="tempaltemo_footer">
        <div class="container">
            <div class="row">

                <div class="col-md-4 pt-5">
                    <img src="/TimeForMaker/assets/img/메인로고.png" class="main_logo">
                    <ul class="list-unstyled text-light footer-link-list">
                        <li>
                            <i class="fas fa-map-marker-alt fa-fw"></i>
                            서울특별시 강남구 테헤란로14길6
                        </li>
                        <li>
                            <i class="fa fa-phone fa-fw"></i>
                            <a class="text-decoration-none" href="tel:010-020-0340">010-020-0340</a>
                        </li>
                        <li>
                            <i class="fa fa-envelope fa-fw"></i>
                            <a class="text-decoration-none" href="mailto:info@company.com">info@company.com</a>
                        </li>
                    </ul>
                </div>
            </div>

           
        </div>

        <div class="w-100 py-3">
            <div class="container">
                <div class="row pt-2">
                    <div class="col-12">
                        <p class="text-left">
                            &copy; 2023 떡잎방범대 박수진 박지현 이아인 임재린 황슬기
                        </p>
                    </div>
                </div>
            </div>
        </div>

    </footer>
    <!-- End Footer -->
    <!-- Start Script -->
    <script src="/TimeForMaker/assets/js/jquery-1.11.0.min.js"></script>
    <script src="/TimeForMaker/assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="/TimeForMaker/assets/js/bootstrap.bundle.min.js"></script>
    <script src="/TimeForMaker/assets/js/templatemo.js"></script>
    <!-- End Script -->
</body>

</html>