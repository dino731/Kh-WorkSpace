/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.76
 * Generated at: 2023-07-19 19:20:01 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.views.member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import main.java.member.model.vo.Member;

public final class SignUpUserInfo_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes.add("main.java.member.model.vo.Member");
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
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>SignUpUserInfo</title>\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("\r\n");
      out.write("  <link rel=\"apple-touch-icon\" href=\"");
      out.print(contextPath );
      out.write("/assets/img/apple-icon.png\">\r\n");
      out.write("  <link rel=\"shortcut icon\" type=\"image/x-icon\" href=\"");
      out.print(contextPath );
      out.write("/assets/img/favicon.ico\">\r\n");
      out.write("\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"");
      out.print(contextPath );
      out.write("/assets/css/user-header.css\">\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"");
      out.print(contextPath );
      out.write("/assets/css/mypage_signup.css\">\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"");
      out.print(contextPath );
      out.write("/assets/css/bootstrap.min.css\">\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"");
      out.print(contextPath );
      out.write("/assets/css/templatemo.css\">\r\n");
      out.write("\r\n");
      out.write("  <!-- Load fonts style after rendering the layout styles -->\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap\">\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"");
      out.print(contextPath );
      out.write("/assets/css/fontawesome.min.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("       <!-- Header -->\r\n");
      out.write("   <nav class=\"navbar navbar-expand-lg navbar-light shadow main_nav_all\">\r\n");
      out.write("    <div class=\"container d-flex justify-content-between align-items-center\">\r\n");
      out.write("\r\n");
      out.write("        <a class=\"navbar-brand text-success logo h1 align-self-center\" href=\"main.html\">\r\n");
      out.write("            <img src=\"");
      out.print(contextPath );
      out.write("/assets/img/메인로고.png\" class=\"main_logo\">\r\n");
      out.write("        </a>\r\n");
      out.write("\r\n");
      out.write("        <button class=\"navbar-toggler border-0\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#templatemo_main_nav\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\r\n");
      out.write("            <span class=\"navbar-toggler-icon\"></span>\r\n");
      out.write("        </button>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between\" id=\"templatemo_main_nav\">\r\n");
      out.write("            <div class=\"flex-fill\">\r\n");
      out.write("                <ul class=\"nav justify-content-end\">\r\n");
      out.write("                    <li class=\"nav-item\">\r\n");
      out.write("                        <a class=\"nav-link\" href=\"LoginMain.jsp\">로그인</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li class=\"nav-item\">\r\n");
      out.write("                        <a class=\"nav-link\" href=\"SignUpCondition.jsp\">회원가입</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li class=\"nav-item\">\r\n");
      out.write("                        <a class=\"nav-link\" href=\"\">고객센터</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"navbar align-self-center d-flex\">\r\n");
      out.write("                <a class=\"nav-icon d-none d-lg-inline\" href=\"#\" data-bs-toggle=\"modal\" data-bs-target=\"#templatemo_search\">\r\n");
      out.write("                    <i class=\"fa fa-fw fa-search text-dark mr-2\"></i>\r\n");
      out.write("                </a>\r\n");
      out.write("                <a class=\"nav-icon position-relative text-decoration-none\" href=\"#\">\r\n");
      out.write("                    <i class=\"fa fa-fw fa-user text-dark mr-3\"></i>\r\n");
      out.write("                </a>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("</nav>\r\n");
      out.write("<!-- Close Header -->\r\n");
      out.write("\r\n");
      out.write("<!-- Modal 헤드에 검색 누르면 나오는 모달  -->\r\n");
      out.write("<div class=\"modal fade bg-white\" id=\"templatemo_search\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\r\n");
      out.write("    <div class=\"modal-dialog modal-lg\" role=\"document\">\r\n");
      out.write("        <div class=\"w-100 pt-1 mb-5 text-right\">\r\n");
      out.write("            <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>\r\n");
      out.write("        </div>\r\n");
      out.write("        <form action=\"\" method=\"get\" class=\"modal-content modal-body border-0 p-0\">\r\n");
      out.write("            <div class=\"input-group mb-2\">\r\n");
      out.write("                <input type=\"text\" class=\"form-control\" id=\"inputModalSearch\" name=\"q\" placeholder=\"Search ...\">\r\n");
      out.write("                <button type=\"submit\" class=\"input-group-text bg-success text-light\">\r\n");
      out.write("                    <i class=\"fa fa-fw fa-search text-white\"></i>\r\n");
      out.write("                </button>\r\n");
      out.write("            </div>\r\n");
      out.write("        </form>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("    <!-- start body -->\r\n");
      out.write("    <div class=\"user-login-wrapper\">\r\n");
      out.write("      <div class=\"user-login-container\">\r\n");
      out.write("        <ul class=\"nav justify-content-center\">\r\n");
      out.write("          <li class=\"nav-item\">\r\n");
      out.write("            <a class=\"nav-link active\" aria-current=\"page\" href=\"#\" > <span style=\"color:gray; font-size: 12px;\">________________________　　　쉽고 간단한 로그인 및 회원 가입　　　________________________</span></a>\r\n");
      out.write("          </li>\r\n");
      out.write("        </ul>\r\n");
      out.write("        <div class=\"user-login-chapter\">\r\n");
      out.write("          <span class=\"user-login3-chap1\">\r\n");
      out.write("           1\r\n");
      out.write("          </span>\r\n");
      out.write("          <span style=\"color: gray; font-size: 15px;\">ㅡ</span>\r\n");
      out.write("          <span class=\"user-login3-chap2\">\r\n");
      out.write("            2\r\n");
      out.write("          </span>\r\n");
      out.write("          <span style=\"color: gray; font-size: 15px;\">ㅡ</span>\r\n");
      out.write("          <span class=\"user-login3-chap3\">\r\n");
      out.write("            3\r\n");
      out.write("          </span>\r\n");
      out.write("        </div>\r\n");
      out.write("        <h5 style=\"margin-top: 15px;\">가입 정보 입력하기</h5>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"user-login-condition-wapper\">\r\n");
      out.write("        \r\n");
      out.write("          <form class=\"user-login-condition\" action=\"");
      out.print( contextPath );
      out.write("/insert.me\" method=\"post\">\r\n");
      out.write("            \r\n");
      out.write("\r\n");
      out.write(" 			  <h6> 아이디 <span style=\"color: red;\">*</span> </h6>\r\n");
      out.write("              <input type=\"text\" name=\"userId\" style=\"width: 345px;\" placeholder=\"아이디를 입력해주세요\" required>\r\n");
      out.write("              <button type=\"button\" onclick=\"idCheck();\" style=\"width: 100px; height:30px; border-radius: 5px; border: none; background-color: #f7e8ad; color: rgb(85, 85, 85); font-size: 12px;\">\r\n");
      out.write("			  중복확인</button>\r\n");
      out.write("			  \r\n");
      out.write("			  <h6> 이름 <span style=\"color: red;\">*</span></h6>\r\n");
      out.write("              <input type=\"text\" name=\"userName\" placeholder=\"이름을 입력해주세요\" required>\r\n");
      out.write("			  \r\n");
      out.write("\r\n");
      out.write("              <h6> 비밀번호 <span style=\"color: red;\">*</span></h6>\r\n");
      out.write("              <input type=\"password\" id=\"pwd1\" name=\"userPwd\" placeholder=\"비밀번호를 입력해주세요\" required>\r\n");
      out.write("\r\n");
      out.write("              <h6> 비밀번호 확인 <span style=\"color: red;\">*</span></h6>\r\n");
      out.write("              <input type=\"password\" id=\"pwd2\" name=\"checkPwd\" onblur=\"validatePwd();\" placeholder=\"비밀번호 재확인\" required>\r\n");
      out.write("\r\n");
      out.write("				<h6> 닉네임 <span style=\"color: red;\">*</span></h6>\r\n");
      out.write("              <input type=\"text\" name=\"userNick\" placeholder=\"닉네임을 입력해주세요\" required>\r\n");
      out.write("             \r\n");
      out.write("			  \r\n");
      out.write("			  <h6> 전화번호 <span style=\"color: red;\">*</span></h6>\r\n");
      out.write("              <input type=\"text\" name=\"userPhone\" maxlength=\"11\" oninput=\"this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\\..*)\\./g, '$1');\" placeholder=\"- 제외한 숫자만 입력해주세요\" required>\r\n");
      out.write("              \r\n");
      out.write("\r\n");
      out.write("              <span class=\"user-loginbtn\">\r\n");
      out.write("                <button type=\"button\" class=\"user-backbtn\" onclick=\"location.href='LoginMain.jsp'\">취소</button>\r\n");
      out.write("                <button type=\"submit\" class=\"user-gobtn\">확인</button>\r\n");
      out.write("              </span>\r\n");
      out.write("          </form>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("	<script>\r\n");
      out.write("    \r\n");
      out.write("    	function idCheck(){\r\n");
      out.write("    		const $userId = $(\".user-login-condition input[name=userId]\");\r\n");
      out.write("    		$.ajax ({\r\n");
      out.write("    			url : \"");
      out.print(contextPath);
      out.write("/idCheck.me\",\r\n");
      out.write("    			data : {checkId : $userId.val()},\r\n");
      out.write("    			success : function(result){\r\n");
      out.write("    				console.log(result);\r\n");
      out.write("    				if(result == \"0\"){\r\n");
      out.write("    					alert(\"중복되는 아이디입니다.\");\r\n");
      out.write("    					$userId.foucus();\r\n");
      out.write("    				}else{\r\n");
      out.write("    					alert(\"사용가능한 아이디입니다.\");\r\n");
      out.write("    					$userId.attr(\"readonly\", true); // 아이디값 확정\r\n");
      out.write("    				}\r\n");
      out.write("    			}\r\n");
      out.write("    		})\r\n");
      out.write("    	}\r\n");
      out.write("\r\n");
      out.write("    </script>\r\n");
      out.write("	<script>\r\n");
      out.write("		function validatePwd() {\r\n");
      out.write("			if($(\"input[name=userPwd]\").val() != $(\"input[name=checkPwd]\").val()) {\r\n");
      out.write("				alert(\"비밀번호가 일치하지 않습니다.\");\r\n");
      out.write("				return false;\r\n");
      out.write("			}\r\n");
      out.write("		}\r\n");
      out.write("	\r\n");
      out.write("	</script>\r\n");
      out.write("\r\n");
      out.write("	<!-- close body -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("     <!-- Start Footer -->\r\n");
      out.write("     <footer class=\"main_footer\" id=\"tempaltemo_footer\">\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <div class=\"row\">\r\n");
      out.write("\r\n");
      out.write("                <div class=\"col-md-4 pt-5\">\r\n");
      out.write("                    <img src=\"");
      out.print(contextPath );
      out.write("/assets/img/메인로고.png\" class=\"main_logo\">\r\n");
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
      out.write("            </div>\r\n");
      out.write("\r\n");
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
      out.write("  <!-- Start Script -->\r\n");
      out.write("  <script src=\"");
      out.print(contextPath );
      out.write("/assets/js/jquery-1.11.0.min.js\"></script>\r\n");
      out.write("  <script src=\"");
      out.print(contextPath );
      out.write("/assets/js/jquery-migrate-1.2.1.min.js\"></script>\r\n");
      out.write("  <script src=\"");
      out.print(contextPath );
      out.write("/assets/js/bootstrap.bundle.min.js\"></script>\r\n");
      out.write("  <script src=\"");
      out.print(contextPath );
      out.write("/assets/js/templatemo.js\"></script>\r\n");
      out.write("  <!-- 확인 클릭시 다음 페이지로 넘어가기 스크립트 시작-->\r\n");
      out.write("  <script>\r\n");
      out.write("   /*  document.querySelector(\".user-gobtn\").addEventListener(\"click\", function(event) {\r\n");
      out.write("    event.preventDefault(); // 기본 동작인 폼 제출 방지\r\n");
      out.write("    location.href = \"SignUpKeyword.jsp\"; // 링크로 이동\r\n");
      out.write("  }); */\r\n");
      out.write("  </script>\r\n");
      out.write("   <!-- 확인 클릭시 다음 페이지로 넘어가기 스크립트 끝-->\r\n");
      out.write("  <!-- End Script -->\r\n");
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