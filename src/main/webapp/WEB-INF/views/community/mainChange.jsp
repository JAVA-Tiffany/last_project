<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" type="image/png" sizes="16x16"
	href="resources/plugins/images/favicon.png">
<title>Ample Admin Template - The Ultimate Multipurpose admin
	template</title>
<!-- Bootstrap Core CSS -->
<link href="resources/adbootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Menu CSS -->
<link
	href="resources/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css"
	rel="stylesheet">
<!-- toast CSS -->
<link
	href="resources/plugins/bower_components/toast-master/css/jquery.toast.css?aa"
	rel="stylesheet">
<!-- morris CSS -->
<link href="resources/plugins/bower_components/morrisjs/morris.css"
	rel="stylesheet">
<!-- chartist CSS -->
<!--     <link href="resources/plugins/bower_components/chartist-js/dist/chartist.min.css" rel="stylesheet"> -->
<!--     <link href="resources/plugins/bower_components/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.css" rel="stylesheet"> -->
<!-- animation CSS -->
<link href="resources/adcss/animate.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="resources/adcss/style.css?a" rel="stylesheet">
<!-- color CSS -->
<link href="resources/adcss/colors/default.css" id="theme"
	rel="stylesheet">
<title>공지사항 등록 페이지</title>
<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>

<style type="text/css">
.div1 {
	
}

.div2 {
	padding-top: 40px;
}
</style>
<style type="text/css">
.table {
	border-collapse: collapse;
	border-top: 3px solid #168;
}

.table th {
	color: #168;
	background: #f0f6f9;
	text-align: center;
}

.table th, .table td {
	padding: 10px;
	border: 1px solid #ddd;
}

.table th:first-child, .table td:first-child {
	border-left: 0;
}

.table th:last-child, .table td:last-child {
	border-right: 0;
}

.table tr td:first-child {
	text-align: center;
}

.table caption {
	caption-side: bottom;
	display: none;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</head>
<body class="fix-header">
	<c:if test="${sessionScope.id.split('_')[0] ne '/admin/' }">
		<script type="text/javascript">
   alert("관리자만 접근가능합니다")
   location.href="index"
</script>
	</c:if>
	<!-- ============================================================== -->
	<!-- Preloader -->
	<!-- ============================================================== -->
	<div class="preloader">
		<svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none"
				stroke-width="2" stroke-miterlimit="10" />
        </svg>
	</div>
	<!-- ============================================================== -->
	<!-- Wrapper -->
	<!-- ============================================================== -->
	<div id="wrapper">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->
		<nav class="navbar navbar-default navbar-static-top m-b-0">
			<div class="navbar-header">
				<div class="top-left-part">
					<!-- Logo -->
					<a href="index" style="color: black;"> <img class="img1"
						src="resources/img/MAKE1.PNG"
						style="width: 200px; height: 69PX; color: #F6F6F6;">
					</a>
				</div>
				<!-- /Logo -->
				<ul class="nav navbar-top-links navbar-right pull-right">
					<li><a
						class="nav-toggler open-close waves-effect waves-light hidden-md hidden-lg"
						href="javascript:void(0)"><i class="fa fa-bars"></i></a></li>
					<li><a class="profile-pic" href="#"> <img
							src="https://image.flaticon.com/icons/png/512/1421/1421222.png"
							alt="user-img" width="36" class="img-circle"><b
							class="hidden-xs">${sessionScope.id }</b></a></li>
				</ul>
			</div>
			<!-- /.navbar-header -->
			<!-- /.navbar-top-links -->
			<!-- /.navbar-static-side -->
		</nav>
		<!-- End Top Navigation -->
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav slimscrollsidebar">
				<div class="sidebar-head">
					<h3>
						<span class="fa-fw open-close"><i class="ti-close ti-menu"></i></span>
						<span class="hide-menu">Navigation</span>
					</h3>
				</div>
				<ul class="nav" id="side-menu">
					<li style="padding: 70px 0 0;"><a href="adminindex"
						class="waves-effect"><i class="fa fa-clock-o fa-fw"
							aria-hidden="true"></i>관리자 메인</a></li>
					<li><a href="acsearch" class="waves-effect"><i
							class="fa fa-user fa-fw" aria-hidden="true"></i>계정 관리</a></li>
					<li><a href="acboard" class="waves-effect"><i
							class="fa fa-user fa-fw" aria-hidden="true"></i>Q & A 관리</a></li>
					<li><a href="acnotice" class="waves-effect"><i
							class="fa fa-table fa-fw" aria-hidden="true"></i>공지사항 관리</a></li>
					<li><a href="QuantityManage" class="waves-effect"><i
							class="fa fa-font fa-fw" aria-hidden="true"></i>재고 관리</a></li>
					<li><a href="javascript:ad('accart');" class="waves-effect"><i
							class="fa fa-globe fa-fw" aria-hidden="true"></i>구매내역 관리</a></li>
					<li><a href="mainChange" class="waves-effect"><i
							class="fa fa-globe fa-fw" aria-hidden="true"></i>썸네일 관리</a></li>
					<li><a href="index" class="waves-effect"><i
							class="fa fa-columns fa-fw" aria-hidden="true"></i>메인으로 나가기</a></li>

				</ul>

			</div>

		</div>
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row bg-title">
					<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
						<h4 class="page-title">admin page</h4>
					</div>
					<div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">

						<ol class="breadcrumb">
							<li><a href="#">Dashboard</a></li>
						</ol>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<div class="row">
					<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
						<div class="white-box">
							<h3 class="box-title">MainPageModifiy</h3>

							<!--          여기서부터 쓰는애                  -->
							<div>
								<table border="1">
									<tr>
										<th>number</th>
										<th>img</th>
									</tr>
									<c:forEach var="bannerlist" items="${banner_list}">
										<tr>
											<td>${bannerlist.num}</td>
											<td><img src="${bannerlist.img }"
												style="width: 100%; height: 500px;"></td>
										</tr>
									</c:forEach>

								</table>
<!-- 								<input> -->
							</div>
						</div>
					</div>
				</div>


				<script
					src="resources/plugins/bower_components/jquery/dist/jquery.min.js"></script>
				<!-- Bootstrap Core JavaScript -->
				<script src="resources/adbootstrap/dist/js/bootstrap.min.js"></script>
				<!-- Menu Plugin JavaScript -->
				<script
					src="resources/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
				<!--slimscroll JavaScript -->
				<script src="resources/adjs/jquery.slimscroll.js"></script>
				<!--Wave Effects -->
				<script src="resources/adjs/waves.js"></script>
				<!--Counter js -->
				<script
					src="resources/plugins/bower_components/waypoints/lib/jquery.waypoints.js"></script>
				<script
					src="resources/plugins/bower_components/counterup/jquery.counterup.min.js"></script>
				<!-- chartist chart -->
				<script
					src="resources/plugins/bower_components/chartist-js/dist/chartist.min.js"></script>
				<script
					src="resources/plugins/bower_components/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.min.js"></script>
				<!-- Sparkline chart JavaScript -->
				<script
					src="resources/plugins/bower_components/jquery-sparkline/jquery.sparkline.min.js"></script>
				<!-- Custom Theme JavaScript -->
				<script src="resources/adjs/custom.min.js"></script>
				<script src="resources/adjs/dashboard1.js"></script>
				<script
					src="resources/plugins/bower_components/toast-master/js/jquery.toast.js?aa"></script>
</body>
</html>