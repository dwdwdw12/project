<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	href="/resources/img/favicon.png">
<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/themify-icons.css">
<link rel="stylesheet" href="/resources/css/nice-select.css">
<link rel="stylesheet" href="/resources/css/flaticon.css">
<link rel="stylesheet" href="/resources/css/gijgo.css">
<link rel="stylesheet" href="/resources/css/animate.css">
<link rel="stylesheet" href="/resources/css/slicknav.css">
<link rel="stylesheet" href="/resources/css/style.css">
<!-- <link rel="stylesheet" href="css/responsive.css"> -->
<script src="/resources/js/jquery-1.11.3.min.js"></script>
<style>
@media ( min-width :768px) {
	#kako-talk-channel-chat-button {
		position: fixed;
		z-index: 999;
		margin: 0 0 0 20px;
		right: 30px;
		bottom: 30px;
	}
}

@media ( max-width :767px) {
	#kako-talk-channel-chat-button {
		position: fixed;
		z-index: 999;
		margin: 0 0 0 20px;
		right: 15px;
		bottom: 30px;
	}
}

#adminTalk {
	border-radius: 15px;
	background-color: #FFC107;
	border: none;
	font-size: 12px;
}
</style>
</head>

<body>
	<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

	<!-- header-start -->
	<header>
		<div class="header-area"
			style="background-color: rgba(255, 255, 255, 0.5)">
			<div id="sticky-header" class="main-header-area">
				<div class="container-fluid p-0">
					<div class="row align-items-center no-gutters">
						<div class="col-xl-5 col-lg-6">
							<div class="main-menu  d-none d-lg-block">
								<nav>
									<ul id="navigation">
										<li><a href="/"><img
												src="/resources/img/kakao/chunsik.png" alt=""
												style="width: 60px"></a></li>
										<li><a href="/">Home</a></li>
										<li><a href="/flight/list">flight<i
												class="ti-angle-down"></i></a>
											<ul class="submenu">
												<li><a href="/flight/list">Flight Schedule</a></li>
												<li><a href="single-blog.html">Flight Reservation</a></li>
												<li><a href="single-blog.html">AirPort</a></li>
												<li><a href="single-blog.html">Price Information</a></li>
												<li><a href="/flight/flightDepArrSearch">Flight
														Status</a></li>
											</ul></li>
										<li><a href="about.html" href="#">board<i
												class="ti-angle-down"></i></a>
											<ul class="submenu">
												<li><a href="blog.html">blog</a></li>
												<li><a href="single-blog.html">single-blog</a></li>
											</ul></li>
										<sec:authorize access="isAuthenticated()">
										<c:choose>
										<c:when test="${loginUser.authority[0].getAuthority() == 'ROLE_MEMBER'}">
											<li ><a
												href="/user" href="#">myPage(user)<i
													class="ti-angle-down"></i></a>
												<ul class="submenu">
													<li><a href="blog.html">회원정보 조회/수정</a></li>
													<li><a href="/user/chargePoint">포인트 충전</a></li>
													<li><a href="single-blog.html">체크인</a></li>
													<li><a href="single-blog.html">구매내역 조회</a></li>
												</ul></li>
												</c:when>
										<c:otherwise>
										<li ><a
												href="/user" href="#">myPage(user)<i
													class="ti-angle-down"></i></a>
												<ul class="submenu">
													<li><a href="blog.html">회원정보 조회/수정</a></li>
													<li><a href="/user/chargePoint">포인트 충전</a></li>
													<li><a href="single-blog.html">체크인</a></li>
													<li><a href="single-blog.html">구매내역 조회</a></li>
												</ul></li>
											<li><a
												href="/admin" href="#">myPage(admin)<i
													class="ti-angle-down"></i></a>
												<ul class="submenu">
													<li><a href="blog.html">회원조회</a></li>
													<li><a href="single-blog.html">항공스케줄 등록/수정</a></li>
												</ul></li>
										</c:otherwise>
										</c:choose>
										</sec:authorize>
<%-- 										<sec:authorize access="isAuthenticated()">
											<li sec:authorize="hasRole('ROLE_MEMBER'))"><a
												href="/user" href="#">myPage(user)<i
													class="ti-angle-down"></i></a>
												<ul class="submenu">
													<li><a href="blog.html">회원정보 조회/수정</a></li>
													<li><a href="/user/chargePoint">포인트 충전</a></li>
													<li><a href="single-blog.html">체크인</a></li>
													<li><a href="single-blog.html">구매내역 조회</a></li>
												</ul></li>
											<li sec:authorize="hasRole('ROLE_ADMIN')"><a
												href="/admin" href="#">myPage(admin)<i
													class="ti-angle-down"></i></a>
												<ul class="submenu">
													<li><a href="blog.html">회원조회</a></li>
													<li><a href="single-blog.html">항공스케줄 등록/수정</a></li>
												</ul></li>
										</sec:authorize> --%>
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
										<li><a href="/qna/list">qna <!-- <i class="fa fa-facebook-square"></i> -->
										</a></li>
										<li><a href="/notice/list">notice <!-- <i class="fa fa-facebook-square"></i> -->
										</a></li>
										<li><a href="/boardDiary/list">Board Diary <!-- <i class="fa fa-twitter"></i> -->
										</a></li>
										<li><a href="/boardEvent/list">Event </a></li>
										<sec:authorize access="isAnonymous">
											<li><a href="/login"> login<!--  <i class="fa fa-instagram"></i>-->
											</a></li>
										</sec:authorize>
										<sec:authorize access="isAuthenticated()">
											<c:choose>
												<c:when test="${fn:contains(loginUser.userId, '@')}">
													<li><a class="logout"
														href="https://kauth.kakao.com/oauth/logout?client_id=607caeca9f2a0089b46f99c667e0dee3&logout_redirect_uri=http://localhost:8081/logout">kakaologout</a></li>
												</c:when>
												<c:otherwise>
													<li><a class="logout" href="/logout">logout</a></li>
												</c:otherwise>
											</c:choose>

											<%-- 										<form role="form" action="/logout" method="post">
											<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}">
											<button type="submit">logout</button>
										</form> --%>
											<p>
												<sec:authentication property="principal.username" />
												님 환영합니다!
												<%-- 												<sec:authentication property="principal.user" />
												<sec:authentication property="principal.user.authority" /> --%>
											</p>
											<form id="actionForm" action="/logout" method="post">
												<input type="hidden" name="${_csrf.parameterName}"
													value="${_csrf.token}">
											</form>
										</sec:authorize>
									</ul>

								</div>

								<div id="kakao-talk-channel-add-button"
									data-channel-public-id="_frpnG" data-size="large"
									data-support-multiple-densities="true"></div>

								<div id="kakao-talk-channel-chat-button"
									data-channel-public-id="_frpnG" data-title="consult"
									data-size="small" data-color="yellow" data-shape="pc"
									data-support-multiple-densities="true"></div>

								<c:if test="${loginUser.admin==1 }">
									<button id="adminTalk">관리자톡 채널</button>
								</c:if>

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
		$(".logout").on("click", function(e) {
	//		e.preventDefault();
			alert("로그아웃을 진행합니다!");
//			$("#actionForm").submit();
		});

		var link = "https://center-pf.kakao.com/_frpnG/chats";
		$("#adminTalk").on("click", function() {
			window.open(link);
		});
	</script>

	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script>
		kakao.init('3156d02ad4070a1c858f024518bda8c5');
		Kakao.Channel.createAddChannelButton({
			container : '#kakao-talk-channel-chat-button',
			channelPublicId : '_frpnG' // 카카오톡 채널 홈 URL에 명시된 id로 설정합니다.
		});
	</script>

	<!-- 카카오 채널 추가 -->
	<script>
		window.kakaoAsyncInit = function() {
			Kakao.Channel.createAddChannelButton({
				container : '#kakao-talk-channel-add-button',
			});
		};

		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = 'https://t1.kakaocdn.net/kakao_js_sdk/2.5.0/kakao.channel.min.js';
			js.integrity = 'sha384-j5TN6EqladB+HIfGV8dVYRIzoJf9Fb4lvrkPmo9KlnDWpN1CZz8yC4rCH1ChRbbh';
			js.crossOrigin = 'anonymous';
			fjs.parentNode.insertBefore(js, fjs);
		})(document, 'script', 'kakao-js-sdk');
	</script>

	<!-- 카카오 채팅 -->
	<script>
		window.kakaoAsyncInit = function() {
			Kakao.Channel.createChatButton({
				container : '#kakao-talk-channel-chat-button',
			});
		};

		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = 'https://t1.kakaocdn.net/kakao_js_sdk/2.5.0/kakao.channel.min.js';
			js.integrity = 'sha384-j5TN6EqladB+HIfGV8dVYRIzoJf9Fb4lvrkPmo9KlnDWpN1CZz8yC4rCH1ChRbbh';
			js.crossOrigin = 'anonymous';
			fjs.parentNode.insertBefore(js, fjs);
		})(document, 'script', 'kakao-js-sdk');
	</script>
	<!-- header-end -->



<body>
	<div class="tm-main-content" id="top">
		<div class="tm-page-wrap mx-auto" style="margin-top : 180px;">
			<section class="tm-page-wrap-allwhite">
				<div class="container">
					<div class="row">
						<div class="col-xs-12 mx-auto tm-about-text-wrap text-center">
							<h2>아이디 찾기</h2>
							<br>
							<h6>회원님의 아이디는 아래와 같습니다.</h6>
							<br> <br>
							<hr>
							<br>

							<form action="/" name="frm" method="post" class="tm-contact-form"
								style="position: inherit; width: 570px; align-content: center;">
								<hr>
								<br>
								<table style="text-align: center;">
									<tbody>
										<tr>
											<th width="200px">아이디</th>
											<td width="200px">${user.userId}</td>
										</tr>
									</tbody>

								</table>
								<br>
								<hr>
								<br>
								<!-- 비밀번호 찾기의 경우 아이디를 입력받는 jsp화면을 만들고(이메일입력과 매우 유사) 메일을보내서 임시 비밀번호로(update해서) 지정할 예정.. -->
								<div
									class="form-group tm-form-group tm-form-group-pad tm-form-group-1">
									<button type="button" 
										class="btn btn-primary tm-btn-primary tm-btn-send text-uppercase"
										onclick="location.href='/join/findPwd'">비밀번호 찾기</button>
									<button type="button" 
										class="btn btn-primary tm-btn-primary tm-btn-send text-uppercase"
										onclick="location.href='/login'">로그인</button>
								</div>

							</form>


						</div>
					</div>
				</div>
			</section>



			<div class="tm-container-outer tm-position-relative"
				id="tm-section-4">


				<%@ include file="../includes/footer.jsp"%>
			</div>
		</div>
	</div>


</body>
</html>