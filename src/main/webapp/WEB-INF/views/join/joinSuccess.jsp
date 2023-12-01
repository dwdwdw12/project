<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header2.jsp"%>
    

<div class="tm-main-content" id="top">
		<div class="tm-page-wrap mx-auto">
			<section class="tm-banner">
				<div class="tm-container-outer ">
					<div class="container">
						<div class="row tm-banner-row" id="tm-section-search"></div>
						<!-- row -->
					</div>
					<!-- .container -->
				</div>
				<!-- .tm-container-outer -->



			</section>
			<!-- 이미 가입된 회원입니다 창은 어케 띄울까? 이거 팝업창 안뜸ㅡㅡ..!!-->
			<script type="text/javascript">
			var message = ${ message }
			if(message && message.trim() !== "" && message !== "null"){
			   alert(message);
			}
			</script>



			<section class="tm-page-wrap-allwhite">
				<div class="container">
					<div class="row">
						<div class="col-xs-12 mx-auto tm-about-text-wrap text-center">
							<br> 
							<h3>회원가입이 완료되었습니다.</h3>
							<br> <br> <br>


							<button type="button" class="btn btn-primary"
								onclick="location.href='UserServlet?command=login'">로그인</button>
							<br>
							<br>


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