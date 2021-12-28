package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import Model.MemberDAO;
import Model.MemberVO;

@WebServlet("/find")
public class find extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	      
		
	      response.setCharacterEncoding("EUC-KR");
	      
	      PrintWriter out = response.getWriter();
	      
	      String goo = request.getParameter("add_goo");
	      String dong = request.getParameter("add_dong");
	      
	      System.out.println("구"+goo);
	      System.out.println("동"+ dong);
	     
	      MemberDAO dao = new MemberDAO();
	      ArrayList<MemberVO> list = dao.name_find(goo,dong);
	      //javascript���� ����� �� �ְԲ� ����������!!!
	      //json
	      
	      Gson gson = new Gson();

	      JsonArray array = new JsonArray();
	      for (int i = 0; i < list.size(); i++) {
	         array.add(gson.toJson(list.get(i)));
	      }
	      
	      out.print(array);
	      
	      
	      
	   }
		
		
	}


