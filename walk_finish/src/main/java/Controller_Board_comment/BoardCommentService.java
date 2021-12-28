package Controller_Board_comment;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model_Board_Comment.Board_CommentDAO;


@WebServlet("/BoardCommentService")
public class BoardCommentService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String nick = request.getParameter("nick");
		String content = request.getParameter("content");
		int checknum = Integer.parseInt(request.getParameter("checknum"));
		response.setContentType("text/html; charset=euc-kr;");

		Board_CommentDAO dao = new Board_CommentDAO();
		int cnt = dao.comment_write(nick, content, checknum);
		
		System.out.println(nick);
		System.out.println(content);
		System.out.println(checknum);
		
		
		PrintWriter out = response.getWriter();
		
		if(cnt>0) {
			
			out.print(nick);			
			
		}else {
			
			out.print(0);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
