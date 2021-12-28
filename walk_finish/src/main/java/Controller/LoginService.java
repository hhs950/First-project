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
import Model.MemberVO;

@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");	
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.login(id, pw);
		MemberVO vo2 = dao.walk_all(id);
		
		PrintWriter out = response.getWriter();
		
		if(vo != null) {
			dao.step_day_0(id);
			dao.step_0(id);
			HttpSession session = request.getSession();
			
			session.setAttribute("member", vo);
			session.setAttribute("walk", vo2);
			response.sendRedirect("index.jsp");
			System.out.println("로그인 서비스 로그인 성공");
			//out.print(1);
		}
		else {
			response.sendRedirect("pages/samples/login.html");
			System.out.println("로그인 서비스 로그인 실패");
		}
	}
}
