/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.76
 * Generated at: 2023-07-20 07:26:25 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.views.mypage;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import java.util.Date;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import main.java.member.model.vo.Member;
import main.java.mypage.model.vo.MyPage;
import java.time.LocalDate;
import java.text.SimpleDateFormat;

public final class MyPageReservStatus_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("com.google.gson.reflect.TypeToken");
    _jspx_imports_classes.add("java.util.Date");
    _jspx_imports_classes.add("com.google.gson.Gson");
    _jspx_imports_classes.add("java.time.LocalDate");
    _jspx_imports_classes.add("java.text.SimpleDateFormat");
    _jspx_imports_classes.add("main.java.member.model.vo.Member");
    _jspx_imports_classes.add("main.java.mypage.model.vo.MyPage");
    _jspx_imports_classes.add("java.util.ArrayList");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');

    String contextPath = request.getContextPath();

    Member loginUser = (Member) session.getAttribute("loginUser");
    String userId = loginUser.getUserId();
    String userName = loginUser.getUserName();

    ArrayList<MyPage> mreserv = (ArrayList<MyPage>) session.getAttribute("mreserv");
    
    
    System.out.println("view jsp mreserv : "+mreserv);
    MyPage firstReservation = null; // 첫 번째 예약 객체 선언

    // mreserv가 null이 아니고 비어 있지 않은 경우 첫 번째 예약 객체를 가져옴
    if (mreserv != null && !mreserv.isEmpty()) {
        firstReservation = mreserv.get(0);
    }

    Date reservationDate = null;
    String reservationTime = null;
    int userNum = 0;
    String productNo = null;
    Long reservationNo = null;
	String reservationStatus = null;
	String paymentStatus = null;
	String className = null;

    // 첫 번째 예약 객체가 null이 아닌 경우 변수에 값을 할당
    if (firstReservation != null) {
        reservationDate = firstReservation.getReservationDate();
        reservationTime = firstReservation.getReservationTime();
        userNum = firstReservation.getUserNum();
        productNo = firstReservation.getProductNo();
        reservationNo = firstReservation.getReservationNo();
        reservationStatus = firstReservation.getReservationStatus();
        paymentStatus = firstReservation.getPaymentStatus();
        className = firstReservation.getClassName();
    }
    

    ArrayList<MyPage> myReservList = new ArrayList<>();
    if (mreserv != null) {
        for (MyPage r : mreserv) {
            if (r.getUserId().equals(userId) && userId.equals((String) session.getAttribute("userId"))) {
                myReservList.add(r);
            }
        }
    }

    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");



      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head><script type=\"text/javascript\" src=\"/___vscode_livepreview_injected_script\"></script>\r\n");
      out.write("    <title>MyPageMain</title>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("\r\n");
      out.write("    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js\"></script>\r\n");
      out.write("    <script>\r\n");
      out.write("        const contextPath = \"");
      out.print( request.getContextPath() );
      out.write("\";\r\n");
      out.write("    </script>\r\n");
      out.write("\r\n");
      out.write("    <link rel=\"apple-touch-icon\" href=\"");
      out.print(contextPath );
      out.write("/assets/img/apple-icon.png\">\r\n");
      out.write("    <link rel=\"shortcut icon\" type=\"image/x-icon\" href=\"");
      out.print(contextPath );
      out.write("/assets/img/favicon.ico\">\r\n");
      out.write("\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.print(contextPath );
      out.write("/assets/css/user-header.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.print(contextPath );
      out.write("/assets/css/mypage_main.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.print(contextPath );
      out.write("/assets/css/bootstrap.min.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.print(contextPath );
      out.write("/assets/css/templatemo.css\">\r\n");
      out.write("\r\n");
      out.write("    <!-- Load fonts style after rendering the layout styles -->\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.print(contextPath );
      out.write("/assets/css/fontawesome.min.css\">\r\n");
      out.write("    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js\"></script>\r\n");
      out.write("    <script>\r\n");
      out.write("        const userId = \"");
      out.print(userId);
      out.write("\"; // 사용자의 userId\r\n");
      out.write("        function getReservationData() {\r\n");
      out.write("            $.ajax({\r\n");
      out.write("                type : \"post\",\r\n");
      out.write("                url : '");
      out.print(contextPath);
      out.write("/resrvstatus.me', // 요청을 보낼 서블릿 경로\r\n");
      out.write("                data : {\"userId\" : userId},\r\n");
      out.write("                success : function(data) {\r\n");
      out.write("                	console.log(\"요청 성공: \" + data);\r\n");
      out.write("                	sessionStorage.setItem(\"mreserv\", data);\r\n");
      out.write("                },\r\n");
      out.write("                error : function(xhr, status, error) {\r\n");
      out.write("                    console.log(\"Ajax 요청 에러: \" + error);\r\n");
      out.write("                }\r\n");
      out.write("            });\r\n");
      out.write("        }\r\n");
      out.write("        // 페이지 로드 시 Ajax 요청 실행\r\n");
      out.write("        $(document).ready(function() {\r\n");
      out.write("            getReservationData();\r\n");
      out.write("        });\r\n");
      out.write("    </script>\r\n");
      out.write("  \r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("	<script>\r\n");
      out.write("			const msg = \"");
      out.print( (String)session.getAttribute("alertMsg") );
      out.write("\";\r\n");
      out.write("			if(msg != \"null\"){\r\n");
      out.write("				alert(msg);\r\n");
      out.write("				// 알림창을 띄워준 후 session에 담긴 해당 메세지는 지워줘야한다.\r\n");
      out.write("				// 안그럼, menubar.jsp가 로딩될때마다 항상 메세지가 뜰것..\r\n");
      out.write("				");
 session.removeAttribute("alertMsg"); 
      out.write("\r\n");
      out.write("			}\r\n");
      out.write("	</script>\r\n");
      out.write("  	   <!-- Header -->\r\n");
      out.write("   <nav class=\"navbar navbar-expand-lg navbar-light shadow main_nav_all admin_header\">\r\n");
      out.write("    <div class=\"container d-flex justify-content-between align-items-center\">\r\n");
      out.write("																			<!-- 여기에 메인페이지로 가는 길 -->\r\n");
      out.write("        <a class=\"navbar-brand text-success logo h1 align-self-center\" href=\"#\">\r\n");
      out.write("            <img src=\"/TimeForMaker/assets/img/메인로고.png\" class=\"main_logo\">\r\n");
      out.write("        </a>\r\n");
      out.write("\r\n");
      out.write("        <button class=\"navbar-toggler border-0\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#templatemo_main_nav\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\r\n");
      out.write("            <span class=\"navbar-toggler-icon\"></span>\r\n");
      out.write("        </button>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between\" id=\"templatemo_main_nav\">\r\n");
      out.write("            <div class=\"flex-fill\">                \r\n");
      out.write("                 <ul class=\"nav justify-content-end\">\r\n");
      out.write("                 \r\n");
      out.write("                 	");
if(loginUser == null){//로그인 안했을때 실행부분
      out.write("\r\n");
      out.write("	                	<li class=\"nav-item\">\r\n");
      out.write("	                        <a class=\"nav-link\" href=\"");
      out.print( contextPath );
      out.write("/views/member/LoginMain.jsp\">로그인</a>\r\n");
      out.write("	                    </li>\r\n");
      out.write("	                    <li class=\"nav-item\">\r\n");
      out.write("	                        <a class=\"nav-link\" href=\"");
      out.print( contextPath );
      out.write("/views/member/SignUpCondition.jsp\">회원가입</a>\r\n");
      out.write("	                    </li>\r\n");
      out.write("	                     <li class=\"nav-item\">\r\n");
      out.write("	                        <a class=\"nav-link\" onclick=\"loginCheck();\" href=\"");
      out.print( contextPath );
      out.write("/views/mypage/MyPageEditInfo.jsp\" >고객센터</a>\r\n");
      out.write("	                    </li>\r\n");
      out.write("	                    \r\n");
      out.write("                    ");
}else{ //로그인했을때
      out.write("\r\n");
      out.write("	                    <li class=\"nav-item\">\r\n");
      out.write("	                        <a class=\"nav-link\" href=\"");
      out.print(contextPath );
      out.write("/Logout.me\">로그아웃</a>\r\n");
      out.write("	                    </li>\r\n");
      out.write("	                     <li class=\"nav-item\">\r\n");
      out.write("	                        <a class=\"nav-link\" href=\"");
      out.print( contextPath );
      out.write("/views/mypage/MyPageEditInfo.jsp\">고객센터</a>\r\n");
      out.write("	                    </li>\r\n");
      out.write("       				");
} 
      out.write("\r\n");
      out.write("                 </ul>                   \r\n");
      out.write("            </div>\r\n");
      out.write("       		\r\n");
      out.write("             <div class=\"navbar align-self-center d-flex login_check\">\r\n");
      out.write("             	<a class=\"nav-icon d-none d-lg-inline login_check\" href=\"#\">\r\n");
      out.write("			           <i class=\"fa fa-fw fa-search text-dark mr-2\"></i>\r\n");
      out.write("			      </a>\r\n");
      out.write("			      <a class=\"nav-icon position-relative text-decoration-none login_check\" href=\"");
      out.print( contextPath );
      out.write("/views/mypage/MyPageMain.jsp\" onclick=\"handleUserLink();\">\r\n");
      out.write("			           <i class=\"fa fa-fw fa-user text-dark mr-3\"></i>\r\n");
      out.write("	              </a>          \r\n");
      out.write("		     </div>\r\n");
      out.write("		      \r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("  		 	");
if(loginUser != null){//로그인 했을때 실행부분
      out.write("\r\n");
      out.write("				    ");
String managerType =loginUser.getManagerType(); 
      out.write("\r\n");
      out.write("	    			");
if(managerType.equals("M")){ 
      out.write("      			\r\n");
      out.write("				    	<div class=\" main_adminbar \">\r\n");
      out.write("				            <div class=\"main_admin_menu\">\r\n");
      out.write("				                <li class=\"main_admin_li\">\r\n");
      out.write("				                    <a class=\"main_admin_link\" href=\"");
      out.print( contextPath );
      out.write("/product.pd\">상품관리</a>\r\n");
      out.write("				                </li>\r\n");
      out.write("				                <li class=\"main_admin_li\">\r\n");
      out.write("				                    <a class=\"main_admin_link\" href=\"");
      out.print( contextPath );
      out.write("/reserve.rs\">예약관리</a>\r\n");
      out.write("				                </li>\r\n");
      out.write("				                <li class=\"main_admin_li\">\r\n");
      out.write("				                    <a class=\"main_admin_link\" href=\"");
      out.print(contextPath );
      out.write("/list.me\">회원관리</a>\r\n");
      out.write("				                </li>\r\n");
      out.write("				                <li class=\"main_admin_li\">\r\n");
      out.write("				                    <a class=\"main_admin_link\" href=\"");
      out.print( contextPath );
      out.write("/notice.nt\">고객센터관리</a>\r\n");
      out.write("				                </li>\r\n");
      out.write("				            </div>\r\n");
      out.write("				        </div>\r\n");
      out.write("				  ");
} 
      out.write("\r\n");
      out.write("			");
} 
      out.write("  \r\n");
      out.write("</nav>\r\n");
      out.write("	\r\n");
      out.write("<!-- Close Header -->\r\n");
      out.write("\r\n");
      out.write("	<!-- start body -->\r\n");
      out.write("    \r\n");
      out.write("    <div class=\"mypage-main-wrapper\">\r\n");
      out.write("        <!-- 마이페이지 왼쪽 사이드, 시작 -->\r\n");
      out.write("        <div class=\"mypage-main-sidemenu\">\r\n");
      out.write("            <div class=\"mypage-sidemenu-title\">\r\n");
      out.write("                <h5>마이페이지</h5>\r\n");
      out.write("                <span><a href=\"");
      out.print( contextPath);
      out.write("/views/mypageView/mypage/MyPageMain.jsp\">나의 예약</a></span><br>\r\n");
      out.write("                <span><a href=\"");
      out.print( contextPath);
      out.write("/views/mypageView/mypage/MyPageEditInfo.jsp\">내 정보 수정</a></span><br>\r\n");
      out.write("            ");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"mypage-sidemenu-title\">\r\n");
      out.write("                <h5>고객센터</h5>\r\n");
      out.write("                <span><a href=\"\">공지사항</a></span><br>\r\n");
      out.write("                <span><a href=\"\">1:1문의</a></span><br>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("        <!-- 마이페이지 왼쪽 사이드, 끝 -->\r\n");
      out.write("\r\n");
      out.write("        <!-- 마이페이지 중앙 몸덩어리 시작-->\r\n");
      out.write("        <div class=\"mypage-main-container\">\r\n");
      out.write("            <!-- 마이페이지 프로필 시작-->\r\n");
      out.write("            <div class=\"mypage-profile\">\r\n");
      out.write("                <img class=\"mypage-profile-image\" src=\"");
      out.print( contextPath);
      out.write("/assets/img/마이페이지프로필사진1.png\" alt=\"프로필 사진\">\r\n");
      out.write("                <div class=\"mypage-profile-content\">\r\n");
      out.write("                    <h5>안녕하세요</h5>\r\n");
      out.write("                    <span>");
      out.print(userName );
      out.write("님 <span>😊</span></span>\r\n");
      out.write("                </div>\r\n");
      out.write("               \r\n");
      out.write("            </div>\r\n");
      out.write("             <!-- 마이페이지 프로필 끝-->\r\n");
      out.write("\r\n");
      out.write("             <!-- 마이페이지 메뉴바 시작-->\r\n");
      out.write("             <div class=\"mypage-main-list\">\r\n");
      out.write("                <div class=\"mypage-list-title\">\r\n");
      out.write("                    <div class=\"mypage-list-menu\"><a href=\"");
      out.print( contextPath);
      out.write("/views/mypage/MyPageMain.jsp\">방문 예정</a>\r\n");
      out.write("                        <div class=\"mypage-list2-line1\"></div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"mypage-list-menu\"><a href=\"");
      out.print( contextPath);
      out.write("/views/mypage/MyPageReservStatus.jsp\">나의 예약</a>\r\n");
      out.write("                        <div class=\"mypage-list2-line2\"></div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"mypage-list-menu\"><a href=\"");
      out.print( contextPath);
      out.write("/views/mypage/MyPageEditInfo.jsp\">내 정보 수정</a>\r\n");
      out.write("                        <div class=\"mypage-list2-line3\"></div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("            </div>\r\n");
      out.write("            <!-- 마이페이지 메뉴바 끝-->\r\n");
      out.write("			<!-- 예약 결제 리스트 시작-->\r\n");
      out.write("			<div class=\"mypage-appointment-list-wrapper\">\r\n");
      out.write("				<div class=\"mypage-appointment-list-container\">\r\n");
      out.write("					<span><h4>예약 및 결제 현황</h4></span>\r\n");
      out.write("					");
 if(mreserv != null){ 
      out.write("\r\n");
      out.write("						");
 for(int i = 0; i<mreserv.size(); i++){ 
      out.write("\r\n");
      out.write("					<div class=\"mypage-appointment-list\">\r\n");
      out.write("						<div class=\"mypage-appointment-list-img\" onclick=\"location.href='");
      out.print(contextPath);
      out.write("/detail.product?pno=");
      out.print(mreserv.get(i).getProductNo());
      out.write("'\" >\r\n");
      out.write("							<img src=\"");
      out.print(contextPath );
      out.print( mreserv.get(i).getFileSavePath() );
      out.print( mreserv.get(i).getFileName());
      out.write("\">\r\n");
      out.write("						</div>\r\n");
      out.write("						<div class=\"mypage-appointment-text-container\">\r\n");
      out.write("							<span class=\"mypage-appointment-list-title\" onclick=\"location.href='");
      out.print(contextPath);
      out.write("/detail.product?pno=");
      out.print(mreserv.get(i).getProductNo());
      out.write('\'');
      out.write('"');
      out.write('>');
      out.print( mreserv.get(i).getClassName() );
      out.write("</span>\r\n");
      out.write("							<br>\r\n");
      out.write("							<span class=\"mypage-appointment-list-keyword\">");
      out.print( mreserv.get(i).getClassKeyword() );
      out.write("</span> \r\n");
      out.write("							<script>\r\n");
      out.write("								 ");
 if(mreserv.get(i).getPaymentStatus().equals("결제대기")) { 
      out.write("\r\n");
      out.write("								 	document.write('<span class=\"mypage-reserv-status\" style=\"color: green;\">");
      out.print( mreserv.get(i).getPaymentStatus() );
      out.write("</span>');\r\n");
      out.write("									");
}else{ 
      out.write("\r\n");
      out.write("										document.write('<span class=\"mypage-reserv-status\" style=\"color: green;\">");
      out.print( mreserv.get(i).getReservationStatus() );
      out.write("</span>');\r\n");
      out.write("	                                ");
} 
      out.write("\r\n");
      out.write("	                        </script>        \r\n");
      out.write("							<br> \r\n");
      out.write("								<span class=\"mypage-appointment-list-time\">");
      out.print( mreserv.get(i).getReservationDate() );
      out.write("&ensp;");
      out.print( mreserv.get(i).getReservationTime() );
      out.write(" </span> &ensp;\r\n");
      out.write("								<span class=\"mypage-appointment-list-rpeople\"> ");
      out.print( mreserv.get(i).getUserNum() );
      out.write("명\r\n");
      out.write("							</span>\r\n");
      out.write("						</div>\r\n");
      out.write("							<script>\r\n");
      out.write("						        ");
 if(mreserv.get(i).getPaymentStatus().equals("결제대기")) { 
      out.write("\r\n");
      out.write("						            document.write('<button class=\"mypage-btn-payment\" style=\"margin:3px 3px 3px 150px;\" onclick=\"mypage_payment();\">결제</button>');\r\n");
      out.write("						        ");
 } else { 
      out.write("\r\n");
      out.write("						            document.write('<button class=\"mypage-btn-cancel\" style=\"margin:3px 3px 3px 150px;\" onclick=\"mypage_delete();\">예약취소</button>');\r\n");
      out.write("						        ");
 } 
      out.write("\r\n");
      out.write("						    </script>\r\n");
      out.write("					</div>\r\n");
      out.write("							\r\n");
      out.write("					");
 } 
      out.write("\r\n");
      out.write("					");
 session.removeAttribute("mreserv"); 
      out.write("\r\n");
      out.write("				</div>\r\n");
      out.write("			");
 } 
      out.write("\r\n");
      out.write("			</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                \r\n");
      out.write("                 <!-- 결제 취소 모달창 시작-->\r\n");
      out.write("                 <div class=\"mypage_delete_more\">\r\n");
      out.write("                    <div class=\"mypage_delete_more_check\"><br>\r\n");
      out.write("                        <b>예약을 취소합니까?</b><br>\r\n");
      out.write("                        <button class=\"mypage_delete_more_check_yes\" onclick=\"mypage_delete_more_check_yes();\">예</button>\r\n");
      out.write("                        <button class=\"mypage_delete_more_check_no\" onclick=\"mypage_delete_more_check_no();\">아니요</button>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                 <!-- 결제 취소 모달창 끝-->\r\n");
      out.write("\r\n");
      out.write("                <!-- 결제 모달창 시작-->\r\n");
      out.write("                <div class=\"mypage_payment_more\">\r\n");
      out.write("                    <div class=\"mypage_payment_more_check\"><br>\r\n");
      out.write("                        <b>결제를 진행합니까?</b><br>\r\n");
      out.write("                        <button class=\"mypage_payment_more_check_yes\" onclick=\"mypage_payment_more_check_yes();\">예</button>\r\n");
      out.write("                        <button class=\"mypage_payment_more_check_no\" onclick=\"mypage_payment_more_check_no();\">아니요</button>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                 <!-- 결제 모달창 끝-->\r\n");
      out.write("                <!-- 완료한 클래스 모달창 시작-->\r\n");
      out.write("                <div class=\"mypage_details_more\">\r\n");
      out.write("                    <div class=\"mypage_details_more_check\"><br>\r\n");
      out.write("                        <b>상세 결제 내역</b>\r\n");
      out.write("                        <div style=\"text-align: start; margin: 50px 30px 0 ;\">\r\n");
      out.write("                        <p>예약번호 : AA3D6SF5FAQ</p> \r\n");
      out.write("                        <P>성함 　　: 김아무개</P>\r\n");
      out.write("                        <P>클래스명 : 나만의 수제 운동화 만들기</P>\r\n");
      out.write("                        <P>결제일시 : 2023-07-07/17:30</P>\r\n");
      out.write("                        <p>결제금액 : 70,000 원</p>\r\n");
      out.write("                        <br>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        \r\n");
      out.write("                        <button class=\"mypage_details_more_check_yes\" onclick=\"mypage_details_more_check_yes();\">확인</button>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <!-- 완료한 클래스 모달창 끝-->\r\n");
      out.write("\r\n");
      out.write("                <!-- 회원 탈퇴 모달창 시작 -->\r\n");
      out.write("                <div class=\"mypage_Withdrawal_more\">\r\n");
      out.write("                    <div class=\"mypage_Withdrawal_more_check\"><br>\r\n");
      out.write("                        <b>정말 회원 탈퇴하시나요?</b><br>\r\n");
      out.write("                        <span class=\"mypage_Withdrawal_contents\">\r\n");
      out.write("                            <h6>회원 탈퇴 전, 유의사항을 확인해 주시기 바랍니다.</h6>\r\n");
      out.write("                            <p>- 회원 탈퇴시 회원전용 웹 서비스 이용이 블가합니다.<br>- 거래정보가 있는 경우, 전자상거래 등에서의 소비자 보호에 관한 법률에따라 계약 또는 청약 청회에 관한 기록, 대금결제 및 재화 등의  기록은 5년동안 보존됩니다.<br>- 이미 결제가 완료된 건은 탈퇴로 취소되지 않습니다.</p>\r\n");
      out.write("                        </span>\r\n");
      out.write("                        <button class=\"mypage_Withdrawal_more_check_yes\" onclick=\"mypage_Withdrawal_more_check_yes();\">예</button>\r\n");
      out.write("                        <button class=\"mypage_Withdrawal_more_check_no\" onclick=\"mypage_Withdrawal_more_check_no();\">아니요</button>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <!-- 회원 탈퇴 안내 성공 모달창 -->\r\n");
      out.write("\r\n");
      out.write("                <div class=\"mypage_Withdrawal_final\">\r\n");
      out.write("                    <div class=\"mypage_Withdrawal_final_check\"><br>\r\n");
      out.write("                        <b>정말 회원 탈퇴하시나요?</b><br>\r\n");
      out.write("                        <span class=\"mypage_Withdrawal_contents\">\r\n");
      out.write("                            <img src=\"");
      out.print(contextPath );
      out.write("/assets/img/탈퇴아이콘-removebg-preview.png\" width=\"100px\" height=\"100px\" style=\"margin-bottom: 15px;\">\r\n");
      out.write("                            <h3>회원 탈퇴 성공</h3>\r\n");
      out.write("                            <h6>회원 탈퇴가 완료되었습니다.</h6>\r\n");
      out.write("                        </span>\r\n");
      out.write("                        <button class=\"mypage_Withdrawal_final_check_yes\" onclick=\"mypage_Withdrawal_final_check_yes();\">로그인 페이지로 돌아가기</button>\r\n");
      out.write("    \r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("        <!-- 마이페이지 중앙 몸덩어리 끝-->\r\n");
      out.write("\r\n");
      out.write("   \r\n");
      out.write("  \r\n");
      out.write("\r\n");
      out.write("    \r\n");
      out.write("    <!-- close body -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <!-- Start Footer -->\r\n");
      out.write("    <footer class=\"main_footer\" id=\"tempaltemo_footer\">\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <div class=\"row\">\r\n");
      out.write("\r\n");
      out.write("                <div class=\"col-md-4 pt-5\">\r\n");
      out.write("                    <img src=\"assets/img/메인로고.png\" class=\"main_logo\">\r\n");
      out.write("                    <ul class=\"list-unstyled text-light footer-link-list\">\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <i class=\"fas fa-map-marker-alt fa-fw\"></i>\r\n");
      out.write("                            서울특별시 강남구 테헤란로14길6\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <i class=\"fa fa-phone fa-fw\"></i>\r\n");
      out.write("                            <a class=\"text-decoration-none\" href=\"tel:010-020-0340\">010-020-0340</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <i class=\"fa fa-envelope fa-fw\"></i>\r\n");
      out.write("                            <a class=\"text-decoration-none\" href=\"mailto:info@company.com\">info@company.com</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("               \r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("           \r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"w-100 py-3\">\r\n");
      out.write("            <div class=\"container\">\r\n");
      out.write("                <div class=\"row pt-2\">\r\n");
      out.write("                    <div class=\"col-12\">\r\n");
      out.write("                        <p class=\"text-left\">\r\n");
      out.write("                            &copy; 2023 떡잎방범대 박수진 박지현 이아인 임재린 황슬기\r\n");
      out.write("                        </p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("    </footer>\r\n");
      out.write("    <!-- End Footer -->\r\n");
      out.write("\r\n");
      out.write("  <!-- Start Script -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("  \r\n");
      out.write("\r\n");
      out.write("  <script src=\"");
      out.print(contextPath );
      out.write("/assets/js/mypage_withdrawal_modal.js\"></script>\r\n");
      out.write("	<script src=\"");
      out.print(contextPath );
      out.write("/assets/js/jquery-1.11.0.min.js\"></script>\r\n");
      out.write("	<script src=\"");
      out.print(contextPath );
      out.write("/assets/js/jquery-migrate-1.2.1.min.js\"></script>\r\n");
      out.write("	<script src=\"");
      out.print(contextPath );
      out.write("/assets/js/bootstrap.bundle.min.js\"></script>\r\n");
      out.write("	<script src=\"");
      out.print(contextPath );
      out.write("/assets/js/templatemo.js\"></script>\r\n");
      out.write("\r\n");
      out.write("  <!-- End Script -->\r\n");
      out.write("  \r\n");
      out.write("  \r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
