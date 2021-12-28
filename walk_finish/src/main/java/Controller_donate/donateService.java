package Controller_donate;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model_donate.donateDAO;
import Model_donate.donateVO;

@WebServlet("/donateService")
public class donateService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");

		int donate = Integer.parseInt(request.getParameter("donate"));
		int num = Integer.parseInt(request.getParameter("num"));
		String id = request.getParameter("id");
		
		System.out.println(donate);
		System.out.println(num);
		System.out.println(id);
		
		
		donateDAO dao = new donateDAO();
		donateVO vo = dao.showWalk(id);
		donateVO vo2 = dao.donate_content(num);
		// �缱 ���� ��ħ--------------------------------------------
		PrintWriter out = response.getWriter();
		if(vo.getstepall() > donate) {
			int user = dao.user_stepAll_minus(id, donate);
			if(user > 0) {
				System.out.println("���� �� ���� ����");
			}else {
				System.out.println("���� �� ���� ����");
			}
			int donate_market = dao.doante_stepAll_plus(num, donate);
			if(donate_market > 0) {
				System.out.println("��θ��� �� �÷��� ����");
			}else {
				System.out.println("��θ��� �� �÷��� ����");
			}
			int user_donate = dao.stepAll_doante_plus(id, donate);
			if(donate_market > 0) {
				System.out.println("���� ��� �� �÷��� ����");
			}else {
				System.out.println("������� �� �÷��� ����");
			}
			out.print(1);
		}else {
			System.out.println("����");
			out.print(0);
			//response.sendRedirect("index.jsp");
		}
		
		
	}

}
