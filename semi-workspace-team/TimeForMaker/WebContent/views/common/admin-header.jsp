<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>admin_header</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="shortcut icon" type="image/x-icon" href="/TimeForMaker/assets/img/TFM_icon.png">

    <link rel="stylesheet" href="/TimeForMaker/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/TimeForMaker/assets/css/templatemo.css">
    <link rel="stylesheet" href="/TimeForMaker/assets/css/admin-header.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="/TimeForMaker/assets/css/fontawesome.min.css">

</head>

<body>
    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light shadow admin_header"><!--admin_header 관리자파트는 얘가 있어야함-->
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
                            <a class="nav-link" href="#">고객센터</a>
                        </li>
                    </ul>
                </div>
                <div class="navbar align-self-center d-flex">
                    <a class="nav-icon d-none d-lg-inline" href="#">
                        <i class="fa fa-fw fa-search text-dark mr-2"></i>
                    </a>
                    </a>
                    <a class="nav-icon position-relative text-decoration-none" href="#">
                        <i class="fa fa-fw fa-user text-dark mr-3"></i>
                    </a>
                </div>
            </div>

        </div>
        <div class="main_adminbar">
            <div class="main_admin_menu">
                <li class="main_admin_li">
                    <a class="main_admin_link" href="#">상품관리</a>
                </li>
                <li class="main_admin_li">
                    <a class="main_admin_link" href="#">예약관리</a>
                </li>
                <li class="main_admin_li">
                    <a class="main_admin_link" href="<%=contextPath %>/list.me">회원관리</a>
                </li>
                <li class="main_admin_li">
                    <a class="main_admin_link" href="#">고객센터관리</a>
                </li>
            </div>
        </div>
    </nav>
    <!-- Close Header -->

   


   
</body>

</html>