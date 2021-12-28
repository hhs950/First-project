package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.MemberDAO;
import Model.MemberVO;

@WebServlet("/step")
public class step extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// �ѱ� ���ڵ�
		request.setCharacterEncoding("euc-kr");

		int walk = Integer.parseInt(request.getParameter("sensor"));
		String id = request.getParameter("id");
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.step(walk, id);
		MemberVO vo = null;
		
		if (cnt > 0) {
			vo = dao.walk_today(id);
			dao.step_day(id, dao.walk_today(id).getWalk_date());
			dao.stepAll(id, walk);
			System.out.println("걸음수 성공");
		}
		else {
			System.out.println("걸음수 실패 !");
		}
	}
}
