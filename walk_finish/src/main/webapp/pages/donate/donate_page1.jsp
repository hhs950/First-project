<%@page import="Model_donate.donateDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.Console"%>
<%@page import="java.util.Date"%>
<%@page import="Model.MemberVO"%>
<%@page import="Model_donate.donateVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- index.jsp �� ������� �ؿ� �� �߰��ؼ� �ּ� ����! -->
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
  <link rel="shortcut icon" href="../../images/logo.svg" />
  <style>
  	 #donatedonate{
    	width: 60%;
    	display: inline;
    }
  </style>
  
  
</head>

<body>
<%
	HttpSession session2 = request.getSession();
	int num = Integer.parseInt(request.getParameter("num"));
	
	MemberVO vo = (MemberVO)session2.getAttribute("member");
	
	donateDAO dao = new donateDAO();
	ArrayList<donateVO> list =dao.selectAll();
	donateVO vo1 = dao.donate_content(num);
	
%>


  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-5" href="../../index.jsp"><img src="../../images/logo.svg" class="mr-2" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="../../index.jsp"><img src="../../images/logo.svg" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="icon-menu"></span>
        </button>
        
        
        <ul class="navbar-nav mr-lg-2">
          <li class="nav-item nav-search d-none d-lg-block">
            <div class="input-group">
              <div class="input-group-prepend hover-cursor" id="navbar-search-icon">
                <span class="input-group-text" id="search">
                  <i class="icon-search"></i>
                </span>
              </div>
              <input type="text" class="form-control" id="navbar-search-input" placeholder="Search now" aria-label="search" aria-describedby="search">
            </div>
          </li>
        </ul>
        
        <!-------   ���� ����-------------------  �α��� ������ --------------------------------->
        <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item dropdown">          	
             	&nbsp;&nbsp;&nbsp;             		
			  
			</li> 
<!--------------------------- ���� Ŭ�� �κ� ----------------------------->
			<li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
            <!-- �����Ӥ��������� -->
           <%if(vo !=null){ %>
            	<%System.out.println(vo.getGender());
            	if(vo.getGender().equals("m") || vo.getGender().equals("M")){ 
            		System.out.println("����");
            	%>
             	 <img src="../../images/faces/boy.jpg" alt="profile"/>
            	<%}else{ 
            		System.out.println("����");%>
             	 <img src="../../images/faces/girl.jpeg" alt="profile"/>
            	<%}
            }else{ %>
              <img src="../../images/faces/nono.png" alt="profile"/>
            <%} %>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
              <%if(vo==null){ %>
               <a class="dropdown-item" href="../../pages/samples/join.html" >
             	<i class="ti-info-alt text-primary" style=color:#ffffff></i>
             	ȸ������ 
             	</a>	
              <a class="dropdown-item" href="../../pages/samples/login.html">
              	<i class="ti-user text-primary"></i>
                �α���
              </a>
              <%} %>
              <%if(vo!=null){ %> 
                <%if(vo.getId().equals("admin")){ %>
				<a class="dropdown-item" href="../../pages/samples/selectmember.jsp">
				<i class="ti-more text-primary"></i>
				��üȸ������</a><%} %>
						
              <a class="dropdown-item" href="../../pages/samples/mypage.jsp">
              	<i class="ti-more text-primary"></i>
                ȸ����������
              </a>
              <a href="../../LogoutService" class="dropdown-item">
                <i class="ti-power-off text-primary"></i>
                �α׾ƿ�
              </a>
              <%} %>
            </div>
          </li>
          
         	<li class="nav-item nav-settings d-none d-lg-flex">
            <a class="nav-link" href="#">
              <i class="icon-ellipsis"></i>
            </a>
          </li>          
        </ul>  <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="icon-menu"></span>
        </button>
      </div>
    </nav>
    
    
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_settings-panel.html -->
      <div class="theme-setting-wrapper">
        <div id="settings-trigger"><i class="ti-settings"></i></div>
        <div id="theme-settings" class="settings-panel">
          <i class="settings-close ti-close"></i>
          <p class="settings-heading">SIDEBAR SKINS</p>
          <div class="sidebar-bg-options selected" id="sidebar-light-theme"><div class="img-ss rounded-circle bg-light border mr-3"></div>Light</div>
          <div class="sidebar-bg-options" id="sidebar-dark-theme"><div class="img-ss rounded-circle bg-dark border mr-3"></div>Dark</div>
          <p class="settings-heading mt-2">HEADER SKINS</p>
          <div class="color-tiles mx-0 px-4">
            <div class="tiles success"></div>
            <div class="tiles warning"></div>
            <div class="tiles danger"></div>
            <div class="tiles info"></div>
            <div class="tiles dark"></div>
            <div class="tiles default"></div>
          </div>
        </div>
      </div>
      <div id="right-sidebar" class="settings-panel">
        <i class="settings-close ti-close"></i>
        <ul class="nav nav-tabs border-top" id="setting-panel" role="tablist">
          <li class="nav-item">
            <a class="nav-link active" id="todo-tab" data-toggle="tab" href="#todo-section" role="tab" aria-controls="todo-section" aria-expanded="true">TO DO LIST</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="chats-tab" data-toggle="tab" href="#chats-section" role="tab" aria-controls="chats-section">CHATS</a>
          </li>
        </ul>
      <!-- �������� TodoLIst �ε�, �پ��ָ� �������������� ���ʿ��ڵ�����  -->
        <div class="tab-content" id="setting-content">
          <div class="tab-pane fade show active scroll-wrapper" id="todo-section" role="tabpanel" aria-labelledby="todo-section">
            <div class="add-items d-flex px-3 mb-0">
              <form class="form w-100">
              </form>
            </div>
          </div>
       <!-- �������� chats �ε�, �پ��ָ� ������ �������� ���ʿ��ڵ�����  -->
          <div class="tab-pane fade" id="chats-section" role="tabpanel" aria-labelledby="chats-section">
            <div class="d-flex align-items-center justify-content-between border-bottom">
              <p class="settings-heading border-top-0 mb-3 pl-3 pt-0 border-bottom-0 pb-0">Friends</p>
              <small class="settings-heading border-top-0 mb-3 pt-0 border-bottom-0 pb-0 pr-3 font-weight-normal">See All</small>
            </div>
          </div>
          <!-- chat tab ends -->
        </div>
      </div>
      
       
<!-- ------�����ؾߵ�------���� ���̵�� ---------------------------------------------------- -->
      <!-- partial -->
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="../../index.jsp">
              <i class="icon-grid menu-icon"></i>
              <span class="menu-title">����������</span>
            </a>
          </li>      
<!-- ------�����ؾߵ�------���� ���̵��   ������� --------------------------------- -->
          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#donate" aria-expanded="false" aria-controls="donate">
              <i class="icon-bar-graph menu-icon"></i>
              <span class="menu-title">�������</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="donate">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../donate/donate.jsp">�������</a></li>
              </ul>
            </div>
          </li>          
<!-- ------�����ؾߵ�--------���� ���̵�� ��å���� -------------------------------------------------- -->           
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#chat" aria-expanded="false" aria-controls="chat">
              <i class="icon-bar-graph menu-icon"></i>
              <span class="menu-title">��å����</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="chat">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../chat/chat.jsp">�Խ���</a></li>
                <li class="nav-item"> <a class="nav-link" href="../chat/walk.jsp">��å�ΰ˻�</a></li>
              </ul>
            </div>
          </li>          
<!-- ------�����ؾߵ�---------���� ���̵�� ��ŷ-------------------------------------------- -->          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
              <i class="icon-grid-2 menu-icon"></i>
              <span class="menu-title">��ŷ</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="tables">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../tables/basic-table.jsp">��ŷ</a></li>
              </ul>
            </div>
          </li>
<!-- -------�����ؾߵ�----------ȸ����������--------------------------------------------- -->
           
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">ȸ����������</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
              <ul class="nav flex-column sub-menu">
                <%if(vo==null){ %>              
                <li class="nav-item"> <a class="nav-link" href="../samples/login.html"> �α��� </a></li>
                <li class="nav-item"> <a class="nav-link" href="../samples/join.html"> ȸ������ </a></li>                
                <%} %>
                <%if(vo!=null){ %>
                <li class="nav-item"> <a class="nav-link" href="../samples/mypage.jsp"> ȸ���������� </a></li>
                <li class="nav-item"> <a class="nav-link" href="../../LogoutService"> �α׾ƿ� </a></li>
                <%} %>
              </ul>
            </div>
          </li>
          
<!-- -----------------�뷡 ������--------------------------------------------- -->
          <!-- 
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#music" aria-expanded="false" aria-controls="auth">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">�뷡�����鼭����</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="music">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../chat/mp3.jsp"> ���� </a></li>                
                <li class="nav-item"> <a class="nav-link" href="../chat/mp4.jsp"> ����2 </a></li>                
              </ul>
            </div>
          </li>          
           -->
           
               
<!-- -----------------��Ʈ���� ������--------------------------------------------- -->
          <!--            
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#tetris" aria-expanded="false" aria-controls="auth">
              <i class="icon-grid-2 menu-icon"></i>
              <span class="menu-title">��Ʈ��������</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="tetris">
              <ul class="nav flex-column sub-menu">
            <li class="nav-item"> <a class="nav-link" href="../tetris/tetris.html"> ��Ʈ���� </a></li>                                
             </ul>
            </div>
          </li> 
           -->
<!-- -----------------���ð���  ������--------------------------------------------- --> 
		  <!--           
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#shoot" aria-expanded="false" aria-controls="auth">
              <i class="icon-grid-2 menu-icon"></i>
              <span class="menu-title">��������</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="shoot">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../shoot/shoot.html"> ���ð��� </a></li>                              
              </ul>
            </div>
          </li>               
          -->    
          </ul>
          </nav>
      
      
<!------------------ ��λ�������!! ------------------------------------------------>
      <%  // ��� �Ⱓ d-day��� 
          	 DecimalFormat    capa        = new DecimalFormat("#");
             SimpleDateFormat dfv         = new SimpleDateFormat("yyyyMMdd");
             SimpleDateFormat df         = new SimpleDateFormat("yyyy.MM.dd");
             Calendar cal = Calendar.getInstance();
          	 //��¥�� �޾Ƽ� ���ڿ� ��ȯ�ؼ� ����ؾ��Ѵ���. ��¥->����->��¥ 
             int yyyy     = cal.get(Calendar.YEAR);    //���� �⵵
             int MM        = cal.get(Calendar.MONTH);   //���� ��
             int dd        = cal.get(Calendar.DATE);    //���� ��¥
             cal.set(yyyy, MM, dd); //���� ��¥ ����
             
             String resdate = vo1.getDate_end();
             //.substring(0,10);    //������
             //System.out.println(resdate);
             String today = dfv.format(cal.getTime()); //���ó�¥
             //System.out.println(today);
             
             long diff = 0;
             long diffDays = 0;
             Date beginDate = dfv.parse(resdate); //parse(��������¥->date)
             Date endDate = dfv.parse(today);
             //System.out.println(endDate+"����");
             //System.out.println(beginDate+"����");
          
             diff = endDate.getTime() - beginDate.getTime(); //�и����������� ����
             diffDays = diff / (24 * 60 * 60 * 1000);
             
             String resdate2 = df.format(beginDate); // ����������¥ ��� 
             String today2 = df.format(endDate); 
         	 
         	 %>
         	 
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-lg-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title"> <%=list.get(vo1.getNum()-1).getTitle()%></h4>
                  <h3 class="card-subtitle"><%=list.get(vo1.getNum()-1).getPlace()%> </h3>
                 
                  <p class="card-description2"> <%=vo1.getDate_start()%>~<%=vo1.getDate_end()%><code> D <%=diffDays%></code> </p>
                  <div class="prog"> 
                  
   				  </div>
                  
                  <ul class="list-arrow">
                    <span class="card-description"><%=vo1.getContent().replace("\\r\\n", "<br>") %></span>
                  </ul>
                  	
                  
                 <!-- 1. ���� ���� �ֱ�
                      2. �̹����ְ� ���� ���� ���°� ����? 
                      3. ���� ������ �ð�ȭ ��Ʈ 
                      4. ����ϱ� ������ ������ ȸ�� + ��ǥġ�� ����  --> 
                  
                  
                  <div class="template-demo">
                   <h4 class="card-subtitle"> ��α� ����ȹ </h4>
                      <ul class="list-ticked">
                      <%if(vo!=null){ %>
                    	<li><span>�� ��ǥ����:  </span> <span class='moneyAlign'><%=vo1.getMoney() %> ����</span></li>
                    	<li><span>�� ��ΰ���:  </span> <span class='moneyAlign'><%=vo1.getDonate() %> ����</span></li>
                    	<%}else{ %>
                    	<li><span>�� ��ǥ����:  </span> <span class='moneyAlign'>�α��� �� Ȯ���ϼ���</span></li>
                    	<li><span>�� ��ΰ���:  </span> <span class='moneyAlign'>�α��� �� Ȯ���ϼ���</span></li>
                    	<%} %>
                 	 </ul>
                   	</div>
               	 <div class="template-demo">
                  <h4 class="card-subtitle"> ��� �Ⱓ </h4>
                  <ul class="list-arrow">
                   <%
                 	Date beginDate1 = dfv.parse(vo1.getDate_start());
                   Date beginDate2 = dfv.parse(vo1.getDate_end());
                   
                   SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy�� MM�� dd��"); 
                   String strNowDate1 = simpleDateFormat.format(beginDate1);
                   String strNowDate2 = simpleDateFormat.format(beginDate2);

                  %>
                    <li><%=strNowDate1 %>~<%=strNowDate2%> </li>
                  </ul>
             <!-- <form class="pt-3" action="../../donateService" method="post"> --> 
               <form class="pt-3" method="post" onsubmit = "return false">
             
                <div class="form-group" align = "left">
                  <input type="text" class="form-control" name="donate" id="donatedonate" placeholder="��ΰ���">
                  <!--<button id="donate13" name = "donate"  class='btn btn-primary' onclick=''> ����ϱ� </button>-->
                  <%if(vo!=null){ %>
                  <input type="hidden" name = "id" id="idid" value="<%=vo.getId()%>">
                  <input type="hidden" name = "num" id="numnum" value="<%=num%>">
                  <%}else{ %>
                  <input type="hidden" name = "id" id="idid" value="0">
                  <input type="hidden" name = "num" id="numnum" value="0">
                  <%} %>
                  <button id="donate13" name = "donate12"  class='btn btn-primary' onclick=''> ��� </button>
                  <!-- <input type="submit" class='btn btn-primary' value="����ϱ�"> -->
                </div >
              </form>
                </div>
              </div>
            </div>
                  
             
        <!-- content-wrapper ends -->
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  </div>
  </div>
  </div>
  
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="../../vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="../../vendors/chart.js/Chart.min.js"></script>
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="../../js/off-canvas.js"></script>
  <script src="../../js/hoverable-collapse.js"></script>
  <script src="../../js/template.js"></script>
  <script src="../../js/settings.js"></script>
  <script src="../../js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="../../js/chart.js"></script>
  <!-- End custom js for this page-->
  
   <script src="../../js/jquery-3.6.0.js"></script>
   <script>
   $(document).ready(function(){
   function getData() {
	   $.ajax({
			url:"../../donateService",
			type:"post",
			data:{	donate	: $("#donatedonate").val(),
					id		: $("#idid").val(),
					num		: $("#numnum").val()
			},
			success:function(result){
				if(result == 1){
					alert("��� �����մϴ�.");
					window.location = "donate.jsp"
				}else{
					alert("���� ���� �����մϴ�.");
				}
			},
			error: function(result){
				alert(result + "����");
			} 
		}) 
	}
   
  
   
   $("#donate13").on("click", getData);
   })
   </script>
   
   <!-- 
  
  <script>
 	$('#donate13').on('click', function() {
 		$.ajax({
 			//url
 			url : '../../donateService',
 			data : {donate : $('input[name="donate"]').val(),
 					id 	   : $('input[name="id"]').val(),
 					num	   : $('input[name="num"]').val()
 			},
 			type : 'post', 
 			success : function(result){ 
 				if(result==1){
 					alert("��μ���")
	 				//window.location = "donate.jsp"
 				}
 				else{
 					alert("���� ���� �����մϴ�.")
	 				//window.location = "join.html"
 				}
 			},
 			error : function(result){
 				alert("��û����!")
 			}
 		})
	})
   </script>
    -->
  
  
</body>

</html>
