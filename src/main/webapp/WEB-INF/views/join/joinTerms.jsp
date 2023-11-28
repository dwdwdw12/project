<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header2.jsp"%>
<body>
	<div class="tm-page-wrap mx-auto">
	<div class="tm-container-outer tm-banner-bg">
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
				<form action="UserServlet" method="post" name="frm"
					style="margin: 0 20px 0 20px">
					<fieldset style="margin: 20px 20px 20px 20px">

						<input type="hidden" name="command" value="join_checkUser">
						<hr>
						<input type="checkbox" name="selectall" id="agree_all"
							data-type="all_ck_item" onclick="selectAll(this)"> <label
							for="agree_all" class="fsz_23">카카오 클럽 일반규정, 약관 및 본인의 개인정보
							수집·이용, 국외 이전, 제 3자 제공에 모두 동의합니다.</label>
						<hr>
						<input type="checkbox" name="terms" value="selectall"
							id="agree_hompageUse" onclick="return checkSelectAll()">
						<label for="agree_hompageUse" class="fsz_23"> <span
							class="col_brown2">[필수]</span> 카카오 클럽 일반 규정 및 홈페이지 이용 약관
						</label> <br>
						<%@ include file="../terms/1.jsp"%>

						<br> <input type="checkbox" name="terms" value="selectall"
							id="agree_personalCollection" onclick="return checkSelectAll()">
						<label for="agree_personalCollection" class="fsz_23"> <span
							class="col_brown2">[필수]</span> 개인정보 수집 및 이용안내
						</label> <br>
						<%@ include file="../terms/2.jsp"%>

						<br> <br> <input type="checkbox" name="terms"
							value="selectall" id="agree_personalTransferToAbroad"
							onclick="return checkSelectAll()"> <label
							for="agree_personalTransferToAbroad" class="fsz_23"> <span
							class="col_brown2">[필수]</span> 개인정보 국외 이전 동의
						</label> <br>
						<%@ include file="../terms/3.jsp"%>
						<br>


					</fieldset>

					<br>
					<hr>
					<br>
					<div align="center">
					<button type="button" class="btn btn-primary"
						onclick="location.href='/'">취소</button>
					<button type="button" class="btn btn-primary"
						onclick="if (termsCheck() != false) { location.href='UserServlet?command=join_check'; }">동의</button>
						<br>
						<br>
					</div>
				</form>
			</div>
		</section>
</div>
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
		alert("약관에 동의해주시기 바랍니다.");
		return false;
	}
	if($('input:checkbox[id="agree_personalCollection"]').is(":checked") != true){
		alert("약관에 동의해주시기 바랍니다.");
		return false;
	}
	if($('input:checkbox[id="agree_personalTransferToAbroad"]').is(":checked") != true){
		alert("약관에 동의해주시기 바랍니다.");
		return false;
	}
 }


	
</script>
</body>
</html>