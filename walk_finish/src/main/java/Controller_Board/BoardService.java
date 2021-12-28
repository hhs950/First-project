package Controller_Board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.MemberVO;
import Model_Board.BoardDAO;



@WebServlet("/BoardService")
public class BoardService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		
		
		HttpSession session = request.getSession();
		MemberVO vo =(MemberVO)session.getAttribute("member");
		response.setContentType("text/html; charset=euc-kr;");
		String writer = vo.getNick();
		
		System.out.println(title);
		System.out.println(content);
		
		
		BoardDAO dao =new BoardDAO();
		int cnt = dao.write(title,writer , content);
		
		
		if(cnt>0) {
			System.out.println("t");
			response.sendRedirect("pages/chat/chat.jsp");
			
			
		}else {
			System.out.println("�۾��� ����");
			response.sendRedirect("pages/chat/chat.jsp");
		}

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
