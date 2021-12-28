<%@page import="Model.MemberVO"%>
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
  <!-- endinject -->
  <link rel="shortcut icon" href="../../images/favicon.png" />
</head>

<body>
<%
	MemberVO vo = (MemberVO)session.getAttribute("member");
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
              
              <h2 align="center"><게시판을 작성해 주세요></h2><br>
              <!--  <h6 class="font-weight-light">더 작은글씨.</h6> -->
              <form class="pt-3" method="post" action="../../BoardService">
              	<div class="form-group">
                   <h4 align="left">&nbsp;&nbsp;작성자 : <%=vo.getNick() %></h4>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" placeholder="글 제목" name="title" maxlengt="50">
                </div>
                
              
                <div class="form-group">
                  <textarea class="form-control" placeholder="글 내용" name="content" maxlength="2048" style="height: 350px;"></textarea>
                </div>
                        
                <div class="mt-3">
                <input type="submit" class="btn btn-primary pull-right " value="글쓰기">
                 
                </div>
                
                
               <!------------------------------------  추가  끝------------------------------------------------->  
                 </form>
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
  
  
  <script>
  function goBack(){
		window.history.back();
	}
  </script>
  
 
  
  
  
  
  
  <!-- endinject -->
</body>

</html>
    