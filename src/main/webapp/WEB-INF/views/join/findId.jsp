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
							<h2>아이디 찾기</h2>
							<br>
							<h6>
								회원가입 시 등록한 이메일 주소를 입력해주시기 바랍니다.<br> 등록된 회원정보와 입력된 내용이 일치할
								경우, 등록된 이메일 주소로 안내 메일을 발송해 드립니다.
							</h6>
							<br> <br>
							<hr>
							<br>

							<form name="signUpForm" method="post">
								<table style="margin-left: auto; margin-right: auto;">
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
		/*  	function emailAuthentication(){ //email 보내는 창 호출(get)
				if (!emailValCheck()){
			    	return false;
			    }
				 var url = "UserServlet?command=email_check&email=" + document.signUpForm.email.value;
				open(url, "confirm",
						"toolbar=no, location=no,menubar=no,scrollbars=no,resizable=no,width=600,height=200") ;			
				//emailValCheck() 호출 후 결과값 확인
				//결과값이 true라면 새 창에 email정보를 get방식으로 전송
				//결과값이 false라면 위의 기능을 실행하지 않음
				
			}; 
		 */
		const form = document.signUpForm;

		function emailValCheck() { //이메일 입력 시 유효성 검사
			var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var email = form.email.value;
			if (!check(emailPattern, email, "유효하지 않은 이메일 주소입니다.")) {
				return false;
			}
			return true;
			//const form : email을 포함하는 form의 위치
			//var emailPattern : 이메일 정규식 패턴
			//check(pattern, taget, message)를 호출해 결과에 따라 새창을 띄웁니다.
		};

		function check(pattern, taget, message) {
			if (pattern.test(taget)) {
				return true;
			}
			alert(message);
			taget.focus();
			return false;
			//정규식 검증이 필요한 다른 항목에서도 사용가능하도록 만들어 코드 재사용성을 높임
			//taget을 pattern으로 검사해 유효하면 ture 반환
			//taget이 pattern에 맞지 않는다면?
			//alert로 message를 띄워 사용자에게 알림
			//유요하지 않은 입력에 포커스를 줌
			//false 반환
		};
		
		$(function(){ //이메일 정보가 없을 경우 메세지 표시... -> 창이 안 뜸! 수정필요
		var message = ${message};
			if(message != ""){
				alert(message)
			};
		});
	</script>

</body>
</html>