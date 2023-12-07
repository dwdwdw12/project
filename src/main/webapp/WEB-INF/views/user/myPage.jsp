<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header2.jsp"%>
<style>
.id_ok{
font-size: small;
color:#008000;
display: none;
}

.id_already{
font-size: small;
color:rgb(201, 0, 0); 
display: none;
}
.userNick_ok{
font-size: small;
color:#008000;
display: none;
}

.userNick_already{
font-size: small;
color:rgb(201, 0, 0); 
display: none;
}
.userPwd_ok{
font-size: small;
color:#008000;
display: none;
}

.userPwd_already{
font-size: small;
color:rgb(201, 0, 0); 
display: none;
}
</style>

<div class="tm-page-wrap mx-auto" style="margin-top : 180px;">
		<section class="tm-banner">
			<div class="tm-container-outer ">
				<div class="container">
					<!-- <div class="row tm-banner-row" id="tm-section-search"></div> -->
					<!-- row -->
				</div>
				<!-- .container -->
			</div>
			<!-- .tm-container-outer -->
		</section>

		<section class="tm-page-wrap-allwhite">
				<div align="center">
					<div class="col-xs-12 mx-auto tm-about-text-wrap text-center">
						<h2 class="text-uppercase mb-4">회원 정보 입력</h2>
						<h6>회원님의 개인정보를 입력해주시기 바랍니다.</h6>
						<br> <br>
					</div>
				</div>
			


			<form action="/join/memberInfo" name="frm" method="post"
				style="margin: auto;">
				<!-- class="tm-contact-form" -->

				<table style="margin: auto; width: 800px; border-top: 0.1px solid rgb(220, 220, 220); border-bottom: 0.1px solid rgb(220, 220, 220);">
				

					<tbody>
						<tr>
							<th scope="row" style="padding: 16px 8px 8px 8px; width: 150px"><label for="userNameK">한글명<span
									class="icon_require" style="color: red; font-size: x-small;">
										*</span></label></th>
							<td style="padding: 8px">${userInfo.userNameK}
								<p class="txt_error_Msg" id="error_koreanName"
									style="display: none;"></p>
							</td>
						</tr>
						<tr>
							<th scope="row" style="padding: 8px;">영문명<span class="icon_require"
								style="color: red; font-size: x-small;"> *</span></th>
							<td style="padding: 8px">${userInfo.userNameE}</td>
						</tr>

						<tr>
							<th scope="row" style="padding: 8px;">성별<span class="icon_require"
								style="color: red; font-size: x-small;"> *</span></th>
							<td style="padding: 8px">${userInfo.gender}</td>
						</tr>

						<tr>
							<th scope="row" style="padding: 8px;">생년월일<span class="icon_require"
								style="color: red; font-size: x-small;"> *</span></th>
							<td style="padding: 8px">
 								${userInfo.userReginumFirst}							
							</td>
						</tr>


						<tr>
							<th scope="row" style="padding: 8px;"><label for="userId">아이디 <span
									class="icon_require" style="color: red; font-size: x-small;">
										*</span>
							</label></th>
							<td style="padding: 8px">
							${userInfo.userId}
							</td>
						</tr>

						<tr>
							<th scope="row" style="padding: 8px;"><label for="userNick">닉네임 <span
									class="icon_require" style="color: red; font-size: x-small;">
										*</span>
							</label></th>
							<td style="padding: 8px">${userInfo.userNick}
							</td>
						</tr>


						<tr>
							<th scope="row" style="padding: 8px;"><label for="pwd">비밀번호<span
									class="icon_require" style="color: red; font-size: x-small;">
										*</span></label></th>
							<td style="padding: 8px">
							<input type="password" id="pwd" autocomplete="off"
								name="pwd" placeholder="영문+숫자+특수문자 6~10자리" maxlength="10"
								title="영문+숫자+특수문자 6~10자리" style="width: 200px;"
								class="form-control" required="required"></td>
						</tr>
						<tr>
							<th scope="row" style="padding: 8px;"><label for="pwd_check">비밀번호 확인<span
									class="icon_require" style="color: red; font-size: x-small;">
										*</span></label></th>
							<td style="padding: 8px">
							<input type="password" id="pwd_check" autocomplete="off"
								placeholder="영문+숫자+특수문자 6~10자리" title="영문+숫자+특수문자 6~10자리"
								maxlength="10" style="width: 200px; display: inline" oninput="pwdCheck()" 
								class="form-control" required="required">
							<!-- id ajax 중복체크 -->
								<span class="userPwd_ok">&nbsp;&nbsp;비밀번호 확인이 완료되었습니다.</span>
								<span class="userPwd_already">&nbsp;&nbsp;비밀번호를 다시 확인해주시기 바랍니다.</span>
								

								<!-- <button onclick="joinInformPwdCheck()" id="btn_pwdCheck"
									type="button" class="btn btn-primary" style="display: inline;">확인</button> <input
								type="hidden" name="pwdDuplication" value="pwdUncheck" /> -->
						</tr>
						<tr>
							<th scope="row" style="padding: 8px;"><label for="phone_first">휴대전화<span
									class="icon_require" style="color: red; font-size: x-small; display: inline;">
										*</span></label></th>
							<td style="padding: 8px">
							${userInfo.phone}
							</td>
						</tr>


						<tr>
							<th scope="row" style="padding: 8px;"><label for="input_emailID">이메일<span
									class="icon_require" style="color: red; font-size: x-small">
										*</span></label></th>
							<td style="padding: 8px">
								${userInfo.mail}
							</td>
						</tr>


						<tr>
							<th scope="row" style="padding: 8px;"><label for="input_address">주소<span
									class="icon_require" style="color: red; font-size: x-small;">
										*</span>
							</label></th>
							<td style="padding: 8px; " id="korea_address">
								${userInfo.postCode}
							</td>
							
							<td style="padding: 8px">
								${userInfo.address}
							</td>

						</tr>

					</tbody>
				</table>



				<br>
				<br>
				<div align="center">
					<button type="button" class="btn btn-primary"
						onclick="return formCheck()">확인</button>
				</div>
				<input type="hidden" name="userNameK" value="${userInfo.userNameK}">
				<input type="hidden" name="userNameE" value="${userInfo.userNameE}">
				<input type="hidden" name="gender" value="${userInfo.gender}">
				<input type="hidden" name="userReginumFirst" value="${userInfo.userReginumFirst}">
				<input type="hidden" name="userReginumLast" value="${userInfo.userReginumLast}">
				<input type="hidden" name="termsAgree" value="${termsAgree}">
				
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				
			</form>


		</section>
		</div>
<br>


</body>
</html>