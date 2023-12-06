<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header2.jsp"%>


<body>
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
			<div class="tm-page-wrap mx-auto">
				<div align="center">
					<h2 class="text-uppercase mb-4">회원 약관동의</h2>
					<h6>약관 및 정보이용 안내에 동의해주시기 바랍니다.</h6>
					<br> <br>
				</div>
				<br>
				<form action="/join/joinTerms" method="post" name="frm"
					style="margin: 0 20px 0 20px">
					<fieldset style="margin: 20px 20px 20px 20px">
						<hr>
						<input type="checkbox" name="selectall" id="agree_all"
							data-type="all_ck_item" onclick="selectAll(this)"> <label
							for="agree_all" class="fsz_23">카카오 클럽 일반규정, 약관 및 본인의 개인정보
							수집·이용, 국외 이전, 제 3자 제공에 모두 동의합니다.</label>
							
						<hr>
						<input type="checkbox" name="terms" value="selectall"
							id="agree_hompageUse" onclick="return checkSelectAll()">
						<label for="agree_hompageUse" class="fsz_23"> <span
							class="col_brown2">[필수]</span> ${terms1.termsTitle}
						</label> <br>
						${terms1.termsContents}

						<br> <input type="checkbox" name="terms" value="selectall"
							id="agree_personalCollection" onclick="return checkSelectAll()">
						<label for="agree_personalCollection" class="fsz_23"> <span
							class="col_brown2">[필수]</span> ${terms2.termsTitle}
						</label> <br>
						${terms2.termsContents}

						<br> <br> <input type="checkbox" name="terms"
							value="selectall" id="agree_personalTransferToAbroad"
							onclick="return checkSelectAll()"> <label
							for="agree_personalTransferToAbroad" class="fsz_23"> <span
							class="col_brown2">[필수]</span> ${terms3.termsTitle}
						</label> <br>
						${terms3.termsContents}
						<br>

						<br> <br> <input type="checkbox" name="terms"
							value="terms4" id="agree_personalProvide"
							onclick="return checkSelectAll()"> <label
							for="agree_personalProvide" class="fsz_23"> <span
							class="col_brown2">[선택]</span> ${terms4.termsTitle}
						</label> <br>
						${terms4.termsContents}
						<br>


					</fieldset>

					<br>
					<hr>
					<br>
					<div align="center">
					<button type="button" class="btn btn-primary"
						onclick="location.href='/'">취소</button>
					<!-- 취소 누르는데 체크박스 리셋이 안먹힌다..... 메인으로 보냄 -->
					<button type="submit" class="btn btn-primary"
						onclick="return termsCheck()">동의</button>						<br>
						<br>
					</div>
				</form>
			</div>

		</section>
		<%@ include file="../includes/footer.jsp"%>

	</div>

	<script type="text/javascript">
function selectAll(selectAll)  { /*약관동의시 전체 선택*/
	  const checkboxes 
	       = document.getElementsByName('terms');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
	}

function checkSelectAll()  { /* 하나라도 체크되지 않으면 전체선택이 빠짐, 전부체크하면 전체선택이 체크 */
	  // 전체 체크박스
	  const checkboxes 
	    = document.querySelectorAll('input[name="terms"]');

	  const checked 
	    = document.querySelectorAll('input[name="terms"]:checked');
	  // select all 체크박스
	  const selectAll 
	    = document.querySelector('input[name="selectall"]');
	  
	  if((checkboxes.length) === checked.length)  {
	    selectAll.checked = true;
	  }else {
	    selectAll.checked = false;
	  }

	}

 function termsCheck(){
	if($('input:checkbox[id="agree_hompageUse"]').is(":checked") != true){
		alert("필수약관에 동의해주시기 바랍니다.");
		return false;
	}
	if($('input:checkbox[id="agree_personalCollection"]').is(":checked") != true){
		alert("필수약관에 동의해주시기 바랍니다.");
		return false;
	}
	if($('input:checkbox[id="agree_personalTransferToAbroad"]').is(":checked") != true){
		alert("필수약관에 동의해주시기 바랍니다.");
		return false;
	}
 }


	
</script>
</body>
</html>