<%@page import="Model.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="EUC-KR">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Skydash Admin</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="../../vendors/feather/feather.css">
  <link rel="stylesheet" href="../../vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="../../css/vertical-layout-light/style.css">
  <link rel="stylesheet" href="../../css/vertical-layout-light/table.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="../../images/logo.svg" />
</head>

<body>


<%
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberVO> list =dao.selectAll();
	%>









  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
        <div class="col-lg-6 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo">
                <img src="../../images/logo.svg" alt="logo">
                <button onclick="goBack();" type="button" class="btn btn-outline-primary btn-fw" style="float: right;" value="뒤로가기">뒤로가기</button>
              </div>
              
              
               <!------------------------------------  추가 ------------------------------------------------->
              
              
                    
              <!-- Wrapper -->
			<div id="wrapper">
			<h2 align="center">회원관리페이지</h2>
				<!-- Menu -->
					<nav id="Update">	
						<table>							
							<tr>
								<td>id</td>
								
								<td>gender</td>													
														
								<td>joindate</td>
								<td>삭제</td>								
														
							</tr>							
							<%int num=0;
							for(int i=0; i<list.size();i++){%>
               				 <tr>
               				 	<td><%= list.get(i).getId()%></td>
                 	 			
                 	 			<td><%= list.get(i).getGender() %>
                         		
                         		<td><%= list.get(i).getDate().substring(2,10) %></td>
                         		<td><a href='../../DeleteService?id=<%=list.get(i).getId() %>'>삭제</a></td>	 	                         		
                       		</tr>	 
                    		 <%}%>	
							</table>
							
					</nav>
			 </div>
			    <!------------------------------------  추가  끝 ------------------------------------------------->
              
              
              
              
                
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
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
   </script>
  
  
  
  
  
  
  
  
  <!-- endinject -->
</body>

</html>
    