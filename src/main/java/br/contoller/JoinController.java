package br.contoller;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.model.service.BaskinRobbinsService;
import br.model.vo.BaskinRobbins;

/**
 * Servlet implementation class Join
 */
@WebServlet("/member/registor.do")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/join.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String memberId = request.getParameter("member-id");
		String memberPw = request.getParameter("member-pw");
		String memberName = request.getParameter("member-name");
		String memberBirth = request.getParameter("member-birthday");
		String memberGender = request.getParameter("member-gender");
		String memberEmail = request.getParameter("member-email");
		String memberPhone = request.getParameter("member-phone");
		String memberAddress = request.getParameter("member-address");
		
		BaskinRobbins member = new BaskinRobbins(memberId, memberPw, memberName, memberBirth, memberGender, memberEmail, memberPhone, memberAddress);
		
		BaskinRobbinsService service = new BaskinRobbinsService();
		
		int result = service.insertMember(member);
		if(result > 0) {
			response.sendRedirect("join_Complite.html");
//			request.getRequestDispatcher("/member/join_Complite.html").forward(request, response);
			System.out.println("성공");
		} else {
			// 실패
			System.out.println("실패");
			request.setAttribute("msg", "회원가입 실패했어요");
			request.getRequestDispatcher("/member/serviceFail.jsp").forward(request, response);
		}
	}

}
