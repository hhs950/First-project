package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.MemberDAO;
import Model.MemberVO;

@WebServlet("/UpdateService")
public class UpdateService extends HttpServlet {
// 가영 수정파트 !!! 보낼 파일  
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("euc-kr");   // 요청데이터 한글 인코딩
      HttpSession session2 = request.getSession();
      MemberVO vo = (MemberVO)session2.getAttribute("member");
      
      
      String id = vo.getId();
      String pw = request.getParameter("pw");
      String nick = request.getParameter("nick");
      
      MemberDAO dao = new MemberDAO();
      int cnt = dao.update(id, pw, nick);
      
      PrintWriter out = response.getWriter();
      
      if (cnt > 0) { // 회원정보 수정 
         // c1 : 수정o -  result 1
         // c2 : pw,nick 둘다 일치 - 수정x result 2 
         // c3 : 값 입력x - 수정x result 3
         System.out.println("정보수정성공~~!");
         MemberVO vo2 = new MemberVO(id, pw, nick);
         session2.setAttribute("member", vo2);
         out.print(1);
         if(vo.getPw().equals(pw) && vo.getNick().equals(nick)) { //pw,nick 일치하지 않음.
            System.out.println("pw,nick 입력값 일치");
            out.print(2);
         }
      }
      else { // 값 미입력시 수정x
         System.out.println("정보수정실패!");
         out.print(3);
         //response.sendRedirect("#");
      }

      
   }

}