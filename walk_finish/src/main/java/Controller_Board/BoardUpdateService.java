package Controller_Board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model_Board.BoardDAO;

@WebServlet("/BoardUpdateService")
public class BoardUpdateService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("euc-kr");
		
		int num= Integer.parseInt(request.getParameter("num"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		System.out.println(num);
		response.setContentType("text/html; charset=euc-kr;");
		BoardDAO dao = new BoardDAO(); 
		int cnt = dao.Boardupdate(title, content, num);
		
		if(cnt>0) {
			System.out.println("��������");		
			response.sendRedirect("pages/chat/chat.jsp");// 11�� 20�� ���� ����	
		}else {
			response.sendRedirect("pages/chat/chat.jsp");
		}

		
		
		
		
		
		
	}

}
