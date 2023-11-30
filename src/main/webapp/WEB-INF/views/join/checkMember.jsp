<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header2.jsp"%>
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
<meta name="referrer" content="no-referrer-when-downgrade" />

<div class="tm-main-content" id="top">
	<div class="tm-page-wrap mx-auto">
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
			<div class="container">
				<div class="row">
					<div class="col-xs-12 mx-auto tm-about-text-wrap text-center">
						<div align="center">
							<h2 class="text-uppercase mb-4">기존 회원 여부 확인</h2>
							<h6>기존 회원 여부를 확인해주시기 바랍니다.</h6>
							<br> <br>
						</div>
						<form action="/join/checkMember" name="frm" method="post"
							class="tm-contact-form" style="position: inherit; width: 570px;">
							<!-- class="tm-contact-form" -->
							<table class="table_form" style="margin: auto">

								<tbody>
									<tr>
										<hr>
										<br>
										<th scope="row" width="120px" style="text-align: left;"><label
											for="userNameE">영문명</label></th>
										<td colspan="3"><input type="text" id="userNameE"
											placeholder="영문 명 입력 (예 : HONGGILDONG)" maxlength="10"
											style="text-transform: uppercase;"
											oninput="handleOnInputEng(this)" class="form-control"
											name="userNameE"></td>
									</tr>
									<tr>
										<th scope="row" style="text-align: left;"><label
											for="userNameK">한글명</label></th>
										<td colspan="3"><input type="text" id="userNameK"
											placeholder="한글 명 입력 (예 : 홍길동)" maxlength="5"
											oninput="handleOnInputKor(this)" name="userNameK"
											class="form-control"></td>

									</tr>
									<tr>
										<th scope="row" style="text-align: left;">성별</th>

										<td>
											<div class="form-control">
												<input type="radio" name="gender" id="gender_man" value=M
													checked="checked"> <label for="gender_man">남</label>
											</div>
										</td>
										<td>
											<div class="form-control">
												<input type="radio" name="gender" id="gender_woman" value=W>
												<label for="gender_woman">여</label>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row" style="text-align: left;"><label
											for="birth_date">주민등록번호</label></th>
										<td>
											<div>
												<input class="form-control" type="text"
													name="userReginumFirst"
													oninput="handleOnInput(this, 6); this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
											</div>
										</td>
										<td>
											<div>
												<input class="form-control" type="password"
													name="userReginumLast"
													oninput="handleOnInput(this, 7); this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
											</div>
										</td>
									</tr>
								</tbody>
							</table>

							<br>
							<hr>
							===========${agree} : model에 넣어준 값 넘어오는지 확인용================== <input
								type="hidden" name="agree" value="${agree}"> <br>
								
							<button type="submit" class="btn btn-primary"
								onclick="return joinInformCheck();">확인</button>
						</form>



					</div>
				</div>
			</div>
		</section>





		<div class="tm-container-outer tm-position-relative" id="tm-section-4">


			<%@ include file="../includes/footer.jsp"%>
		</div>
	</div>
</div>
<script type="text/javascript">
	function joinInformCheck() { //값이 비었는지 확인
		var regfirst = /^(?=.*[0-9]).{6,7}$/;
		var reglast = /^(?=.*[0-9]).{7,8}$/;

		if (document.frm.engName.value.length == 0) {
			alert("영문 명을 입력해주세요.");
			return false;
		}
		if (document.frm.korName.value.length == 0) {
			alert("한글 명을 입력해주세요.");
			return false;
		}
		if (document.frm.usernum_first.value.length == 0) {
			alert("주민등록번호를 입력해주세요.");
			return false;
		}
		if (document.frm.usernum_last.value.length == 0) {
			alert("주민등록번호를 입력해주세요.");
			return false;
		}

		if (!regfirst.test(document.frm.usernum_first.value)) {
			alert("주민등록번호를 다시 확인해주시기 바랍니다.")
			return false;
		}
		if (!reglast.test(document.frm.usernum_last.value)) {
			alert("주민등록번호를 다시 확인해주시기 바랍니다.")
			return false;
		}
	}

	function handleOnInput(el, maxlength) {
		if (el.value.length > maxlength) {
			el.value = el.value.substr(0, maxlength);
		}
	}
	function handleOnInputEng(e) {
		e.value = e.value.replace(/[^A-Za-z]/ig, '')
	}
	function handleOnInputKor(e) {
		e.value = e.value.replace(/[^ㄱ-힣]/ig, '')
	}

	/* function pwdLengthCheck(){
		var regfirst = /^(?=.*[0-9]).{6,7}$/;
		var reglast = /^(?=.*[0-9]).{7,8}$/;
			        if(!regfirst.test(document.frm.usernum_first.value)){
			            alert("주민등록번호를 다시 확인해주시기 바랍니다.")
			            usernum_first.focus();
			            return false;
			        } else if(!reglast.test(document.frm.usernum_last.value)){
			            alert("주민등록번호를 다시 확인해주시기 바랍니다.")
			            usernum_last.focus();
			            return false;
			        }
		} */
</script>
</body>
</html>