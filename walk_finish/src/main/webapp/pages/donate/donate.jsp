<%@page import="Model_donate.donateVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model_donate.donateDAO"%>
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
  <link rel="stylesheet" href="../../vendors/mdi/css/materialdesignicons.min.css">
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
  	.card-body{
  		text-align : center;
  	}
  </style>
</head>


<body>

<%
	HttpSession session2 = request.getSession();

	MemberVO vo = (MemberVO)session2.getAttribute("member");
	
	donateDAO dao = new donateDAO();
	ArrayList<donateVO> list =dao.selectAll();


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
        
        
        
        <!-------   복붙 시작-------------------  로그인 아이콘 --------------------------------->
        <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item dropdown">          	
             	&nbsp;&nbsp;&nbsp;
             	
          </li>          
<!--------------------------- 사진 클릭 부분 ----------------------------->
		<li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
            <!-- 여기임ㅇㅇㅇㅇㅇ -->
            <%if(vo !=null){ %>
            	<%System.out.println(vo.getGender());
            	if(vo.getGender().equals("m") || vo.getGender().equals("M")){ 
            		System.out.println("남자");
            	%>
             	 <img src="../../images/faces/boy.jpg" alt="profile"/>
            	<%}else{ 
            		System.out.println("여자");%>
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
             	회원가입 
             	</a>	
              <a class="dropdown-item" href="../../pages/samples/login.html">
              	<i class="ti-user text-primary"></i>
                로그인
              </a>
              <%} %>
              <%if(vo!=null){ %> 
                <%if(vo.getId().equals("admin")){ %>
				<a class="dropdown-item" href="../../pages/samples/selectmember.jsp">
				<i class="ti-more text-primary"></i>
				전체회원정보</a><%} %>
						
              <a class="dropdown-item" href="../../pages/samples/mypage.jsp">
              	<i class="ti-more text-primary"></i>
                회원정보수정
              </a>
              <a href="../../LogoutService" class="dropdown-item">
                <i class="ti-power-off text-primary"></i>
                로그아웃
              </a>
              <%} %>
            </div>
          </li>
          
          
          
          
          
          
          
         	<li class="nav-item nav-settings d-none d-lg-flex">
            <a class="nav-link" href="#">
              <i class="icon-ellipsis"></i>
            </a>
          </li>          
        </ul> 
         <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
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
        <div class="tab-content" id="setting-content">
          <div class="tab-pane fade show active scroll-wrapper" id="todo-section" role="tabpanel" aria-labelledby="todo-section">
            <div class="add-items d-flex px-3 mb-0">
              <form class="form w-100">
                <div class="form-group d-flex">
                  <input type="text" class="form-control todo-list-input" placeholder="Add To-do">
                  <button type="submit" class="add btn btn-primary todo-list-add-btn" id="add-task">Add</button>
                </div>
              </form>
            </div>
            <div class="list-wrapper px-3">
              <ul class="d-flex flex-column-reverse todo-list">
                <li>
                  <div class="form-check">
                    <label class="form-check-label">
                      <input class="checkbox" type="checkbox">
                      Team review meeting at 3.00 PM
                    </label>
                  </div>
                  <i class="remove ti-close"></i>
                </li>
                <li>
                  <div class="form-check">
                    <label class="form-check-label">
                      <input class="checkbox" type="checkbox">
                      Prepare for presentation
                    </label>
                  </div>
                  <i class="remove ti-close"></i>
                </li>
                <li>
                  <div class="form-check">
                    <label class="form-check-label">
                      <input class="checkbox" type="checkbox">
                      Resolve all the low priority tickets due today
                    </label>
                  </div>
                  <i class="remove ti-close"></i>
                </li>
                <li class="completed">
                  <div class="form-check">
                    <label class="form-check-label">
                      <input class="checkbox" type="checkbox" checked>
                      Schedule meeting for next week
                    </label>
                  </div>
                  <i class="remove ti-close"></i>
                </li>
                <li class="completed">
                  <div class="form-check">
                    <label class="form-check-label">
                      <input class="checkbox" type="checkbox" checked>
                      Project review
                    </label>
                  </div>
                  <i class="remove ti-close"></i>
                </li>
              </ul>
            </div>
            <h4 class="px-3 text-muted mt-5 font-weight-light mb-0">Events</h4>
            <div class="events pt-4 px-3">
              <div class="wrapper d-flex mb-2">
                <i class="ti-control-record text-primary mr-2"></i>
                <span>Feb 11 2018</span>
              </div>
              <p class="mb-0 font-weight-thin text-gray">Creating component page build a js</p>
              <p class="text-gray mb-0">The total number of sessions</p>
            </div>
            <div class="events pt-4 px-3">
              <div class="wrapper d-flex mb-2">
                <i class="ti-control-record text-primary mr-2"></i>
                <span>Feb 7 2018</span>
              </div>
              <p class="mb-0 font-weight-thin text-gray">Meeting with Alisa</p>
              <p class="text-gray mb-0 ">Call Sarah Graves</p>
            </div>
          </div>
          <!-- To do section tab ends -->
          <div class="tab-pane fade" id="chats-section" role="tabpanel" aria-labelledby="chats-section">
            <div class="d-flex align-items-center justify-content-between border-bottom">
              <p class="settings-heading border-top-0 mb-3 pl-3 pt-0 border-bottom-0 pb-0">Friends</p>
              <small class="settings-heading border-top-0 mb-3 pt-0 border-bottom-0 pb-0 pr-3 font-weight-normal">See All</small>
            </div>
            <ul class="chat-list">
              <li class="list active">
                <div class="profile"><img src="images/faces/face1.jpg" alt="image"><span class="online"></span></div>
                <div class="info">
                  <p>Thomas Douglas</p>
                  <p>Available</p>
                </div>
                <small class="text-muted my-auto">19 min</small>
              </li>
              <li class="list">
                <div class="profile"><img src="images/faces/face2.jpg" alt="image"><span class="offline"></span></div>
                <div class="info">
                  <div class="wrapper d-flex">
                    <p>Catherine</p>
                  </div>
                  <p>Away</p>
                </div>
                <div class="badge badge-success badge-pill my-auto mx-2">4</div>
                <small class="text-muted my-auto">23 min</small>
              </li>
              <li class="list">
                <div class="profile"><img src="images/faces/face3.jpg" alt="image"><span class="online"></span></div>
                <div class="info">
                  <p>Daniel Russell</p>
                  <p>Available</p>
                </div>
                <small class="text-muted my-auto">14 min</small>
              </li>
              <li class="list">
                <div class="profile"><img src="images/faces/face4.jpg" alt="image"><span class="offline"></span></div>
                <div class="info">
                  <p>James Richardson</p>
                  <p>Away</p>
                </div>
                <small class="text-muted my-auto">2 min</small>
              </li>
              <li class="list">
                <div class="profile"><img src="images/faces/face5.jpg" alt="image"><span class="online"></span></div>
                <div class="info">
                  <p>Madeline Kennedy</p>
                  <p>Available</p>
                </div>
                <small class="text-muted my-auto">5 min</small>
              </li>
              <li class="list">
                <div class="profile"><img src="images/faces/face6.jpg" alt="image"><span class="online"></span></div>
                <div class="info">
                  <p>Sarah Graves</p>
                  <p>Available</p>
                </div>
                <small class="text-muted my-auto">47 min</small>
              </li>
            </ul>
          </div>
          <!-- chat tab ends -->
        </div>
      </div>
      
       
<!-- ------복붙해야됨------왼쪽 사이드바 ---------------------------------------------------- -->
      <!-- partial -->
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="../../index.jsp">
              <i class="icon-grid menu-icon"></i>
              <span class="menu-title">메인페이지</span>
            </a>
          </li>      
<!-- ------복붙해야됨------왼쪽 사이드바   기부혀요 --------------------------------- -->
          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#donate" aria-expanded="false" aria-controls="donate">
              <i class="mdi mdi-coin menu-icon"></i>
              <span class="menu-title">기부혀요</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="donate">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../donate/donate.jsp">기부혀요</a></li>
              </ul>
            </div>
          </li>          
<!-- ------복붙해야됨--------왼쪽 사이드바 산책혀요 -------------------------------------------------- -->           
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#chat" aria-expanded="false" aria-controls="chat">
              <i class="mdi mdi-walk menu-icon"></i>
              <span class="menu-title">산책혀요</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="chat">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../chat/chat.jsp">게시판</a></li>
                <li class="nav-item"> <a class="nav-link" href="../chat/walk.jsp">산책로검색</a></li>
              </ul>
            </div>
          </li>          
<!-- ------복붙해야됨---------왼쪽 사이드바 랭킹-------------------------------------------- -->          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
              <i class="icon-bar-graph menu-icon"></i>
              <span class="menu-title">랭킹</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="tables">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../tables/basic-table.jsp">랭킹</a></li>
              </ul>
            </div>
          </li>
<!-- -------복붙해야됨----------회원정보수정--------------------------------------------- -->
           
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">회원정보수정</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
              <ul class="nav flex-column sub-menu">
                <%if(vo==null){ %>              
                <li class="nav-item"> <a class="nav-link" href="../samples/login.html"> 로그인 </a></li>
                <li class="nav-item"> <a class="nav-link" href="../samples/join.html"> 회원가입 </a></li>                
                <%} %>
                <%if(vo!=null){ %>
                <li class="nav-item"> <a class="nav-link" href="../samples/mypage.jsp"> 회원정보수정 </a></li>
                <li class="nav-item"> <a class="nav-link" href="../../LogoutService"> 로그아웃 </a></li>
                <%} %>
              </ul>
            </div>
          </li>
          
<!-- -----------------노래 페이지--------------------------------------------- -->
		  <!--            
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#music" aria-expanded="false" aria-controls="auth">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">노래듣으면서하자</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="music">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../chat/mp3.jsp"> 뮤직 </a></li>                
                <li class="nav-item"> <a class="nav-link" href="../chat/mp4.jsp"> 뮤직2 </a></li>                
              </ul>
            </div>
          </li>
          -->     
          
<!-- -----------------테트리스 페이지--------------------------------------------- -->
          <!--    
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#tetris" aria-expanded="false" aria-controls="auth">
              <i class="icon-grid-2 menu-icon"></i>
              <span class="menu-title">테트리스하자</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="tetris">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../tetris/tetris.html"> 테트리스 </a></li> 
              </ul>
            </div>
          </li>
          -->  
          
<!-- -----------------슈팅게임 페이지--------------------------------------------- --> 
          <!--   
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#shoot" aria-expanded="false" aria-controls="auth">
              <i class="icon-grid-2 menu-icon"></i>
              <span class="menu-title">슈팅하자</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="shoot">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../shoot/shoot.html"> 슈팅게임 </a></li>                              
              </ul>
            </div>
          </li>
          -->     
          
              
          </ul>
          </nav>
      
      
      <!-- 여기부터 기부페이지 -->
      <div class="main-panel">
        <div class="content-wrapper">
      <%for(int i = 0; i<list.size(); i++){ %>
          <div class="row">
            <div class="col-lg-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h2 class="card-title"><%=list.get(i).getTitle().replace("\\r\\n", "<br><br>")%></h2>
                  <h6 class="card-subtitle" style = " font-size: 1rem; font-weight: 400; margin-top: 0.625rem; margin-bottom: 0.625rem;"><%=list.get(i).getPlace()%></h6>
                  
                  <a href="donate_page1.jsp?num=<%=list.get(i).getNum()%>"><img src="<%=list.get(i).getImg()%>"  style = 'max-width : 100%; height : auto';></a>
                </div>
              </div>
            </div>
            <div class="col-lg-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h2 class="card-title"><%=list.get(i+1).getTitle().replace("\\r\\n", "<br><br>")%></h2>
                  <h6 class="card-subtitle"  style = " font-size: 1rem; font-weight: 400; margin-top: 0.625rem; margin-bottom: 0.625rem;"><%=list.get(i+1).getPlace()%></h6>
                  <a href="donate_page1.jsp?num=<%=list.get(i+1).getNum()%>"><img src="<%=list.get(i+1).getImg()%>"  style = 'max-width : 100%; height : auto';></a>
                  <%i++; %>
                </div>
              </div>
            </div>
          </div>
          <%} %>
         
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
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
</body>

</html>
