<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	String contextPath = request.getContextPath();

	Member loginUser = (Member) session.getAttribute("loginUser");
	// 로그인전이라면 loginUser에는 null값이 담겨있을 것이고
	// 로그인성공 후라면, loginUser에는 로그인한 회원의 정보가 담긴 Member객체가 들어가 있을것.
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>header+footer</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="shortcut icon" type="image/x-icon" href="/TimeForMaker/assets/img/TFM_icon.png">

    <link rel="stylesheet" href="/TimeForMaker/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/TimeForMaker/assets/css/templatemo.css">
    <link rel="stylesheet" href="/TimeForMaker/assets/css/user-header.css">
    <link rel="stylesheet" href="/TimeForMaker/assets/css/admin-header.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="/TimeForMaker/assets/css/fontawesome.min.css">
    

</head>

<body>
	<%
	   	String userId=null;
	    //로그인 한 사용자들이라면 userId에 값 담김
	   if(session.getAttribute("userId")!=null){
		   userId=(String)session.getAttribute("userId");
	   }
   %>
   <%if(loginUser == null){//로그인 안했을때 실행부분%>
   <!-- Header -->
   <nav class="navbar navbar-expand-lg navbar-light shadow main_nav_all">
    <div class="container d-flex justify-content-between align-items-center">
																			<!-- 여기에 메인페이지로 가는 길 -->
        <a class="navbar-brand text-success logo h1 align-self-center" href="<%=contextPath %>">
            <img src="/TimeForMaker/assets/img/메인로고.png" class="main_logo">
        </a>

        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
            <div class="flex-fill">                
             
                 <ul class="nav justify-content-end">
	                	<li class="nav-item">
	                        <a class="nav-link" href="<%=contextPath %>">로그인</a>
	                    </li>
	                    <li class="nav-item">
	                        <a class="nav-link" href="<%=contextPath %>">회원가입</a>
	                    </li>
	                     <li class="nav-item">
	                        <a class="nav-link" href="#" onclick="loginCheck();">고객센터</a>
	                    </li>
	                   
                 </ul>                   
            </div>
       		<div class="navbar align-self-center d-flex">
			      <a class="nav-icon d-none d-lg-inline" href="#" onclick="loginCheck();" data-bs-toggle="modal" data-bs-target="#templatemo_search">
			           <i class="fa fa-fw fa-search text-dark mr-2"></i>
			      </a>
			      <a class="nav-icon position-relative text-decoration-none" href="#" onclick="loginCheck();">
			           <i class="fa fa-fw fa-user text-dark mr-3"></i>
	              </a>          
		     </div>
		      <script>
					function loginCheck() {
				        alert("로그인 후 이용 가능합니다!");
				    }
			  e</script>
        </div>

    </div>
</nav>
	
<!-- Close Header -->
 <%}else{ //로그인했을때%>
 
 
  <!-- Header -->
   <nav class="navbar navbar-expand-lg navbar-light shadow main_nav_all">
    <div class="container d-flex justify-content-between align-items-center">
																			
        <a class="navbar-brand text-success logo h1 align-self-center" href="#">
            <img src="/TimeForMaker/assets/img/메인로고.png" class="main_logo">
        </a>

        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
            <div class="flex-fill">                
             
                 <ul class="nav justify-content-end">
	                    <li class="nav-item">
	                        <a class="nav-link" href="#">로그아웃</a>
	                    </li>
	                     <li class="nav-item">
	                        <a class="nav-link" href="">고객센터</a>
	                    </li>
                   
                 </ul>                   
            </div>
       		<div class="navbar align-self-center d-flex">
			      <a class="nav-icon d-none d-lg-inline" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
			           <i class="fa fa-fw fa-search text-dark mr-2"></i>
			      </a>
			      <a class="nav-icon position-relative text-decoration-none" href="#">
			           <i class="fa fa-fw fa-user text-dark mr-3"></i>
	              </a>          
		     </div>
		      
        </div>

    </div>
    <%String managerType =loginUser.getManagerType(); %>
    <%if(managerType.equals("M")){ %>
    
    	<div class="main_adminbar">
            <div class="main_admin_menu">
                <li class="main_admin_li">
                    <a class="main_admin_link" href="#">상품관리</a>
                </li>
                <li class="main_admin_li">
                    <a class="main_admin_link" href="#">예약관리</a>
                </li>
                <li class="main_admin_li">
                    <a class="main_admin_link" href="#">회원관리</a>
                </li>
                <li class="main_admin_li">
                    <a class="main_admin_link" href="#">고객센터관리</a>
                </li>
            </div>
        </div>
    <%} %>
</nav>
 
<!-- Modal 헤드에 검색 누르면 나오는 모달  -->
<div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="w-100 pt-1 mb-5 text-right">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form action="" method="get" class="modal-content modal-body border-0 p-0">
            <div class="input-group mb-2">
                <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="클래스 이름만 검색해주세요..">
                <button type="submit" class="input-group-text bg-success text-light">
                    <i class="fa fa-fw fa-search text-white"></i>
                </button>
            </div>
        </form>
    </div>
</div>

  <%} %>     
       
       
       
       
    
   

    <!-- Start Script -->
    <script src="/TimeForMaker/assets/js/jquery-1.11.0.min.js"></script>
    <script src="/TimeForMaker/assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="/TimeForMaker/assets/js/bootstrap.bundle.min.js"></script>
    <script src="/TimeForMaker/assets/js/templatemo.js"></script>
    <!-- End Script -->
</body>

</html>