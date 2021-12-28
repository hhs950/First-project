package Controller_Board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Model_Board.BoardDAO;


@WebServlet("/BoardDeleteService")
public class BoardDeleteService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDAO dao = new BoardDAO();
		int cnt = dao.BoardDelete(num);
		
		PrintWriter out = response.getWriter();
		
		if (cnt > 0) {
			System.out.println("게시글삭제성공");
			//response.sendRedirect("pages/chat/chat.jsp");
			out.print(num);
		}
		else {
			System.out.println("게시글삭제실패");
			//response.sendRedirect("pages/chat/chat.jsp");
		}

	}

}
