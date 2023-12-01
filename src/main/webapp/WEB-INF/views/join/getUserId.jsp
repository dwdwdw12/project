<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header2.jsp"%>


<body>
	<div class="tm-main-content" id="top">
		<div class="tm-page-wrap mx-auto">
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
								</div>
								<div
									class="form-group tm-form-group tm-form-group-pad tm-form-group-1">
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