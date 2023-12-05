<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %> 
<%@ include file="../includes/header2.jsp"%>
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

<script src="../resources/js/vendor/modernizr.custom.min.js"></script>
<link rel="stylesheet" href="../resources/css/normalize.css">

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script> 
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script> 
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script>
	var $jLatest = jQuery.noConflict();
</script>

<style>
#depTable th {
    position: sticky;
    text-align: center;
    top: 0px;
    background-color: gray !important;
}
#arrTable th {
    position: sticky;
    text-align: center;
    top: 0px;
    background-color: gray !important;
}
td {
	text-align: center;
}

</style>

<div class="tm-page-wrap mx-auto" style="margin-top : 180px;">
	<section class="p-5 tm-container-outer tm-bg-gray">
	<h2>항공편 검색</h2>

		<div class="container">

			<form action="/flight/search" method="get" class="tm-search-form tm-section-pad-1">
				<button type="button" class="btn btn-primary tm-btn tm-btn-search text-uppercase" id="oneWay" style="width: 100px;">편도</button> 
				<button type="button" class="btn btn-primary tm-btn tm-btn-search text-uppercase" style="width: 100px;" id="roundTrip">왕복</button>
				<br><br>
				<div class="form-row tm-search-form-row">
					<div class="form-group tm-form-group tm-form-group-pad tm-form-group-2">
						<label for="dep">출발지</label> 
						<input name="dep" type="text" class="form-control" id="departure" placeholder="출발지를 입력해주세요" value = "${dep}" required="required">
					</div>
					
					<div class="form-group tm-form-group tm-form-group-pad tm-form-group-2">
						<label for="arr">도착지</label> 
						<input name="arr" type="text" class="form-control" id="arrival" placeholder="도착지를 입력해주세요" value = "${arr}" required="required">
					</div>
				</div>
				<br>
				<!-- form-row -->
				<div class="form-row tm-search-form-row">
					<div class="form-group tm-form-group tm-form-group-pad tm-form-group-1">
						<label for="boardTitle">가는 날</label> 
						<input type="text" class="form-control" id="depDate" name="depDate" value = "${depDate}" >
					</div>
					
					<div class="form-group tm-form-group tm-form-group-pad tm-form-group-1" id="depDiv">
						<c:if test="${!empty arrlist}">
						<label for="boardTitle">오는 날</label> 
						<input type="text" class="form-control" id="arrDate" name="arrDate" value = "${arrDate}">
						</c:if>
					</div>
					<div
						class="form-group tm-form-group tm-form-group-pad tm-form-group-1">
						<label for="btnSubmit" id="1">&nbsp;</label>
						<button type="submit" class="btn btn-primary tm-btn tm-btn-search text-uppercase "
							id="btnSubmit">검색</button>
					</div>
				</div>
			</form>
			<br><br>
			</div>
	</section>

			<input type="hidden" class="form-control" id="sampleArr" name="sampleArr" value = "${arrDate}" >
			
			<c:if test="${empty list}">
			<section class="p-5 tm-container-outer tm-bg-gray">
				<div class="container" >
				<button type="button" class="btn btn-primary tm-btn tm-btn-search text-uppercase" style="width: 100px;" onclick="location.href='/flight/search?dep=${dep}&arr=${arr}&depDate=${prevDepDay}&arrDate=${arrDate}#1'">이전날</button>
				<button type="button" class="btn btn-primary tm-btn tm-btn-search text-uppercase" style="width: 100px;" onclick="location.href='/flight/search?dep=${dep}&arr=${arr}&depDate=${nextDepDay}&arrDate=${arrDate}#1'">다음날</button>
				<h2 style="text-align: center">${depDate} : ${dep} <i class='fa fa-arrow-right'></i> ${arr}</h2>
					<div class="container" style="overflow: auto; top: 50px; width: 100%; height: 450px;">
				<br><br><br><br><br>
				<h3 style="text-align: center;">예약가능한 항공편이 없습니다. <i class='fa fa-plane'></i><br>
					다시 여정을 선택해주세요.</h3>	
				</div>
				</div>
			</section>
			</c:if>	 
			<c:if test="${!empty list}">
			<section class="p-5 tm-container-outer tm-bg-gray">
			<div class="container"  >
			<c:if test="${empty arrDate}">
				<div class="text-right">
					<button type="button" class="btn btn-primary tm-btn tm-btn-search text-uppercase" style="width: 100px;" onclick="location.href='/flight/search?dep=${dep}&arr=${arr}&depDate=${prevDepDay}#1'">이전날</button>
					<button type="button" class="btn btn-primary tm-btn tm-btn-search text-uppercase" style="width: 100px;" onclick="location.href='/flight/search?dep=${dep}&arr=${arr}&depDate=${nextDepDay}#1'">다음날</button>
				</div>
			</c:if>
			<c:if test="${!empty arrDate}">
				<div class="text-right">
					<button type="button" class="btn btn-primary tm-btn tm-btn-search text-uppercase" style="width: 100px;" onclick="location.href='/flight/search?dep=${dep}&arr=${arr}&depDate=${prevDepDay}&arrDate=${arrDate}#1'">이전날</button>
					<button type="button" class="btn btn-primary tm-btn tm-btn-search text-uppercase" style="width: 100px;" onclick="location.href='/flight/search?dep=${dep}&arr=${arr}&depDate=${nextDepDay}&arrDate=${arrDate}#1'">다음날</button>
				</div>
			</c:if>
			
			<h2 style="text-align: center">${depDate} : ${dep} <i class='fa fa-arrow-right'></i> ${arr}</h2>
			<br>
			<c:choose>
				<c:when test="${fn:length(list)<5}">
				<div class="container" style="overflow: auto; top: 50px; width: 100%; height: 400px;">
				</c:when>
				<c:otherwise>
				<div class="container" style="overflow: auto; top: 50px; width: 100%; height: 750px;">
				</c:otherwise>
			</c:choose>
			<!-- <div class="container" style="overflow: auto; top: 50px; width: 100%; height: 750px;"> -->
				<table class="table table-hover" id="depTable">
					<thead>
						<tr>
							<th>항공편명</th>
							<th>출발시간</th>
							<th>도착시간</th>
							<th>비행시간</th>
							<th>출발지</th>
							<th>도착지</th>
							<th>가격</th>							
							<th>예약하기</th>
						</tr>
					</thead>
					<c:if test="${empty list}">
						예약가능한 항공편이 없습니다. <br>
						다시 여정을 선택해주세요.
					</c:if>
					<c:forEach items="${list}" var="list">
						<tbody>
							<tr>
								<td>${list.flightName}</td>
								<td>${list.depTime}</td>
								<td>${list.arrTime}</td>
								<td>${list.flightTime}</td>
								<td>${list.depName}</td>
								<td>${list.arrName}</td>
								<td><fmt:formatNumber value="${depPrice}" type="currency" currencySymbol="￦" minFractionDigits="0" /></td>								
								<td><button type="submit"
										class="btn btn-primary tm-btn tm-btn-search text-uppercase reserve-button" id="reserve" data-fno="${list.fno}">reservation</button></td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
				<!-- 페이징 -->
		<%-- <ul class="pagination justify-content-center">
			<c:if test="${pageMaker.prev}">
				<li class="page-item"><a class="page-link"
					href="${pageMaker.startPage-1}">Previous</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="num">
				<li
					class="page-item  ${pageMaker.cri.pageNum == num ? 'active' : ''}">
					<a class="page-link" href="${num}">${num}</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li class="page-item"><a class="page-link"
					href="${pageMaker.endPage+1}">Next</a></li>
			</c:if>
		</ul> --%>
			</div>
			</div>
			</section>
			</c:if>
		
	
	<c:if test="${!empty arrDate and empty arrlist}">
	<section class="p-5 tm-container-outer tm-bg-gray">
		<div class="container" id="2">
		<div class="text-right">
			<button type="button" class="btn btn-primary tm-btn tm-btn-search text-uppercase" style="width: 100px;" onclick="location.href='/flight/search?dep=${dep}&arr=${arr}&depDate=${depDate}&arrDate=${prevArrDay}#2'">이전날</button>
			<button type="button" class="btn btn-primary tm-btn tm-btn-search text-uppercase" style="width: 100px;" onclick="location.href='/flight/search?dep=${dep}&arr=${arr}&depDate=${depDate}&arrDate=${nextArrDay}#2'">다음날</button>
		</div>
		<h2 style="text-align: center">${arrDate} :${arr} <i class='fa fa-arrow-right'></i> ${dep}</h2>
			<div class="container" style="overflow: auto; top: 50px; width: 100%; height: 450px;">
		<br><br><br><br><br>
		<h3 style="text-align: center;">예약가능한 항공편이 없습니다. <i class='fa fa-plane'></i><br>
			다시 여정을 선택해주세요.</h3>	
		</div>
		</div>
	</section>
	</c:if>	
	
		<c:if test="${!empty arrlist}">
		<section class="p-5 tm-container-outer tm-bg-gray">
		<div class="container" id="2">
		<div class="text-right">
			<button type="button" class="btn btn-primary tm-btn tm-btn-search text-uppercase" style="width: 100px;" onclick="location.href='/flight/search?dep=${dep}&arr=${arr}&depDate=${depDate}&arrDate=${prevArrDay}#2'">이전날</button>
			<button type="button" class="btn btn-primary tm-btn tm-btn-search text-uppercase" style="width: 100px;" onclick="location.href='/flight/search?dep=${dep}&arr=${arr}&depDate=${depDate}&arrDate=${nextArrDay}#2'">다음날</button>
		</div>
		<h2 style="text-align: center">${arrDate} : ${arr} <i class='fa fa-arrow-right'></i> ${dep}</h2>
			<br>
			<c:choose>
				<c:when test="${fn:length(arrlist)<5}">
				<div class="container" style="overflow: auto; top: 50px; width: 100%; height: 400px;">
				</c:when>
				<c:otherwise>
				<div class="container" style="overflow: auto; top: 50px; width: 100%; height: 750px;">
				</c:otherwise>
			</c:choose>
			<!-- <div class="container" style="overflow: auto; top: 50px; width: 100%; height: 750px;"> -->
			
				<table class="table table-hover" id="arrTable">
					<thead>
						<tr>
							<th>항공편명</th>
							<th>출발시간</th>
							<th>도착시간</th>
							<th>비행시간</th>
							<th>출발지</th>
							<th>도착지</th>
							<th>가격</th>							
							<th>예약하기</th>
						</tr>
					</thead>
					<c:forEach items="${arrlist}" var="list">
						<tbody>
							<tr>
								<td>${list.flightName}</td>
								<td>${list.depTime}</td>
								<td>${list.arrTime}</td>
								<td>${list.flightTime}</td>
								<td>${list.depName}</td>
								<td>${list.arrName}</td>
								<td><fmt:formatNumber value="${arrPrice}" type="currency" currencySymbol="￦" minFractionDigits="0" /></td>
								<td><button type="submit"
										class="btn btn-primary tm-btn tm-btn-search text-uppercase reserve-button"  id="reserve" data-fno="${list.fno}">reservation</button></td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
				<!-- 페이징 -->
		<%-- <ul class="pagination justify-content-center">
			<c:if test="${pageMaker.prev}">
				<li class="page-item"><a class="page-link"
					href="${pageMaker.startPage-1}">Previous</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="num">
				<li
					class="page-item  ${pageMaker.cri.pageNum == num ? 'active' : ''}">
					<a class="page-link" href="${num}">${num}</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li class="page-item"><a class="page-link"
					href="${pageMaker.endPage+1}">Next</a></li>
			</c:if>
		</ul> --%>
			</div>
		</div>
	</section>
	</c:if>
	
	<!-- 전달 폼 -->
	<form id="actionForm" action="/flight/search" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
		<input type="hidden" name="dep" value="${dep}" />
		<input type="hidden" name="arr" value="${arr}" />
		<input type="hidden" name="arrDate" value="${arrDate}" />
		<input type="hidden" name="depDate" value="${depDate}" />
		 						<%--<input type="hidden" name="type" value="${pageMaker.cri.type}"/>
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"/> --%>
	</form>
	
	<!-- 예약페이지 이동 -->
	<form name="resForm" action="/flight/reservation" method="get">
		 <input type="hidden" name="fno" value="" /> 
	</form>

</div>
<!-- .tm-container-outer -->
<%@ include file="../includes/footer.jsp"%>
<script type="text/javascript">
	//페이지 버튼 클릭 이동
	var actionForm = $("#actionForm");
	$(".page-item a").on("click", function(e) {
		e.preventDefault();
		console.log("test--------------------------");
		actionForm.find("input[name='pageNum']").val($(this).attr("href")); 
		actionForm.submit();
	});
	
	$(".reserve-button").on("click",function(e){
		e.preventDefault();
		alert("예약 페이지로 이동합니다.")
		var fno = $(this).data("fno");
		console.log(fno);
		//$("resForm").append("<input type='hidden' name='fno' value='" + $(this).attr("href")+ "'>");
		$("input[name='fno']").val(fno);
		$("form[name='resForm']").submit();
	})
</script>

<script>

	$("#oneWay").on("click", function(){
		console.log("편도");
		str = "";
		$("#depDiv").html(str);
		
	});
		
	var sampleArr = $("#sampleArr").val();
	var depClick = $("#roundTrip").on("click", function(){
		console.log("왕복");
		console.log(sampleArr);
		
		str = "";
		str += "<label>오는 날</label>"; 
		
		str += "<input type='text' class='form-control' id='arrDate' name='arrDate' value='"+sampleArr+"'>";
		
		
		$("#depDiv").html(str);
		
		$jLatest('input[id="arrDate"]').daterangepicker({
			singleDatePicker: true,
		    //timePicker: true,
		    timePicker24Hour: true,
			 "locale": {
			       "format": 'YYYY-MM-DD',
			       "separator": " ~ ",
			       "applyLabel": "확인",
			        "cancelLabel": "취소",
			        "fromLabel": "From",
			        "toLabel": "To",
			        "customRangeLabel": "Custom",
			        "weekLabel": "주",
			        "daysOfWeek": [
			             "일",
			             "월",
			             "화",
			             "수",
			             "목",
			             "금",
			             "토"
			       ],
			      "monthNames": [
			             "1월",
			             "2월",
			             "3월",
			             "4월",
			             "5월",
			             "6월",
			             "7월",
			             "8월",
			             "9월",
			             "10월",
			             "11월",
			             "12월"
			        ],
			        "firstDay": 1
			    },
			    
			    
			    "minDate": "2023-12-01",
			    "maxDate": "2024-02-28"
		});
	});
	
	$jLatest('input[id="dates"]').daterangepicker();
	$jLatest('input[id="depDate"]').daterangepicker({
		singleDatePicker: true,
	    //timePicker: true,
	    timePicker24Hour: true,
		 "locale": {
		       "format": 'YYYY-MM-DD',
		       "separator": " ~ ",
		       "applyLabel": "확인",
		        "cancelLabel": "취소",
		        "fromLabel": "From",
		        "toLabel": "To",
		        "customRangeLabel": "Custom",
		        "weekLabel": "주",
		        "daysOfWeek": [
		             "일",
		             "월",
		             "화",
		             "수",
		             "목",
		             "금",
		             "토"
		       ],
		      "monthNames": [
		             "1월",
		             "2월",
		             "3월",
		             "4월",
		             "5월",
		             "6월",
		             "7월",
		             "8월",
		             "9월",
		             "10월",
		             "11월",
		             "12월"
		        ],
		        "firstDay": 1
		    },
		    "minDate": "2023-12-01",
		    "maxDate": "2024-02-28"
	});

</script>