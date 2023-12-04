 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/header2.jsp"%>


<body>
	<div class="tm-main-content" id="top">
		<div class="tm-page-wrap mx-auto">
			<section class="tm-page-wrap-allwhite">
				<div class="container">
					<div class="row">
						<div class="col-xs-12 mx-auto tm-about-text-wrap text-center">
							<h2>비밀번호 찾기</h2>
							<br>
							<h6>
								회원가입 시 등록한 이메일 주소와 아이디를 입력해주시기 바랍니다.<br> 등록된 회원정보와 입력된 내용이 일치할
								경우, 등록된 이메일 주소로 안내 메일을 발송해 드립니다.
							</h6>
							<br> <br>
							<hr>
							<br>

							<form name="signUpForm" method="post">
								<table style="margin-left: auto; margin-right: auto;">
								<tr>
									<th>아이디</th>
									<td style="padding-bottom: 6px"><input type="text" name="userId" id="inputUseridForm"
										maxlength="30" class="form-control"></td>
								</tr>
									<tr>
										<th
											style="padding: 8px; border-top: none; text-align: center; vertical-align: middle; width: 150px">이메일</th>
										<td style="border-top: none; padding: 0"><input
											type="text" name="email" id="inputEmailForm" maxlength="30"
											class="form-control" style="display: inline; width: 250px">
										</td>
									</tr>



								</table>
								<br> <br>


								<button onclick="return emailValCheck()" id="eamilAuthBtn"
									type="submit" class="btn btn-primary" style="display: inline;">인증
									메일 보내기</button>
								<div>
									<input type="hidden" name="${message}"
										value="${message}" /><!-- 이메일 정보가 없는 경우 controller의 model에서 message 받아옴 -->
								</div>
								<br> <br>
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
	<script type="text/javascript">
	
	var message = document.getElementById('message').value; //${message}를 하는 경우 var message = ; 이렇게 표시됨 -> id주어서 수정함
	console.log(message);
	
	$(document).ready(function(){
			if(message !== null){
				alert(message);
			};
	});
	
		function check(pattern, taget, message) {
			if (pattern.test(taget)) {
				return true;
			}
			alert(message);
			taget.focus(); //타겟팅이 안됨
			return false;
			//정규식 검증이 필요한 다른 항목에서도 사용가능하도록 만들어 코드 재사용성을 높임
			//taget을 pattern으로 검사해 유효하면 ture 반환
			//taget이 pattern에 맞지 않는다면?
			//alert로 message를 띄워 사용자에게 알림
			//유요하지 않은 입력에 포커스를 줌 => 에러발생.. 
			//false 반환
		};

		$("#eamilAuthBtn").on("click", function(e){
			e.preventDefault();
			var form = document.signUpForm;
			
			var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var email = form.email.value; 
			if (!check(emailPattern, email, "유효하지 않은 이메일 주소입니다.")) {
			}
			form.submit();
		});
		
	</script>

</body>
</html> 