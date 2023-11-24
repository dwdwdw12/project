<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="includes/header2.jsp"%>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
<!-- Google web font "Open Sans" -->
<link rel="stylesheet"
	href="../resources/font-awesome-4.7.0/css/font-awesome.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<!-- Bootstrap style -->
<!-- <link rel="stylesheet" type="text/css"
	href="../resources/css/datepicker.css" /> -->
<link rel="stylesheet" type="text/css"
	href="../resources/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="../resources/slick/slick-theme.css" />
<link rel="stylesheet" href="../resources/css/templatemo-style.css">
<!-- Templatemo style -->
	<!-- 쿠키값으로 id정보 받아오기 -->
	<%String cookie = "";
		Cookie[] cookies = request.getCookies(); //쿠키생성
		if(cookies !=null&& cookies.length > 0)
		for (int i = 0; i < cookies.length; i++){
			if (cookies[i].getName().equals("userid")) { // 내가 원하는 쿠키명 찾아서 값 저장
				cookie = cookies[i].getValue();}}%>
				
	<div class="tm-page-wrap mx-auto">
		<div class="tm-container-outer tm-banner-bg">
		<div class="container"><!-- 원복=> 컨테이너 제거 -->
			<div class="row tm-banner-row tm-banner-row-header">
				<div class="tm-banner-header">
					<h1 class="text-uppercase tm-banner-title">Login</h1>
					<p class="mb-4">아이디 및 패스워드를 입력 해 주세요.</p>
				</div>
			</div>
		<!-- 	<div class="row tm-banner-row tm-banner-row-header tm-about-text-wrap mx-auto text-center">	 -->
			<div class="row tm-banner-row mx-auto text-center">				
				<form action="/login" role="form" method="post" class="tm-search-form tm-section-pad-4" name="frm" style="background-color:white; width: 670px; height:180px;">
					<div class="form-group tm-container">
						<label for="userid">ID</label> 
						<input type="text" id="userid" name="username" class="form-control" placeholder="id" required value="<%=cookie%>"/>
					</div>
					<div class="form-group tm-container">
						<label for="pwd">PASSWORD</label> 
						<input type="password" id="pwd" name="password" class="form-control" placeholder="pwd" required />
					</div>
					<div class="form-group tm-container">
						<label for="remember">아이디 저장</label> 
						<input type="checkbox" name="rememberCheck" class="form-control" />
						<!--자동로그인 name 속성값 remember-me-->
						<!-- <input type="checkbox" name="remember-me" class="form-control" /> -->
					</div>
			
					<div class="form-group tm-form-group tm-form-group-pad tm-form-group-1">
						<button type="submit" class="btn btn-primary tm-btn-primary tm-btn-send text-uppercase" id="login">로그인</button>
					</div>
					<div class="form-group tm-form-group tm-form-group-pad tm-form-group-1">
						<button type="button" class="btn btn-primary tm-btn-primary tm-btn-send text-uppercase" onclick="location.href='join_terms'">회원가입</button>
					</div>
					<div class="form-group tm-form-group tm-form-group-pad tm-form-group-1">
						<button type="button" class="btn btn-primary tm-btn-primary tm-btn-send text-uppercase" onclick="location.href='find_id'">아이디 찾기</button>
					</div>
					<div class="form-group tm-form-group tm-form-group-pad tm-form-group-1">
						<button type="button" class="btn btn-primary tm-btn-primary tm-btn-send text-uppercase" onclick="location.href='find_pwd'">비밀번호 찾기</button>
					</div>
					<div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					</div>
			</form>
			
		</div>
			
			
					
		</div>

	</div>

	</div>
	<%@ include file="includes/footer.jsp"%>

	<script type="text/javascript">
	$("#login").on("click",function(e){
		e.preventDefault();
		alert("login");
		$("form").submit();
	});
</script>
</body>

</html>