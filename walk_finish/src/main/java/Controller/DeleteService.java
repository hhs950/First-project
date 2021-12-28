package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.MemberDAO;


@WebServlet("/DeleteService")
public class DeleteService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		System.out.println(id);
		MemberDAO dao = new MemberDAO();
		int cnt = dao.delete(id);
		
		PrintWriter out = response.getWriter();
		
		
		
		if (cnt > 0) {
			HttpSession session = request.getSession();	
			session.invalidate();
			//response.sendRedirect("index.jsp");
			out.print(1);
		}
		else {
			response.sendRedirect("index.jsp");
		}

	}

}
