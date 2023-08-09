package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.AdminMemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class AdimMemberUpdateController
 */
@WebServlet("/adminmemupdate.me")
public class AdminMemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminMemberUpdateController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userId = request.getParameter("userId");

		Member mem = new AdminMemberService().selectUpdateMember(userId);
	    
		request.setAttribute("userId", userId);
		request.setAttribute("mem", mem);

		request.getRequestDispatcher("views/member/adminMemberUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 회원정보변경
		request.setCharacterEncoding("UTF-8");

		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String userNick = request.getParameter("userNick");
		String userPhone = request.getParameter("userPhone");

		Member m = new Member(userId, userName, userNick, userPhone);

		int adminUpdateMember = new AdminMemberService().adminUpdateMember(m);

		if (adminUpdateMember > 0) {// 실 패

			request.setAttribute("errorMsg", "회원정보 수정에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		} else { // 성 공

			// session영역안에 업데이트된 사용자정보 담아주기
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "성공적으로 회원정보를 수정했습니다.");
			session.setAttribute("loginUser", adminUpdateMember);// 같은 키값으로 존재할수 없음 => 즉 덮어쓰기 가능

			// 응답페이지 url 재요청
			response.sendRedirect(request.getContextPath() + "/adminmemupdate.me");
		}

	}
}
