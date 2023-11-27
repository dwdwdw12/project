<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Montana</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon"
	href="../resources/img/favicon.png">
<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="../resources/css/magnific-popup.css">
<link rel="stylesheet" href="../resources/css/font-awesome.min.css">
<link rel="stylesheet" href="../resources/css/themify-icons.css">
<link rel="stylesheet" href="../resources/css/nice-select.css">
<link rel="stylesheet" href="../resources/css/flaticon.css">
<link rel="stylesheet" href="../resources/css/gijgo.css">
<link rel="stylesheet" href="../resources/css/animate.css">
<link rel="stylesheet" href="../resources/css/slicknav.css">
<link rel="stylesheet" href="../resources/css/style.css">
<!-- <link rel="stylesheet" href="css/responsive.css"> -->
<script src="../resources/js/jquery-1.11.3.min.js"></script>

</head>

<body>
	<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

	<!-- header-start -->
	<header >
		<div class="header-area" style="background-color: rgba(255,255,255,0.5)">
			<div id="sticky-header" class="main-header-area">
				<div class="container-fluid p-0">
					<div class="row align-items-center no-gutters">
						<div class="col-xl-5 col-lg-6">
							<div class="main-menu  d-none d-lg-block">
								<nav>
									<ul id="navigation">
										<li><a href="index.html" href="#"><img
												src="../resources/img/kakao/chunsik.png" alt=""
												style="width: 60px"></a></li>
										<li><a href="index.html" href="/">home</a></li>
										<li><a href="/flight/list">flight<i class="ti-angle-down"></i></a>
											<ul class="submenu">
												<li><a href="/flight/list">Flight Schedule</a></li>
												<li><a href="single-blog.html">Flight Reservation</a></li>
												<li><a href="single-blog.html">AirPort</a></li>
												<li><a href="single-blog.html">Price Information</a></li>
											</ul></li>
										<li><a href="about.html" href="#">board<i
												class="ti-angle-down"></i></a>
											<ul class="submenu">
												<li><a href="blog.html">blog</a></li>
												<li><a href="single-blog.html">single-blog</a></li>
											</ul>
										</li>
										<sec:authorize access="isAuthenticated()">
											<li sec:authorize="hasRole('ROLE_MEMBER'))"><a href="/user" href="#">myPage(user)<i class="ti-angle-down"></i></a>
												<ul class="submenu">
													<li><a href="blog.html">회원정보 조회/수정</a></li>
													<li><a href="/user/chargePoint">포인트 충전</a></li>
													<li><a href="single-blog.html">체크인</a></li>
													<li><a href="single-blog.html">구매내역 조회</a></li>
												</ul>
											</li>
											<li sec:authorize="hasRole('ROLE_ADMIN')"><a href="/admin" href="#">myPage(admin)<i class="ti-angle-down"></i></a>
												<ul class="submenu">
													<li><a href="blog.html">회원조회</a></li>
													<li><a href="single-blog.html">항공스케줄 등록/수정</a></li>
												</ul>
											</li>
										</sec:authorize>
										<li><a href="/contact">Contact</a></li>
									</ul>
								</nav>
							</div>
						</div>
						<div class="col-xl-2 col-lg-4 ">
						<div class="main-menu  d-none d-lg-block">
							<nav>
								<ul id="navigation">
									<li><a href="/">Kakao airline</a></li>
								</ul>
							</nav>
						</div>		
						</div>
						<div class="col-xl-5 col-lg-4 d-none d-lg-block">
							<div class="book_room">
								<div class="socail_links">
									<ul>
										<li><a href="#">notice <!-- <i class="fa fa-facebook-square"></i> -->
										</a></li>
										<li><a href="#">event <!-- <i class="fa fa-twitter"></i> -->
										</a></li>
										<sec:authorize access="isAnonymous">
											<li><a href="/login"> login<!--  <i class="fa fa-instagram"></i>-->
											</a></li>
										</sec:authorize>
										<sec:authorize access="isAuthenticated()">
											<li><a class="logout" href="/logout">logout<!--  <i class="fa fa-instagram"></i>-->
											</a></li>
<%-- 										<form role="form" action="/logout" method="post">
											<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}">
											<button type="submit">logout</button>
										</form> --%>
											<p>
												<sec:authentication property="principal.username" />
												님 환영합니다!
												<sec:authentication property="principal.user" />
												<sec:authentication property="principal.user.authority" />
											</p>
											<form id="actionForm" action="/logout" method="post">
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
											</form>
										</sec:authorize>
									</ul>

								</div>
<%-- 								<div>
									<form role="form" action="/logout" method="post">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
									</form>
								</div> --%>
							</div>
						</div>
						<div class="col-12">
							<div class="mobile_menu d-block d-lg-none"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<script type="text/javascript">
		$(".logout").on("click","li a",function(e){
			e.preventDefault();
			alert("로그아웃을 진행합니다!");
			$("#actionForm").submit();
		});

	</script>
	<!-- header-end -->