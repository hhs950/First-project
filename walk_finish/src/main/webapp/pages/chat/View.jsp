<%@page import="java.util.ArrayList"%>
<%@page import="Model_Board_Comment.Board_CommentVO"%>
<%@page import="Model_Board_Comment.Board_CommentDAO"%>
<%@page import="Model.MemberVO"%>
<%@page import="Model.MemberDAO"%>
<%@page import="Model_Board.BoardVO"%>
<%@page import="Model_Board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="EUC-KR">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>walkers</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="../../vendors/feather/feather.css">
  <link rel="stylesheet" href="../../vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="../../css/vertical-layout-light/style.css">
  <link rel="stylesheet" href="../../css/vertical-layout-light/view.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="../../images/logo.png" />
  
  
 
  
</head>

<body>

<%
	String seq_num = request.getParameter("num");
	int check_num = Integer.parseInt(request.getParameter("num"));
	
	BoardDAO dao =new BoardDAO();
	BoardVO vo = dao.showOne(seq_num);
			
	ArrayList<Board_CommentVO> list = new ArrayList<Board_CommentVO>();
	
	Board_CommentDAO dao1 = new Board_CommentDAO();
	
	list = dao1.showCommentWrite(check_num);
			
	MemberVO vo1 = (MemberVO)session.getAttribute("member");
	
	

%>



  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-6 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo">
                <img src="../../images/logo.svg" alt="logo">
                <button onclick="goBack();" type="button" class="btn btn-outline-primary btn-fw" style="float: right;" value="�ڷΰ���">�ڷΰ���</button>
              </div>
              
              <!------------------------------------  �߰� ------------------------------------------------->
              
              <table>
              <thead>
					<tr>
						<th colspan="2" style="background-color : #eeeeee; text-align : center;">�Խ��� �� ����</th>
					</tr>
				</thead>
              <tbody>
				<tr>
					<td style="width: 20%;">�� ����</td>
					<td colspan="2"><%=vo.getTitle() %></td>
				</tr>
				<tr>
					<td>�ۼ���</td>
					<td colspan="2"><%=vo.getWriter() %></td>
				</tr>
				<tr>
					<td>����</td>
					<td colspan="2" style="height: 200px; text-align : left;"><%=vo.getcontent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll("\n", "<br>") %></td>
				</tr>			
				</tbody>				
				</table>								
				<hr style="border-top: 3px dotted;"><br>	
				<table>							
							<tr>																
								<td style=width:60px>�г���</td>																				
								<td style=width:100px>�ۼ���</td>
								<td style=width:300px>��۳���</td>
								<td style=width:60px>����</td>						
								 <td style=width:80px>����</td>										
							</tr>
							<%
							for(int i=0; i<list.size();i++){%>
               				 <tr>               				 	
                 	 			<td><%= list.get(i).getWriter() %></td>                 	 			
                 	 			<td><%= list.get(i).getM_date().substring(5,10) %></td>
                 	 			<td><%= list.get(i).getContent() %></td>
                 	 			<%if(list.get(i).getWriter().equals(vo1.getNick())){%>              	 			
                 	 			<td>                 	 			
                 	 			<input type="button" name="<%=list.get(i).getNum() %>" onclick="update(<%=list.get(i).getNum() %>)" maxlength="10" style="background-color: rgb(110 210 85);"  value="����">                 	 			
                 	 			</td>        	 			
                         		<td><a href='../../DeleteCommentService?num=<%=list.get(i).getNum() %>'>����</a></td> 
                         		<%}else{ %>
                         		<td></td>
                         		<td></td>
                         		<%} %>	 	                         		
                       		</tr>
                    		 <%}%>
							</table>
							<form method="post" action="../../UpdateCommentService">                    		
                    		 <div class="up">
                       		</div>
                       		</form>
				<div>
				<br>
				<div class="comment-txt">
					<textarea id="cmtCnt" name="cmtCnt" placeholder="�������� ������ ����� �Է����ּ���."></textarea>
				</div>
				<br>
				<div class="comment-button">
					<button id="cmtCnt-btn" style="float: right" class="btn btn-outline-primary btn-fw">��۴ޱ�</button>
				</div>
				<br>
				</div>
				
				
		<br><br>		
		<a href="chat.jsp" class="btn btn-primary">���</a>
		
		<%if(vo.getWriter().equals(vo1.getNick())){ %>
		<a href="boardupdate.jsp?num=<%= vo.getNum() %>" class="btn btn-primary">�� ����</a>		
		<button id="delete-btn" onclick="button_event();" class='btn btn-primary'>�� ����</button>
		<%} %>
		
		

</div>
</div>
</div>
</div>


		
		</div>
	</div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="../../vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="../../js/off-canvas.js"></script>
  <script src="../../js/hoverable-collapse.js"></script>
  <script src="../../js/template.js"></script>
  <script src="../../js/settings.js"></script>
  <script src="../../js/todolist.js"></script>
  <script src="../../js/jquery-3.6.0.js"></script>
  
  <script>
  function goBack(){
		window.history.back();
	}
  
  $("#cmtCnt-btn").click(function(){
	  	  
	  $.ajax({
		  url : "../../BoardCommentService",
		  type : "POST",
		  data : {
			  nick : '<%=vo1.getNick()%>',
			  content : $("#cmtCnt").val(),
			  checknum : <%=vo.getNum()%>
		  },
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		 
		  success : function(result){
			  
			  alert("�����⼺��")
				//window.location = "chat.jsp"
				location.reload()
		
		 },
		 error : function(result){
				alert("���������!")
			}
	  })
	})
    
  </script>
  
  <script>
  function button_event(){
	  if(confirm("���� �����Ͻðڽ��ϱ�??") == true){
		  			  
			  $.ajax({
				  url : "../../BoardDeleteService",
				  type : "POST",
				  data : {
					  num : <%=vo.getNum()%>
				  },
				  
				  success : function(result){
					  
					  alert("��������")
						window.location = "chat.jsp"
						
				
				 },
				 error : function(result){
						alert("��������!")
					}
			  })
			  
		  
		 
	  }else{
		  return;
		  
	  }
	  
  
  
  }
  </script>
  
  
  
  <script>
  function update(num){
	  $(".up").html("");
	  $(".up").append(
			  '<br>'
			  +'<table>'			 
			  +'<input type="hidden" name="num" value='+num+'>'			  
			  +'<textarea name="content" placeholder="������ ��� �Է����ּ���.">'
			  +'</textarea>'
			  +'<br>'
			  +'<input type="submit"  style="float: right"  class="btn btn-outline-primary btn-fw" value="�����Ϸ�">'			  
			  +'</table>'
	  
	  )
	  
		
		
	}
  
  
  
  </script>
 
  
  
  
  
  
  <!-- endinject -->
</body>

</html>
    