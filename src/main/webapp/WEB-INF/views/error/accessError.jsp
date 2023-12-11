<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header2.jsp"%>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<body>
	<div class="tm-main-content" id="top">
		<div class="tm-page-wrap mx-auto" style="margin-top: 180px;">
			<section class="tm-page-wrap-allwhite">
				<div class="container">
					<div class="row">
						<div class="col-xs-12 mx-auto tm-about-text-wrap text-center">
							<h2>죄송합니다</h2>
							<br>
							<h6>
								요청이 거절되었습니다. <br> 접근할 수 없는 페이지 입니다.
							</h6>
							<br>
							<hr>
							<br>

							<h4>Access Denied Page</h4>
							<h2>
								<c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage()}"></c:out>
							</h2>
							<h2>
								<c:out value="${msg}"></c:out>
							</h2>
<br><br>
<button type="button" class="btn btn-primary" id="submitButton"
					onclick="location.href='/'">확인</button>

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