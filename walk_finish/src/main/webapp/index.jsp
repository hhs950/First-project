<%@page import="Model_donate.donateVO"%>
<%@page import="Model_donate.donateDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.MemberDAO"%>
<%@page import="Model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="EUC-KR">
<meta name="viewport"
	content="width��=device-width, initial-scale=1, shrink-to-fit=no">
<title>walkers</title>
<!-- plugins:css -->
<link rel="stylesheet" href="vendors/feather/feather.css">
<link rel="stylesheet"
	href="vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
	href="vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" type="text/css"
	href="js/select.dataTables.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="css/vertical-layout-light/style.css">
<link rel="stylesheet" href="css/vertical-layout-light/calendarForm.css">
<link rel="stylesheet" href="css/vertical-layout-light/clock.css">
<!-- endinject -->
<link rel="shortcut icon" href="images/logo.svg" />

<!-- font link -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap"
	rel="stylesheet">

<style>
.card-body {
	font-family: 'Gamja Flower', cursive;
}
</style>


</head>
<body>
	<%
	HttpSession session2 = request.getSession();
	MemberVO vo = (MemberVO) session2.getAttribute("member");
	MemberVO vo2 = (MemberVO) session2.getAttribute("walk");

	MemberDAO dao = new MemberDAO();
	//---------------------------------------------------------------
	MemberVO vo3 = null;
	MemberVO vo4 = null;
	MemberVO vo5 = null;
	ArrayList<MemberVO> al = new ArrayList<MemberVO>();

	if (vo != null) {
		vo3 = dao.walk_today(vo.getId());
		vo4 = dao.step_today(vo.getId(), vo3.getWalk_date());
		vo5 = dao.walk_all(vo2.getId());
		//ArrayList<MemberVO>vo5 = dao.ChartData(vo.getId());
		al = dao.ChartData(vo2.getId());
		//for(int i = 0 ; i < al.size() ; i++){
		//	System.out.println(al.get(i).getWalk_today());
		//}
	}

	donateDAO dao1 = new donateDAO();
	ArrayList<donateVO> list = dao1.selectAll();
	%>

	<div class="container-scroller">
		<!-- partial:partials/_navbar.html -->

		<!-- ------------------------�׺�� ���� ----------------------------------------- -->
		<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
			<div
				class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
				<a class="navbar-brand brand-logo mr-5" href="index.jsp"><img
					src="images/logo.svg" class="mr-2" alt="logo" /></a> <a
					class="navbar-brand brand-logo-mini" href="index.jsp"><img
					src="images/logo.svg" alt="logo" /></a>
			</div>
			<div
				class="navbar-menu-wrapper d-flex align-items-center justify-content-end">

				<button class="navbar-toggler navbar-toggler align-self-center"
					type="button" data-toggle="minimize">
					<span class="icon-menu"></span>
				</button>
				<!----------------------- 1. ���� �׺��-------------------------------------- -->
				<ul class="navbar-nav mr-lg-2">
					<li class="nav-item nav-search d-none d-lg-block">
						<div class="input-group">
							<div class="input-group-prepend hover-cursor"
								id="navbar-search-icon">
								<span class="input-group-text" id="search"> <i
									class="icon-search"></i>
								</span>

							</div>
							<input type="text" class="form-control" id="navbar-search-input"
								placeholder="Search now" aria-label="search"
								aria-describedby="search">
						</div>

					</li>
				</ul>

				<!----------------------2. �׺�� ������ ��ü���� ------------------------------------->
				<ul class="navbar-nav navbar-nav-right">
					<li class="nav-item dropdown">&nbsp;&nbsp;&nbsp;</li>
					<!----------------  3.���� Ŭ�� �κ� (�α��� ȸ������ �α׾ƿ�)----------------------------->
					<li class="nav-item nav-profile dropdown"><a
						class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
						id="profileDropdown"> <!-- �����Ӥ��������� --> <%
 if (vo != null) {
 %> <%
 System.out.println(vo.getGender());
 if (vo.getGender().equals("m") || vo.getGender().equals("M")) {
 	System.out.println("����");
 %> <img src="images/faces/boy.jpg" alt="profile" /> <%
 } else {
 System.out.println("����");
 %> <img src="images/faces/girl.jpeg" alt="profile" /> <%
 }
 } else {
 %> <img src="images/faces/nono.png" alt="profile" /> <%
 }
 %>
					</a>
						<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
							aria-labelledby="profileDropdown">
							<%
							if (vo == null) {
							%>
							<a class="dropdown-item" href="pages/samples/join.html"> <i
								class="ti-info-alt text-primary" style="color: #ffffff"></i>
								ȸ������
							</a> <a class="dropdown-item" href="pages/samples/login.html"> <i
								class="ti-user text-primary"></i> �α���
							</a>
							<%
							}
							%>
							<%
							if (vo != null) {
							%>
							<%
							if (vo.getId().equals("admin")) {
							%>
							<a class="dropdown-item" href="pages/samples/selectmember.jsp">
								<i class="ti-more text-primary"></i> ��üȸ������
							</a>
							<%
							}
							%>

							<a class="dropdown-item" href="pages/samples/mypage.jsp"> <i
								class="ti-more text-primary"></i> ȸ����������
							</a> <a href="LogoutService" class="dropdown-item"> <i
								class="ti-power-off text-primary"></i> �α׾ƿ�
							</a>
							<%
							}
							%>
						</div></li>

					<!--  ----------------4. �׺�� ������ �� �޴�����------------------------------------------------ -->
					<li class="nav-item nav-settings d-none d-lg-flex"><a
						class="nav-link" href="#"> <i class="icon-ellipsis"></i>
					</a></li>
				</ul>
				<button
					class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
					type="button" data-toggle="offcanvas">
					<span class="icon-menu"></span>
				</button>
			</div>
		</nav>
		<!-- ------------------------ �׺�� �� -------------------------------------------------->
		<!-- partial -->

		<!-- -------------�����ʾƷ� �����κ�----------------------------------------------- -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_settings-panel.html -->
			<div class="theme-setting-wrapper">
				<div id="settings-trigger">
					<i class="ti-settings"></i>
				</div>
				<div id="theme-settings" class="settings-panel">
					<i class="settings-close ti-close"></i>
					<p class="settings-heading">SIDEBAR SKINS</p>
					<div class="sidebar-bg-options selected" id="sidebar-light-theme">
						<div class="img-ss rounded-circle bg-light border mr-3"></div>
						Light
					</div>
					<div class="sidebar-bg-options" id="sidebar-dark-theme">
						<div class="img-ss rounded-circle bg-dark border mr-3"></div>
						Dark
					</div>
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
			<!-- ----------------------------������ ���̵�� �κ� --------------------------------------------------------- -->
			<div id="right-sidebar" class="settings-panel">
				<i class="settings-close ti-close"></i>
				<!-- ----------------------------������ ���̵�� �κ� ���̺���Ʈ ����--------------------------------------------------------- -->
				<ul class="nav nav-tabs border-top" id="setting-panel"
					role="tablist">
					<li class="nav-item"><a class="nav-link active" id="todo-tab"
						data-toggle="tab" href="#todo-section" role="tab"
						aria-controls="todo-section" aria-expanded="true">������ ����</a></li>
					<li class="nav-item"><a class="nav-link" id="chats-tab"
						data-toggle="tab" href="#chats-section" role="tab"
						aria-controls="chats-section">CHATS</a></li>
				</ul>

				<!-- ----------------------------������ ���̵�� �κ� ���̺���Ʈ ���� ����--------------------------------------------------------- -->
				<div class="tab-content" id="setting-content">
					<div class="tab-pane fade show active scroll-wrapper"
						id="todo-section" role="tabpanel" aria-labelledby="todo-section">
						<div class="add-items d-flex px-3 mb-0">
							<form class="form w-100">
								<div class="form-group d-flex">
									<input type="text" class="form-control todo-list-input"
										placeholder="Add To-do">
									<button type="submit"
										class="add btn btn-primary todo-list-add-btn" id="add-task">����
										�߰�</button>
								</div>
							</form>
						</div>

						<!----------------------- ���� ����Ʈ ����------------------------------------>
						<div class="list-wrapper px-3">
							<ul class="d-flex flex-column-reverse todo-list">
								<li>
									<div class="form-check">
										<label class="form-check-label"> <input
											class="checkbox" type="checkbox"> Team review meeting
											at 3.00 PM
										</label>
									</div> <i class="remove ti-close"></i>
								</li>

								<li>
									<div class="form-check">
										<label class="form-check-label"> <input
											class="checkbox" type="checkbox"> Prepare for
											presentation
										</label>
									</div> <i class="remove ti-close"></i>
								</li>

								<li>
									<div class="form-check">
										<label class="form-check-label"> <input
											class="checkbox" type="checkbox"> Resolve all the low
											priority tickets due today
										</label>
									</div> <i class="remove ti-close"></i>
								</li>

								<li class="completed">
									<div class="form-check">
										<label class="form-check-label"> <input
											class="checkbox" type="checkbox" checked> Schedule
											meeting for next week
										</label>
									</div> <i class="remove ti-close"></i>
								</li>

								<li class="completed">
									<div class="form-check">
										<label class="form-check-label"> <input
											class="checkbox" type="checkbox" checked> Project
											review
										</label>
									</div> <i class="remove ti-close"></i>
								</li>
							</ul>
						</div>

						<!----------------------- ���� ����Ʈ ��------------------------------------>
					</div>

					<!-- ---------- ������ ���̵��  ä�� ���� ����--------------------------------------------->
					<!-- To do section tab ends -->
					<div class="tab-pane fade" id="chats-section" role="tabpanel"
						aria-labelledby="chats-section">
						<div
							class="d-flex align-items-center justify-content-between border-bottom">
							<p
								class="settings-heading border-top-0 mb-3 pl-3 pt-0 border-bottom-0 pb-0">Friends</p>
							<small
								class="settings-heading border-top-0 mb-3 pt-0 border-bottom-0 pb-0 pr-3 font-weight-normal">See
								All</small>
						</div>
						<ul class="chat-list">
							<li class="list active">
								<div class="profile">
									<img src="images/faces/face1.jpg" alt="image"><span
										class="online"></span>
								</div>
								<div class="info">
									<p>Thomas Douglas</p>
									<p>Available</p>
								</div> <small class="text-muted my-auto">19 min</small>
							</li>
							<li class="list">
								<div class="profile">
									<img src="images/faces/face2.jpg" alt="image"><span
										class="offline"></span>
								</div>
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
								<div class="profile">
									<img src="images/faces/face3.jpg" alt="image"><span
										class="online"></span>
								</div>
								<div class="info">
									<p>Daniel Russell</p>
									<p>Available</p>
								</div> <small class="text-muted my-auto">14 min</small>
							</li>
							<li class="list">
								<div class="profile">
									<img src="images/faces/face4.jpg" alt="image"><span
										class="offline"></span>
								</div>
								<div class="info">
									<p>James Richardson</p>
									<p>Away</p>
								</div> <small class="text-muted my-auto">2 min</small>
							</li>
							<li class="list">
								<div class="profile">
									<img src="images/faces/face5.jpg" alt="image"><span
										class="online"></span>
								</div>
								<div class="info">
									<p>Madeline Kennedy</p>
									<p>Available</p>
								</div> <small class="text-muted my-auto">5 min</small>
							</li>
							<li class="list">
								<div class="profile">
									<img src="images/faces/face6.jpg" alt="image"><span
										class="online"></span>
								</div>
								<div class="info">
									<p>Sarah Graves</p>
									<p>Available</p>
								</div> <small class="text-muted my-auto">47 min</small>
							</li>
						</ul>
					</div>
					<!-- chat tab ends -->
				</div>
			</div>
			<!-- ---------- ������ ���̵��  ä�� ���� �� -------------------------------------------->


			<!-- ------�����ؾߵ�------���� ���̵�� ---------------------------------------------------- -->
			<!-- partial -->
			<!-- partial:partials/_sidebar.html -->
			<nav class="sidebar sidebar-offcanvas" id="sidebar">
				<ul class="nav">
					<li class="nav-item"><a class="nav-link" href="index.jsp">
							<i class="icon-grid menu-icon"></i> <span class="menu-title">����������</span>
					</a></li>
					<!-- ------�����ؾߵ�------���� ���̵��   ������� --------------------------------- -->
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#donate" aria-expanded="false"
						aria-controls="donate"> <i class="mdi mdi-coin menu-icon"></i>
							<span class="menu-title">�������</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="donate">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="pages/donate/donate.jsp">�������</a></li>
							</ul>
						</div></li>
					<!-- ------�����ؾߵ�--------���� ���̵�� ��å���� -------------------------------------------------- -->
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#chat" aria-expanded="false"
						aria-controls="chat"> <i class="mdi mdi-walk menu-icon"></i> <span
							class="menu-title">��å����</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="chat">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="pages/chat/chat.jsp">�Խ���</a></li>
								<li class="nav-item"><a class="nav-link"
									href="pages/chat/walk.jsp">��å�ΰ˻�</a></li>
							</ul>
						</div></li>
					<!-- ------�����ؾߵ�---------���� ���̵�� ��ŷ-------------------------------------------- -->
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#tables" aria-expanded="false"
						aria-controls="tables"> <i class="icon-bar-graph menu-icon"></i>
							<span class="menu-title">��ŷ</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="tables">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="pages/tables/basic-table.jsp">��ŷ</a></li>
							</ul>
						</div></li>
					<!-- -------�����ؾߵ�----------ȸ����������--------------------------------------------- -->
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#auth" aria-expanded="false"
						aria-controls="auth"> <i class="icon-head menu-icon"></i> <span
							class="menu-title">ȸ����������</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="auth">
							<ul class="nav flex-column sub-menu">
								<%
								if (vo == null) {
								%>
								<li class="nav-item"><a class="nav-link"
									href="pages/samples/login.html"> �α��� </a></li>
								<li class="nav-item"><a class="nav-link"
									href="pages/samples/join.html"> ȸ������ </a></li>
								<%
								}
								%>
								<%
								if (vo != null) {
								%>
								<li class="nav-item"><a class="nav-link"
									href="pages/samples/mypage.jsp"> ȸ���������� </a></li>
								<li class="nav-item"><a class="nav-link"
									href="LogoutService"> �α׾ƿ� </a></li>
								<%
								}
								%>
							</ul>
						</div></li>

					<!-- ----------------�뷡  ������ ����--------------------------------------------- -->

					<!-- 
			<li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#music" aria-expanded="false" aria-controls="auth">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">�뷡�����鼭����</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="music">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/chat/mp3.jsp"> ���� </a></li>                
                <li class="nav-item"> <a class="nav-link" href="pages/chat/mp4.jsp"> ����2 </a></li>                
              </ul>
            </div>
          </li>  
          -->



					<!-- ----------------��Ʈ���� ������ ����--------------------------------------------- -->
					<!--
            <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#tetris" aria-expanded="false" aria-controls="auth">
              <i class="icon-grid-2 menu-icon"></i>
              <span class="menu-title">��Ʈ��������</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="tetris">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/tetris/tetris.html"> ��Ʈ���� </a></li>                              
              </ul>
            </div>
          </li> 
          -->

					<!-- -----------------���ð��� ������ ����--------------------------------------------- -->

					<!-- 
           <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#shoot" aria-expanded="false" aria-controls="auth">
              <i class="icon-grid-2 menu-icon"></i>
              <span class="menu-title">��������</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="shoot">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/shoot/shoot.html"> ���ð��� </a></li>                              
              </ul>
            </div>
          </li>           
         -->


					<!----------���� x----------���� ���̵�� ��Ʈ-------------------------------------------- -->

					<!-- 
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
              <i class="icon-bar-graph menu-icon"></i>
              <span class="menu-title">��Ʈ</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="charts">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/charts/chartjs.jsp">ChartJs</a></li>
              </ul>
            </div>
          </li>
          
           -->


					<!-- --------���� x------------���� ���̵�� ������------------------------------------------>
					<!-- 
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">�����ܹ�</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/buttons.html">��ư</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/dropdowns.html">Dropdowns</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">Ÿ�����׷���</a></li>
              </ul>
            </div>
          </li>
           
           -->


					<!-- -------���� x--------���� ���̵�� ������--------------------------------------------- -->

					<!-- 
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#icons" aria-expanded="false" aria-controls="icons">
              <i class="icon-contract menu-icon"></i>
              <span class="menu-title">������</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="icons">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/icons/mdi.html">Mdi icons</a></li>
              </ul>
            </div>
          </li>
           -->


				</ul>
			</nav>




			<!-- --------------�ٵ� �κ� -------------------------------------------------- -->
			<!-- partial -->

			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-md-12 grid-margin">

							<div style="text-align: center;" class="col-md-12 grid-margin">


								<div>
									<img src="images/logo.svg" id="loog" class="mr-2" alt="logo" />
								</div>



							</div>


						</div>
					</div>
					<div class="row">
						<div class="col-md-12 grid-margin">
							<div class="row">

								<div class="col-12 col-xl-8 mb-4 mb-xl-0">
									<%
									if (vo != null) {
									%>
									<h3 class="font-weight-bold">
										<%=vo.getNick()%>
										�Դ°�?
									</h3>
									<h6 class="font-weight-normal mb-0"
										style="font-family: 'Gamja Flower', cursive;">����� ��������
										������ ��ȭ��Ű����.</h6>
									<%
									} else {
									%>
									<h3 class="font-weight-bold">�α����� �ϼ��� :)</h3>
									<h6 class="font-weight-normal mb-0"
										style="font-family: 'Gamja Flower', cursive;">������ �� ������
										������ �����ø� �˴ϴ�.</h6>
									<%
									}
									%>
								</div>

								<div class="col-12 col-xl-4">
									<div class="justify-content-end d-flex">
										<div class="dropdown flex-md-grow-1 flex-xl-grow-0"></div>
									</div>
								</div>

							</div>
						</div>
					</div>


					<!----------------------------  ���� ����----------------------------------------------->

					<div class="row">
						<div class="col-md-6 grid-margin stretch-card">
							<div class="card tale-bg">
								<div class="showcase">
									<video src="images/dashboard/video.mp4" muted loop autoplay></video>
									<div class="weather-info">
										<div class="d-flex">

											<div class="weather">
												<div class="CurrIcon"></div>
												<div class="CurrTemp"></div>
												<div class="City"></div>
											</div>


										</div>
									</div>
								</div>
							</div>
						</div>


						<!-- ------------------------������ ������------------------------------------------ -->
						<div class="col-md-6 grid-margin transparent">
							<div class="row">
								<div class="col-md-6 mb-4 stretch-card transparent">
									<div class="card card-tale">
										<div class="card-body">

											<%
											if (vo != null) {
											%>
											<p class="mb-4">
												������ ���� ��(<%=vo3.getWalk_date().substring(2, 10)%>)
											</p>
											<p class="fs-30 mb-2"><%=vo4.getWalk_today()%></p>

											<%
											} else {
											%>
											<p class="mb-4">������ ���� ��</p>
											<p class="fs-30 mb-2">0</p>
											<%
											}
											%>

										</div>
									</div>
								</div>

								<!-- ------------------------�� ���� ��------------------------------------------ -->
								<div class="col-md-6 mb-4 stretch-card transparent">
									<div class="card card-dark-blue">
										<div class="card-body">

											<p class="mb-4">�� ���� ��</p>
											<%
											if (vo2 != null) {
											%>
											<p class="fs-30 mb-2"><%=vo5.getwalk_all()%></p>
											<%
											} else {
											%>
											<p class="fs-30 mb-2">0</p>
											<%
											}
											%>

										</div>
									</div>
								</div>
							</div>


							<!-- ------------------------ź��������------------------------------------------ -->
							<div class="row">
								<div class="col-md-6 mb-4 mb-lg-0 stretch-card transparent">
									<div class="card card-light-blue">
										<div class="card-body">


											<p class="mb-4">ź��������(���� �ҳ���)</p>
											<%
											if (vo2 != null) {
											%>
											<p class="fs-30 mb-2"><%=String.format("%.2f", (double) vo5.getwalk_all() / 10000)%>kg
												(<%=String.format("%.2f", (double) vo2.getwalk_all() / 50000)%>�׷�)
											</p>
											<%
											} else {
											%>
											<p class="fs-30 mb-2">0</p>
											<%
											}
											%>

										</div>
									</div>
								</div>
								<!-- ��������� -->
								<div class="col-md-6 mb-4 mb-lg-0 stretch-card transparent">
									<div class="card card-light-danger">
										<div class="card-body">
											<p class="mb-4">����� ���� ��</p>
											<%
											if (vo2 != null) {
											%>
											<p class="fs-30 mb-2"><%=vo5.getUser_donate()%></p>
											<%
											} else {
											%>
											<p class="fs-30 mb-2">0</p>
											<%
											}
											%>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- ---------------------- ���Ϻ� ������ ����ٷ� üũ------------------------------------------ -->

					<div class="row">
						<div class="col-md-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div id="sales-legend" class="chartjs-legend mt-4 mb-2"></div>
									<h4 align='center'>
										<������ ������>
									</h4>
									<canvas id="Chart" width="400" height="400"></canvas>
								</div>
							</div>
						</div>


						<!-- ----------------------  �޷� -------------------------------------------------- -->

						<div class="col-md-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body" style="padding: 2rem 3rem;">
									<p class="card-title">�޷�</p>
									<div id="calendarForm"></div>
									<br> <br> <br> <br>
									<!-- ----------------------  ���� -------------------------------------------------- -->
									<p class="card-title">����~~</p>
									���ѽð� : <B><span id="timeLeft"></span></B> ��<br> <br>
									<div id="answerBoard"></div>
									<br>

									<div id="question1" style="display: none">
										<b>1. �츮�� ������? ?</b><br> <a href="javascript:void(0)"
											onclick="check_answer('a')">a) ������</a><br> <a
											href="javascript:void(0)" onclick="check_answer('b')">b)
											����</a><br> <a href="javascript:void(0)"
											onclick="check_answer('c')">c) �輺��</a><br> <a
											href="javascript:void(0)" onclick="check_answer('d')">d)
											��ȿ��</a><br> <a href="javascript:void(0)"
											onclick="check_answer('e')">e) ���缱</a><br> <a
											href="javascript:void(0)" onclick="check_answer('f')">f)
											�̼���</a><br> <a href="javascript:void(0)"
											onclick="check_answer('g')">g) �ֿ�ȭ</a><br>
									</div>

									<div id="question2" style="display: none">
										<b>2. satellite�� ����?</b><br> <a href="javascript:void(0)"
											onclick="check_answer('a')">a) ���ϰ�</a><br> <a
											href="javascript:void(0)" onclick="check_answer('b')">b)
											�����</a><br> <a href="javascript:void(0)"
											onclick="check_answer('c')">c) ��ȭ ���</a><br> <a
											href="javascript:void(0)" onclick="check_answer('d')">d)
											����</a><br>
									</div>

									<div id="question3" style="display: none">
										<b>3. ���׸ǵ��� ã�Ƽ� ��Ŵ� �Ÿ���? </b><br> <a
											href="javascript:void(0)" onclick="check_answer('a')">a)
											�ֺ�Ÿ�</a><br> <a href="javascript:void(0)"
											onclick="check_answer('b')">b) �����Ÿ�</a><br> <a
											href="javascript:void(0)" onclick="check_answer('c')">c)
											�湫�ΰŸ�</a><br> <a href="javascript:void(0)"
											onclick="check_answer('d')">d) ��ã��</a><br>
									</div>

									<div id="question4" style="display: none">
										<b>4. nutrient�� ����?</b><br> <a href="javascript:void(0)"
											onclick="check_answer('a')">a) �����</a><br> <a
											href="javascript:void(0)" onclick="check_answer('b')">b)
											������</a><br> <a href="javascript:void(0)"
											onclick="check_answer('c')">c) �߷�</a><br> <a
											href="javascript:void(0)" onclick="check_answer('d')">d)
											����</a><br>
									</div>

									<div id="question5" style="display: none">
										<b>5. �ϴÿ��� �� ������?</b><br> <a href="javascript:void(0)"
											onclick="check_answer('a')">a) ���̸�Ʈ</a><br> <a
											href="javascript:void(0)" onclick="check_answer('b')">b)
											���̿���</a><br> <a href="javascript:void(0)"
											onclick="check_answer('c')">c) ���ֳ̾�</a><br> <a
											href="javascript:void(0)" onclick="check_answer('d')">d)
											�ȸ� ���׾�</a><br>
									</div>

									<div id="question6" style="display: none">
										<b>6. ���� ������� �Ӹ�ī�� ���� ��� ���ϸ�?</b><br> <a
											href="javascript:void(0)" onclick="check_answer('a')">a)
											�Ұ�</a><br> <a href="javascript:void(0)"
											onclick="check_answer('b')">b) ��� �Ұ�</a><br> <a
											href="javascript:void(0)" onclick="check_answer('c')">c)
											���Ѵ�</a><br> <a href="javascript:void(0)"
											onclick="check_answer('d')">d) 0</a><br>
									</div>
									<div id="quizScore" style="display: none"></div>
								</div>
							</div>
						</div>
					</div>


					<!-- -----------------------------�� �Ʒ�  ------------------------------------------------------------------------ -->

					<div class="row">
						<div class="col-md-6 grid-margin stretch-card">
							<div class="card position-relative">
								<div class="card-body">


									<div id="detailedReports"
										class="carousel slide detailed-report-carousel position-static pt-2"
										data-ride="carousel">


										<div class="carousel-inner">


											<div class="carousel-item active">



												<div class="row">

													<div
														class="col-md-12 col-xl-12 d-flex flex-column justify-content-start">
														<div class="ml-xl-12 mt-8" align="center">
															<p class="card-title">
																<a href="https://www.smhrd.or.kr/spts"><img
																	src='images/banner3.jpg' class='srcsett'
																	style="max-width: 100%; height: auto;"></a>
															</p>
															<h2 class="text-primary">����Ʈ���簳�߿�</h2>
															<h3 class="font-weight-500 mb-xl-12 text-primary">SMARTIER��������
																������!</h3>
															<p class="mb-12 mb-xl-0">�̹����� Ŭ���Ͻø� ��û�������� �̵��մϴ�!</p>
															<p>���� ���� ��Ź�帳�ϴ�!</p>
														</div>
													</div>

												</div>
											</div>


											<!-- ------------------------------------------------------------------------------------- -->

											<div class="carousel-item">

												<div class="row">
													<div
														class="col-md-12 col-xl-12 d-flex flex-column justify-content-start">
														<div class="ml-xl-4 mt-3" align="center">
															<p class="card-title">
																<a href="https://www.smhrd.or.kr"><img
																	src='images/banner1.jpg' class='srcsett'
																	style="max-width: 100%; height: auto;"></a>
															</p>
															<h2 class="text-primary">����Ʈ���簳�߿�</h2>
															<h3 class="font-weight-500 mb-xl-4 text-primary">������õ
																EVENT!</h3>
															<p class="mb-2 mb-xl-0">����� ������ ����!</p>
															<p>���� ���� ��Ź�帳�ϴ�!</p>
														</div>
													</div>

												</div>
											</div>
											<!-- -------------------------------------------------------------------------------------------------- -->


											<div class="carousel-item">
												<div class="row">
													<div
														class="col-md-12 col-xl-8 d-flex flex-column justify-content-start">
														<div class="ml-xl-4 mt-3" align="center">
															<p class="card-title">
																<a href="https://www.smhrd.or.kr/go"><img
																	src='images/banner2.jpg' class='srcsett'
																	style="max-width: 100%; height: auto;"></a>
															</p>
															<h2 class="text-primary">����Ʈ���簳�߿�</h2>
															<h3 class="font-weight-500 mb-xl-4 text-primary">�Ϲݱ�!������
																��������!</h3>
															<p class="mb-2 mb-xl-0">��������ȸ!</p>
															<p>���� ���� ��Ź�帳�ϴ�!</p>
														</div>
													</div>


												</div>
											</div>
										</div>


										<a class="carousel-control-prev" href="#detailedReports"
											role="button" data-slide="prev"> <span
											class="carousel-control-prev-icon" aria-hidden="true"></span>
											<span class="sr-only">Previous</span>
										</a> <a class="carousel-control-next" href="#detailedReports"
											role="button" data-slide="next"> <span
											class="carousel-control-next-icon" aria-hidden="true"></span>
											<span class="sr-only">Next</span>
										</a>
									</div>
								</div>
							</div>
						</div>



						<!-- --------------------------------2�� ------------------------------------------------------------------ -->
						<div class="col-md-6 grid-margin stretch-card">
							<div class="card position-relative">
								<div class="card-body">
									<div id="detailedReports1"
										class="carousel slide detailed-report-carousel position-static pt-2"
										data-ride="carousel">
										<div class="carousel-inner">
											<div class="carousel-item active">
												<div class="row">
													<div
														class="col-md-12 col-xl-12 d-flex flex-column justify-content-start">
														<div class="ml-xl-12 mt-8" align="center">
															<p class="card-title"></p>
															<p class="card-title">
																<a
																	href="pages/donate/donate_page1.jsp?num=<%=list.get(0).getNum()%>"><img
																	src="<%=list.get(0).getImg()%>"
																	style='max-width: 100%; height: auto';></a>
															</p>
															<h4 class="card-title"><%=list.get(0).getTitle().replace("\\r\\n", "<br>")%></h4>
															<h4 class="card-title"><%=list.get(0).getPlace()%></h4>
															<p>���� ���� ��Ź�帳�ϴ�!</p>
														</div>
													</div>
												</div>
											</div>

											<!-- ------------------------------------------------------------------------------------- -->
											<%
											for (int i = 1; i < list.size(); i++) {
											%>
											<div class="carousel-item">

												<div class="row">
													<div
														class="col-md-12 col-xl-12 d-flex flex-column justify-content-start">
														<div class="ml-xl-4 mt-3" align="center">
															<p class="card-title">
																<a
																	href="pages/donate/donate_page1.jsp?num=<%=list.get(i).getNum()%>"><img
																	src="<%=list.get(i).getImg()%>"
																	style='max-width: 100%; height: auto';></a>
															</p>
															<h4 class="card-title"><%=list.get(i).getTitle().replace("\\r\\n", "<br>")%></h4>
															<h4 class="card-title"><%=list.get(i).getPlace()%></h4>
															<p>���� ���� ��Ź�帳�ϴ�!</p>
														</div>
													</div>

												</div>
											</div>
											<%
											}
											%>
										</div>
										<a class="carousel-control-prev" href="#detailedReports1"
											role="button" data-slide="prev"> <span
											class="carousel-control-prev-icon" aria-hidden="true"></span>
											<span class="sr-only">Previous</span>
										</a> <a class="carousel-control-next" href="#detailedReports1"
											role="button" data-slide="next"> <span
											class="carousel-control-next-icon" aria-hidden="true"></span>
											<span class="sr-only">Next</span>
										</a>
									</div>
								</div>
							</div>
						</div>

					</div>

				</div>

				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.html -->
				<footer class="footer">
					<div
						class="d-sm-flex justify-content-center justify-content-sm-between">
						<span
							class="text-muted text-center text-sm-left d-block d-sm-inline-block">Corporation
							2021. Premium <a href="https://www.smhrd.or.kr/" target="_blank"><strong>walkers</strong></a>
						</span> <span
							class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">��ǥ��:
							������ <i class="ti-heart text-danger ml-1"></i>
						</span>
					</div>
					<div
						class="d-sm-flex justify-content-center justify-content-sm-between">
					</div>
				</footer>


				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>


	<!-- plugins:js -->
	<script src="vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<script src="vendors/chart.js/Chart.min.js"></script>
	<script src="vendors/datatables.net/jquery.dataTables.js"></script>
	<script src="vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
	<script src="js/dataTables.select.min.js"></script>

	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="js/off-canvas.js"></script>
	<script src="js/hoverable-collapse.js"></script>
	<script src="js/template.js"></script>
	<script src="js/settings.js"></script>
	<script src="js/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page-->
	<script src="js/dashboard.js"></script>
	<script src="js/Chart.roundedBarCharts.js"></script>

	<!--  �߰���js -->
	<script src="js/calendar1.js"></script>
	<!--  <script src="js/clock.js"></script>-->


	<!-- End custom js for this page-->

	<!-----------------(��Ʈ����) ��Ʈ ���� ---------------->
	<script>
	const btx = document.getElementById('Chart').getContext('2d');
	const myChart = new Chart(btx, {
		type: 'bar',
		data: {
			<%if (vo != null) {%>
				labels: [
					
			<%for (int i = al.size() - 1; i >= 0; i--) {%>
					'<%=al.get(i).getWalk_date().substring(0, 10)%>',
			<%}%>
 				],
				datasets: [{
					label: '�ֱ� ���� ������',
					data: [
						<%for (int i = al.size() - 1; i >= 0; i--) {%>
							'<%=al.get(i).getWalk_today()%>',
						<%}%>
					],
			<%} else {%>
				labels: ['2021', '2021', '2021', '2021', '2021', '2021','2021'],
				datasets: [{
							label: '�α��� ���ּ���',
							data: [0, 0, 0, 0, 0, 0, 0],
			<%}%>
							backgroundColor: [
                								'rgba(255, 99, 132, 0.2)' ,
                								'rgba(54, 162, 235, 0.2)' ,
                								'rgba(255, 206, 86, 0.2)' ,
                								'rgba(75, 192, 192, 0.2)' ,
                								'rgba(153, 102, 255, 0.2)',
                								'rgba(255, 159, 64, 0.2)'
            				],
							borderColor: [
                								'rgba(255, 99, 132, 1)' ,
                 								'rgba(54, 162, 235, 1)' ,
                 								'rgba(255, 206, 86, 1)' ,
                 								'rgba(75, 192, 192, 1)' ,
                 								'rgba(153, 102, 255, 1)',
                 								'rgba(255, 159, 64, 1)'
							],
							borderWidth: 1
							}]
    				},
				options: {
					 legend: {
					      display: false

				},
							scales: {
            				yAxes:[{
            					ticks: {
								beginAtZero: true,
								min:0
            					}
           					}]
			}
		}
	});
</script>


	<!--------------------- ����------------------- -->

	<script language="javascript">


var delay=20; //�ð�����
var correctAnswers=new Array("b","d","b","a","c","d");  //����

var q_num=1;
var timer;
var layer;
var clock=delay;
var score=0;

function show_question(){
	if (layer=eval("document.all.question"+q_num)){
		layer.style.display="inline";
		document.all.timeLeft.innerHTML=clock;
		hide_question();
	} else {
		document.all.timeLeft.innerHTML=0;
		document.all.quizScore.innerHTML="����� "+(q_num-1)+"������ "+score+"���� ������ϴ�.";
		document.all.quizScore.style.display="inline";
	}
}

function hide_question(){
	if (clock>0) {
		document.all.timeLeft.innerHTML=clock;
		clock--;
		timer=setTimeout("hide_question()",1000);
	} else {
		clearTimeout(timer);
		document.all.answerBoard.innerHTML=" ";
		clock=delay;
		layer.style.display="none";
		q_num++;
		show_question();
	}
}

function check_answer(answer){
	if (correctAnswers[q_num-1]==answer){
		score++;
		document.all.answerBoard.innerHTML="<font color=blue><b>�����Դϴ�.</b></font>";
	} else {
		document.all.answerBoard.innerHTML="<font color=red><b>��! Ʋ�Ƚ��ϴ�.</b></font>";
	}
	clock=0;
	clearTimeout(timer);
	timer=setTimeout("hide_question()",700);
}

window.onload=show_question;
</script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

	<!--  nav-bar  �ð� -->


	<!--   ���� �����ٿ�~~~~~~~ -->
	<script type="text/javascript">
(function ()
		{
		    function k(a, b, c)
		    {
		        if (a.addEventListener) {
		            a.addEventListener(b, c, false);
		        }
		        else {
		            a.attachEvent && a.attachEvent("on" + b, c);
		        }
		    }
		    function g(a)
		    {
		        if (typeof window.onload != "function")
		        {
		            window.onload = a;
		        }
		        else {
		            var b = window.onload;
		            window.onload = function ()
		            {
		                b();
		                a()
		            }
		        }
		    }
		    function h()
		    {
		        var a = {};
		        for (type in {
		            Top : "", Left : ""
		        })
		        {
		            var b = type == "Top" ? "Y" : "X";
		            if (typeof window["page" + b + "Offset"] != "undefined") {
		                a[type.toLowerCase()] = window["page" + b + "Offset"];
		            }
		            else
		            {
		                b = document.documentElement.clientHeight ? document.documentElement : document.body;
		                a[type.toLowerCase()] = b["scroll" + type];
		            }
		        }
		        return a
		    }
		    function l()
		    {
		        var a = document.body, b;
		        if (window.innerHeight) {
		            b = window.innerHeight;
		        }
		        else if (a.parentElement.clientHeight) {
		            b = a.parentElement.clientHeight;
		        }
		        else if (a && a.clientHeight) {
		            b = a.clientHeight;
		        }
		        return b
		    }
		    function i(a)
		    {
		        this.parent = document.body;
		        this.createEl(this.parent, a);
		        this.size = Math.random() * 5 + 5;
		        this.el.style.width = Math.round(this.size) + "px";
		        this.el.style.height = Math.round(this.size) + "px";
		        this.maxLeft = document.body.offsetWidth - this.size;
		        this.maxTop = document.body.offsetHeight - this.size;
		        this.left = Math.random() * this.maxLeft;
		        this.top = h().top + 1;
		        this.angle = 1.4 + 0.2 * Math.random();
		        this.minAngle = 1.4;
		        this.maxAngle = 1.6;
		        this.angleDelta = 0.01 * Math.random();
		        this.speed = 2 + Math.random()
		    }
		    var j = false;
		    g(function ()
		    {
		        j = true;
		    });
		    var f = true;
		    window.createSnow = function (a, b)
		    {
		        if (j)
		        {
		            var c = [], m = setInterval(function ()
		            {
		                f && b > c.length && Math.random() < b * 0.0025 && c.push(new i(a));
		                !f && !c.length && clearInterval(m);
		                for (var e = h().top, n = l(), d = c.length - 1; d >= 0; d--) if (c[d]) if (c[d].top < e || c[d].top + c[d].size + 1 > e + n) {
		                    c[d].remove();
		                    c[d] = null;
		                    c.splice(d, 1)
		                }
		                else {
		                    c[d].move();
		                    c[d].draw()
		                }
		            }, 40);
		            k(window, "scroll", function ()
		            {
		                for (var e = c.length - 1; e >= 0; e--) {
		                    c[e].draw();
		                }
		            })
		        }
		        else {
		            g(function () 
		            {
		                createSnow(a, b) 
		            });
		        }
		    };
		    window.removeSnow = function ()
		    {
		        f = false;
		    };
		    i.prototype = 
		    {
		        createEl : function (a, b)
		        {
		            this.el = document.createElement("img");
		            this.el.setAttribute("src", b + "snow" + Math.floor(Math.random() * 4) + ".gif");
		            this.el.style.position = "absolute";
		            this.el.style.display = "block";
		            this.el.style.zIndex = "99999";
		            this.parent.appendChild(this.el)
		        },
		        move : function ()
		        {
		            if (this.angle < this.minAngle || this.angle > this.maxAngle) {
		                this.angleDelta =- this.angleDelta;
		            }
		            this.angle += this.angleDelta;
		            this.left += this.speed * Math.cos(this.angle * Math.PI);
		            this.top -= this.speed * Math.sin(this.angle * Math.PI);
		            if (this.left < 0) {
		                this.left = this.maxLeft;
		            }
		            else if (this.left > this.maxLeft) {
		                this.left = 0;
		            }
		        },
		        draw : function ()
		        {
		            this.el.style.top = Math.round(this.top) + "px";
		            this.el.style.left = Math.round(this.left) + "px";
		        },
		        remove : function ()
		        {
		            this.parent.removeChild(this.el);
		            this.parent = this.el = null;
		        }
		    }
		})();
</script>
	<script>
		//------------ ./�� �̹��� ���, 1000�� �� ����(ũ�� Ŭ���� ������ �����ϴ�.)
    createSnow('', 50);
</script>




	<script defer
		src="https://use.fontawesome.com/releases/v5.15.2/js/all.js"
		integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF"
		crossorigin="anonymous"></script>

<script type="text/javascript">
$(document).ready(function() {
	let weatherIcon = {
		'01' : 'fas fa-sun',
		'02' : 'fas fa-cloud-sun',
		'03' : 'fas fa-cloud',
		'04' : 'fas fa-cloud-meatball',
		'09' : 'fas fa-cloud-sun-rain',
		'10' : 'fas fa-cloud-showers-heavy',
		'11' : 'fas fa-poo-storm',
		'13' : 'far fa-snowflake',
		'50' : 'fas fa-smog'
	};
	$.ajax({
		url:'http://api.openweathermap.org/data/2.5/weather?q=Gwangju&APPID=4ab692fe9f58de823beae8b85be6d44a&units=metric',
		dataType:'json',
		type:'GET',
		success:function(data){
			var $Icon = (data.weather[0].icon).substr(0,2);
			var $Temp = Math.floor(data.main.temp) + '��';
			var $city = data.name;
			$('.CurrIcon').append('<i class="' + weatherIcon[$Icon] +'"></i>');
			$('.CurrTemp').prepend($Temp);
			$('.City').append($city);
		}
	})
});
</script>






</body>

</html>


