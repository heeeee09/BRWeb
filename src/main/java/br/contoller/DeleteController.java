package br.contoller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.model.service.BaskinRobbinsService;
import br.model.vo.BaskinRobbins;

/**
 * Servlet implementation class DeleteController
 */
@WebServlet("/member/delete.do")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/views/member/accountDelete.jsp").forward(request, response);
		String memberId = request.getParameter("member-id");
		String memberPw = request.getParameter("member-pw");
//		String memberPwConfig = request.getParameter("member-pw-config");
		BaskinRobbins member = new BaskinRobbins(memberId, memberPw);
		BaskinRobbinsService service = new BaskinRobbinsService();
		int result = service.deleteMember(member);
		if(result > 0) {
			request.setAttribute("msg", "회원 탈퇴를 성공하였습니다.");
			RequestDispatcher view = request.getRequestDispatcher("/member/accountDeleteComplite.do");
			view.forward(request, response);
		} else {
			request.setAttribute("msg", "회원 탈퇴에 실패했습니다.");
			request.getRequestDispatcher("/member/myPage.do").forward(request, response);
			
		}
		
		
		// DELETE FROM MEMBER_TBL WHERE MEMBER_ID = ? AND MEMBER_PW = ?
		
		
		
//		BaskinRobbins memberDel = service.memberDelete(memberPw);
//		if(memberDel != null) {
//			if(memberDel.getMemberPw().equals(memberPwConfig)) {
//				
//			}else {
//				request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
//			}
//			response.sendRedirect("/member/account_delete_complite.jsp");
//		}else {
//			request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
//		}
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
