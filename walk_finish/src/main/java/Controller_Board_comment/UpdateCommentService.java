package Controller_Board_comment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model_Board_Comment.Board_CommentDAO;


@WebServlet("/UpdateCommentService")
public class UpdateCommentService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		int num = Integer.parseInt(request.getParameter("num"));
		String content = request.getParameter("content");
		
		System.out.println(num);
		System.out.println(content);
		
		
		response.setContentType("text/html; charset=euc-kr;");
		Board_CommentDAO dao =new Board_CommentDAO();
		int cnt = dao.commentupadate(content, num);
		
		if(cnt>0) {
			System.out.println("수정성공");
			response.sendRedirect("pages/chat/chat.jsp");
		}
		else {
			System.out.println("수정실패");
			response.sendRedirect("pages/chat/chat.jsp");
		
		}
		
		
	}

}
