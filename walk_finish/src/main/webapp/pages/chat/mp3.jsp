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
	HttpSession session2 = request.getSession();

	MemberVO vo = (MemberVO)session2.getAttribute("member");

%>

  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-5" href="../../index.jsp"><img src="../../images/logo.svg" class="mr-2" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="../../index.jsp"><img src="../../images/logo-mini.svg" alt="logo"/></a>
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
          	<%if(vo==null){ %>
            <a class="nav-link count-indicator dropdown-toggle" href="../../pages/samples/join.html" >
             	<i class="ti-info-alt text-primary" style=color:#ffffff>회원가입
             	</i>
             <%} %>
             	&nbsp;&nbsp;&nbsp;
             	<%if(vo!=null){ %>             	
             	<%if(vo.getId().equals("admin")){ %>
				<a href="../samples/selectmember.jsp">전체회원정보</a>							
				<%}} %>	
			</a>             
<!-- -------------알람 부분 ----------------------------------------------------------- -->
        	
          </li>          
<!--------------------------- 사진 클릭 부분 ----------------------------->
			<li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
              <img src="../../images/faces/n.jpg" alt="profile"/>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
              <%if(vo==null){ %>
              <a class="dropdown-item" href="../../pages/samples/login.html">
                <i class="ti-user text-primary"></i>
                로그인
              </a>
              <%} %>
              <%if(vo!=null){ %>   
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
              <i class="icon-bar-graph menu-icon"></i>
              <span class="menu-title">기부혀요</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="donate">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../donate/donate.jsp">기부혀요</a></li>
              </ul>
            </div>
          </li>          
<!-- ------복붙해야됨--------왼쪽 사이드바 채팅방 -------------------------------------------------- -->           
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#chat" aria-expanded="false" aria-controls="chat">
              <i class="icon-bar-graph menu-icon"></i>
              <span class="menu-title">채팅방</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="chat">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../chat/chat.jsp">게시판</a></li>
              </ul>
            </div>
          </li>          
<!-- ------복붙해야됨---------왼쪽 사이드바 랭킹-------------------------------------------- -->          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
              <i class="icon-grid-2 menu-icon"></i>
              <span class="menu-title">랭킹</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="tables">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../tables/basic-table.jsp">Basictable</a></li>
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
          
           <!-- -------복붙해야됨----------노래--------------------------------------------- -->          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#music" aria-expanded="false" aria-controls="auth">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">노래듣으면서하자</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="music">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="mp3.jsp"> 뮤직 </a></li>                
                <li class="nav-item"> <a class="nav-link" href="mp4.jsp"> 뮤직2 </a></li>                
              </ul>
            </div>
          </li>     
          
          <!-- -------복붙해야됨----------테트리스--------------------------------------------- -->            
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
          
              
          </ul>
          </nav>
     
     
     
     
     
     
     
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-lg-4 grid-margin stretch-card">
              <div class="card">
                <div class="card-body"> 
                  <p>001 아이유 - strawberry moon</p>
                  <audio controls>
                  <source src="../../music/001 아이유 - strawberry moon.mp3" type="audio/mp3">
                  </audio>
                  <p>002 aespa - Savage</p>
                  <audio controls>
                  <source src="../../music/002 aespa - Savage.mp3" type="audio/mp3">
                  </audio>                  
                  <p>004 The Kid LAROI, Justin Bieber - Stay</p>
                  <audio controls>
                  <source src="../../music/004 The Kid LAROI, Justin Bieber - Stay.mp3" type="audio/mp3">
                  </audio>
                  <p>005 이무진 - 신호등</p>
                  <audio controls>
                  <source src="../../music/005 이무진 - 신호등.mp3" type="audio/mp3">
                  </audio>
                  <p>006 경서예지, 전건호 - 다정히 내 이름을 부르면</p>
                  <audio controls>
                  <source src="../../music/006 경서예지, 전건호 - 다정히 내 이름을 부르면.mp3" type="audio/mp3">
                  </audio>
                  <p>007 Coldpla 방탄소년단 - My Universe</p>
                  <audio controls>
                  <source src="../../music/007 Coldplay, 방탄소년단 - My Universe.mp3" type="audio/mp3">
                  </audio>
                  <p>008 aespa - Next Level</p>
                  <audio controls>
                  <source src="../../music/008 aespa - Next Level.mp3" type="audio/mp3">
                  </audio>
                  <p>009 디핵 (D-Hack)  PATEKO (파테코) - OHAYO MY NIGHT</p>
                  <audio controls>
                  <source src="../../music/009 디핵 (D-Hack) & PATEKO (파테코) - OHAYO MY NIGHT.mp3" type="audio/mp3">
                  </audio>
                  <p>010 AKMU(악뮤) - 낙하 (With 아이유)</p>
                  <audio controls>
                  <source src="../../music/010 AKMU(악뮤) - 낙하 (With 아이유).mp3" type="audio/mp3">
                  </audio>
                   
                  </div>
              </div>
            </div>          
            
            <div class="col-lg-4 grid-margin stretch-card">
              <div class="card">
                <div class="card-body"> 
                  <p>014 MSG워너비 (M.O.M) - 바라만 본다</p>
                  <audio controls>
                  <source src="../../music/014 MSG워너비 (M.O.M) - 바라만 본다.mp3" type="audio/mp3">
                  </audio>                  
                  <p>016 태연(TAEYEON) - Weekend</p>
                  <audio controls>
                  <source src="../../music/016 태연(TAEYEON) - Weekend.mp3" type="audio/mp3">
                  </audio>
                  
                  <p>030 조정석 - 좋아좋아</p>
                  <audio controls>
                  <source src="../../music/030 조정석 - 좋아좋아.mp3" type="audio/mp3">
                  </audio>
                  <p>031 케이윌 (K.Will) - 시간을 거슬러 (낮에 뜨는 달 X 케이윌)</p>
                  <audio controls>
                  <source src="../../music/031 케이윌 (K.Will) - 시간을 거슬러 (낮에 뜨는 달 X 케이윌).mp3" type="audio/mp3">
                  </audio>                  
                  <p>034 전소미 - DUMB DUMB</p>
                  <audio controls>
                  <source src="../../music/034 전소미 - DUMB DUMB.mp3" type="audio/mp3">
                  </audio>
                 
                  <p>045 이무진 - 비와 당신</p>
                  <audio controls>
                  <source src="../../music/045 이무진 - 비와 당신.mp3" type="audio/mp3">
                  </audio>
                  <p>046 아이유(IU) - 내 손을 잡아</p>
                  <audio controls>
                  <source src="../../music/046 아이유(IU) - 내 손을 잡아.mp3" type="audio/mp3">
                  </audio>
                  <p>048 볼빨간사춘기 - 나비효과</p>
                  <audio controls>
                  <source src="../../music/048 볼빨간사춘기 - 나비효과.mp3" type="audio/mp3">
                  </audio>
                  
                  <p>051 헤이즈(Heize) - 비가 오는 날엔 (2021)</p>
                  <audio controls>
                  <source src="../../music/051 헤이즈(Heize) - 비가 오는 날엔 (2021).mp3" type="audio/mp3">
                  </audio>
                  </div>
              </div>
            </div>
            
            
                        
          </div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright  2021.  Premium <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap admin template</a> from BootstrapDash. All rights reserved.</span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="ti-heart text-danger ml-1"></i></span>
          </div>
        </footer>
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
    