package br.contoller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.model.service.BaskinRobbinsService;
import br.model.vo.BaskinRobbins;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/member/login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/login.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("member-id");
		String memberpw = request.getParameter("member-pw");
		
		BaskinRobbins member = new BaskinRobbins(memberId, memberpw);
		
		BaskinRobbinsService service = new BaskinRobbinsService();
		
		BaskinRobbins result = service.checkLogin(member);
		if(result != null) {
			HttpSession session = request.getSession();
			session.setAttribute("memberId", result.getMemberId());
			session.setAttribute("memberName", result.getMemberName());
			response.sendRedirect("/index.jsp");
		}else {
			System.out.println("실패");
			request.setAttribute("msg", "로그인 실패했어요");
			request.getRequestDispatcher("/member/serviceFail.jsp").forward(request, response);
		}
	}

}
