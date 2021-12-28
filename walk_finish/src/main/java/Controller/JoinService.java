package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.MemberDAO;


@WebServlet("/JoinService")
public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");	// ï¿½ï¿½Ã»ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½Ñ±ï¿½ ï¿½ï¿½ï¿½Úµï¿½
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.join(id, pw, nick, gender, age);
		
		System.out.println(id);
		System.out.println(pw);
		
		System.out.println(age);
		
		PrintWriter out = response.getWriter();
		
		if(cnt>0) {
			System.out.println("¼º°ø!");
			dao.step_day_0(id);
	        dao.step_all_0(id);
	        dao.step_0(id);

			out.print(1);			
			
		}else {
			System.out.println("½ÇÆÐ..");
			out.print(0);			
		}
	
	}

}
