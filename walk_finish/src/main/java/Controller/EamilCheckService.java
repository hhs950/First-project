package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.MemberDAO;


@WebServlet("/EamilCheckService")
public class EamilCheckService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String id = request.getParameter("id");
			MemberDAO dao = new MemberDAO();
			boolean check = dao.emailCheck(id);
			
			// 응답
			response.setContentType("text/html; charset=euc-kr;");
			PrintWriter out = response.getWriter(); // 응답데이터를 보내 줄 통로 생성
			
			out.print(check);
	}

}
