<%@page import="Model.MemberDAO"%>
<%@page import="Model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
  <meta charset="EUC-KR">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
  <link rel="shortcut icon" href="../../images/logo.svg" />
<title>walkers</title>
</head>
<body>
   <%
   HttpSession session2 = request.getSession();
   
   MemberVO vo = (MemberVO)session2.getAttribute("member");
   MemberDAO dao = new MemberDAO();
   
   %>
   <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
        <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo">
                <img src="../../images/logo.svg" alt="logo">
                <button onclick="goBack();" type="button" class="btn btn-outline-primary btn-fw" style="float: right;" value="뒤로가기">뒤로가기</button>
              </div>
              
              
               <!------------------------------------  추가 ------------------------------------------------->
              
              
               <!-- <h4><%= vo.getNick() %>님! 회원정보를 수정해주세요. </h4>-->  
              <h6 class="font-weight-light">&ensp; 수정하고 싶은 값을 입력해주세요.</h6>
              <form class="pt-3" action="../../UpdateService" method="post">
               
                <div class="form-group">
                  <input  type="password" name="pw" class="form-control form-control-lg"  placeholder="Password를 변경하시려면 입력해주세요.">
                </div>
                <div class="form-group">
                  <input  type="text" name="nick"  class="form-control form-control-lg" placeholder="Nickname를 변경하시려면 입력해주세요.">
                </div>
                
                
                <div class="mt-3">
                <input type="submit" value="수정완료!" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" >
                </div>                
                <div class="my-2 d-flex justify-content-between align-items-center">
                  <div class="form-check">
                  </div>
                </div>
              </form>
              <div class="mt-1">                
                <button style='float: right'; id="delete-btn" onclick="button_event();" class='btn btn-primary'>회원탈퇴</button>
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
     function goBack(){ //  뒤로가기 버튼 기능 
      window.history.back();
      }   
     // 수정완료 클릭시 수정여부 알림창 출력 
    $('input[type="submit"]').on('click', function() {
       $.ajax({
          //url
          url : '../../UpdateService',
          data : { pw : $('input[name="pw"]').val(),
                 nick : $('input[name="nick"]').val()  },
          type : 'post', 
          success : function(result){ 
             // pw,nick 둘다 일치 - 수정x result 2 
             // 수정o -  result 1
             // 값 입력x - 수정x result 0
             // if-else alert/window 순서 바꾸지말것. 바꾸면 안먹힘 
             if(result==3){ // 값입력x 
                alert("정보수정실패! 값을 입력해주세요.")
                window.location = "mypage.jsp"
             }else if(result==1){ // 정보수정 성공
                window.location = "../../index.jsp"
                alert("정보수정성공!")
                
                
             }else if(result==12){ // pw,nick 둘다 일치
                window.location = "mypage.jsp"
                 alert("기존정보와 동일합니다. 다시 입력해주세요.")
                 
             }
          },
          error : function(result){
             alert("요청실패!")
          }
       })
   })
   
   
   
   function button_event(){
		  if(confirm("정말 삭제하시겠습니까??") == true){
			  if(confirm("진짜 진짜 삭제하시겠습니까??") == true){	  
				  $.ajax({
					  url : "../../DeleteService",
					  type : "POST",
					  data : {
						  id : '<%=vo.getId()%>'
					  },
					  
					  success : function(result){
						  
						  alert("삭제성공")
							window.location = "../../index.jsp"
							
					
					 },
					 error : function(result){
							alert("삭제실패!")
						}
				  })
			  }else{
				  return;
			  }
				  
			  
			 
		  }else{
			  return;
			  
		  }
		  
	  
	  
	  }
   
   
   </script>
   

   
   
   
   
   
   
  
  <!-- endinject -->
</body>
</html>