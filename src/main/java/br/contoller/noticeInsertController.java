package br.contoller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.model.service.BaskinRobbinsService;
import br.model.vo.BaskinRobbins;

/**
 * Servlet implementation class noticeInsertController
 */
@WebServlet("/member/noticeInsert.do")
public class noticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public noticeInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/noticeInsert.do").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String noticeSubject = request.getParameter("noticeSubject");
		String noticeContent = request.getParameter("noticeContent");
		BaskinRobbins notice = new BaskinRobbins(noticeSubject, noticeContent);
		BaskinRobbinsService service = new BaskinRobbinsService();
		
		int result = service.noticeInsert(notice);
		if(result > 0) {
			request.setAttribute("title", "게시글 작성 완료");
			request.setAttribute("msg", "게시글이 작성되었습니다.");
			request.getRequestDispatcher("/member/serviceResult.do").forward(request, response);
		}else {
			request.setAttribute("title", "게시글 작성 실패");
			request.setAttribute("msg", "게시글이 작성이 완료되지 않았습니다.");
			request.getRequestDispatcher("/member/serviceResult.do").forward(request, response);
		}
	}

}
