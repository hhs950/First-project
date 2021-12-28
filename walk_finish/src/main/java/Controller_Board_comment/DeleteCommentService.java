package Controller_Board_comment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model_Board_Comment.Board_CommentDAO;


@WebServlet("/DeleteCommentService")
public class DeleteCommentService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		
		Board_CommentDAO dao =new Board_CommentDAO();
		int cnt = dao.commentdelete(num);
		
		
		if (cnt > 0) {
			System.out.println("성공!");
			response.sendRedirect("pages/chat/chat.jsp");
		}
		else {
			System.out.println("실패!");
			response.sendRedirect("pages/chat/chat.jsp");
		}
		
		
		
		
		
		
		
		
		
	}

}
