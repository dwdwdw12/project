<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
<!-- Google web font "Open Sans" -->
<link rel="stylesheet"
	href="../resources/font-awesome-4.7.0/css/font-awesome.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<!-- Bootstrap style -->
<link rel="stylesheet" type="text/css"
	href="../resources/css/datepicker.css" />
<link rel="stylesheet" type="text/css"
	href="../resources/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="../resources/slick/slick-theme.css" />
<link rel="stylesheet" href="../resources/css/templatemo-style.css">
<!-- Templatemo style -->
<!-- 
<script src="../resources/js/vendor/modernizr.custom.min.js"></script>
<link rel="stylesheet" href="../resources/css/normalize.css"> -->
<style>

</style>

<div class="tm-page-wrap mx-auto">


	<section class="p-5 tm-container-outer tm-bg-gray">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 mx-auto tm-about-text-wrap text-center">
					<h2 class="text-uppercase mb-4">신규 운항내역 등록</h2>
					<p class="mb-2">양식에 맞게 정확히 기입 해 주세요.</p>
				</div>
			</div>
			<form action="/admin/flightCreate" method="post" >
			<div class="container">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th style="width: 10%">운항기</th>
							<th>출발지</th>
							<th>출발공항 코드</th>
							<th>출발지역 코드</th>
							<th>출발시간</th>
							<th>도착지</th>
							<th>도착공항 코드</th>
							<th>도착지역 코드</th>
							<th>도착시간</th>
							<th>비행시간</th>
						</tr>
					</thead>
						<tbody>
							<tr class="flight">
								<td><input type="hidden" id="fno" name="fno" value="${fno}" readonly="readonly"/>${fno}</td>
								<td><input type="text" id="flightName" name="flightName" placeholder="OZ1155" value="" required="required" style="border: 0; background-color: #efefef; width: 80px"/></td>
								<td><input type="text" id="depName" name="depName" placeholder="인천" value="" required="required" style="border: 0; background-color: #efefef;width: 80px"/></td>
								<!-- <td><input type="text" id="depCode"/></td> -->
								<td>
									
									<select name="dCode" id="dCode style="border: 0; background-color: #efefef;width: 80px">
									<c:forEach items="${depCode}" var="dCode">	
<!-- 										<option value=""></option> -->
										<option value="${dCode}">${dCode}</option>
									</c:forEach>
									</select> 
								</td>
								<!-- <td><input type="text" id="depRegionCode"/></td> -->
								<td>
								<select name="dRCode" name="dRCode" style="border: 0; background-color: #efefef;width: 80px">
									<c:forEach items="${dRCode}" var="dRCode">
											<option value="${dRCode}">${dRCode}</option>
									</c:forEach>
									</select> 
								</td>
								<td><input type="text" id="fullDepTime" name="fullDepTime" placeholder="2024-02-28 10:11:00" value="" required="required" style="border: 0; background-color: #efefef;width: 160px"/></td>
								<td><input type="text" id="arrName" name="arrName" placeholder="도쿄" value="" required="required" style="border: 0; background-color: #efefef;width: 80px"/></td>
<!-- 								<td><input type="text" id="arrCode"/></td> -->
								<td>
								<select id="aCode" name="aCode" style="border: 0; background-color: #efefef;">
									<c:forEach items="${arrCode}" var="aCode">
											<option value="${aCode}">${aCode}</option>
									</c:forEach>
									</select> 
								</td>
								<!-- <td><input type="text" id="arrRegionCode"/></td> -->
								<td>
								<select id="aRCode" name="aRCode" style="border: 0; background-color: #efefef;width: 80px">
									<c:forEach items="${aRCode}" var="aRCode">
											<option value="${aRCode}">${aRCode}</option>
									</c:forEach>
									</select> 
								</td> 
								<td><input type="text" id="fullArrTime" name="fullArrTime" placeholder="2024-02-28 10:11:00" value="" required="required" style="border: 0; background-color: #efefef;width: 160px"/></td>
								<td><input type="text" id="flightTime" name="flightTime" placeholder="1:05:00" value="" required="required" style="border: 0; background-color: #efefef;width: 80px"/></td>
							</tr>

						</tbody>

				</table>
				<button type="button" class="btn btn-primary btn-sm btn-custom" onclick="submit()"><i class="bi bi-chevron-double-right"></i>&nbsp;등록 </button>
				</form>

			</div>
		</div>
	</section>

<%-- 	<!-- 전달 폼 -->
	<form id="ticketForm" action="/user/kakaoDetail" method="get">
		<input type="hidden" name="pageNum" value="${paging.cri.pageNum}" />
		<input type="hidden" name="amount" value="${paging.cri.amount}" /> <input
			type="hidden"
			value='sec:authentication property="principal.username"' />
	</form> --%>

</div>
<!-- .tm-container-outer -->

<script type="text/javascript">
$(window).load(function() {	
	var strWidth;
	var strHeight;
	if ( window.innerWidth && window.innerHeight && window.outerWidth && window.outerHeight ) {			
		strWidth = $('#contents').outerWidth() + (window.outerWidth - window.innerWidth);			
		strHeight = $('#contents').outerHeight() + (window.outerHeight - window.innerHeight);		
	}else {			
		var strDocumentWidth = $(document).outerWidth();			
		var strDocumentHeight = $(document).outerHeight();			
		window.resizeTo ( strDocumentWidth, strDocumentHeight );			
		var strMenuWidth = strDocumentWidth - $(window).width();			
		var strMenuHeight = strDocumentHeight - $(window).height();			
		strWidth = $('#contents').outerWidth() + strMenuWidth;			
		strHeight = $('#contents').outerHeight() + strMenuHeight;		}		
	//resize		
		window.resizeTo( strWidth, strHeight );	});

function submit(){
	alert("작동확인..")
	check();
	var dCode = $("#dCode");
	var dRCode = $("#dRCode");
	var aCode = $("#aCode");
	var aRCode = $("#aRCode");
	$.ajax({
		url : "/admin/flightCreate",
		type : "POST",
		dataType : "json",
		async : true,
		contentType : "application/json",
		data : JSON.stringify({
			fno : $("#fno").val(),
			flightName : $("#flightName").val(),
			depName : $("#depName").val(),
			dCode : dCode.options[dCode.selectedIndex].val(),
			dRCode : dRCode.options[dRCode.selectedIndex].val(),
			fullDepTime : $("#fullDepTime").val(),
			arrName : $("#arrName").val(),
			aCode : aCode.options[aCode.selectedIndex].val(),
			aRCode : aRCode.options[aRCode.selectedIndex].val(),
			fullArrTime : $("#fullArrTime").val(),
			flightTime $("#flightTime").val():
			
		}),
		success : function(data){
			console.log(data);
			location.href="admin/flightSchedule";
		},
		error : function(err){
			console.log(err);
			alert("항공스케즐 업로드에 실패했습니다!");
			location.reload();
		}
	});
		
}
//유효성 체크
function check(){
	
}
</script>
