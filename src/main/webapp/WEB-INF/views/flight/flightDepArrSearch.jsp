<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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

<!-- Font Awesome 5 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

<style>
#searchTable th {
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
	<h2>출도착 조회</h2>
		<div class="container">
		<ul class="list_type3 border">
			<li>아시아나 운항 항공편에 한하여 조회가 가능하며, 공동 운항편 또는 외항사의 출도착 정보는 해당 항공사 홈페이지에서 조회하시기 바랍니다. </li>
			<li>출/도착 일자 및 시간은 현지 시간 기준입니다.</li>
		</ul>
		
		<button type="button" class="btn btn-primary tm-btn tm-btn-search text-uppercase" id="route" style="width: 100px;">노선</button> 
		<button type="button" class="btn btn-primary tm-btn tm-btn-search text-uppercase" id="fName" style="width: 100px;">편명</button>
			<form action="/flight/flightDepArrSearch" method="get" class="tm-search-form tm-section-pad-1">
				<br><br>
				<div class="form-row tm-search-form-row" id="searchText">
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
						<label>조회 일자</label> 
						<input type="text" class="form-control" id="targetDate" name="targetDate" value = "${targetDate}">
					</div>
					<div class="form-group tm-form-group tm-form-group-pad tm-form-group-1">
					</div>
					<div class="form-group tm-form-group tm-form-group-pad tm-form-group-1">
						<label for="btnSubmit">&nbsp;</label>
						<button type="submit" class="btn btn-primary tm-btn tm-btn-search text-uppercase" id="btnSubmit">검색</button>
					</div>
				</div>
			</form>
			<br>
			
			<input type="hidden" id="sampleDep" name="sampleDep" value = "${dep}" >
			<input type="hidden" id="sampleArr" name="sampleArr" value = "${arr}" >
			
			<div class="container">
				
				<table class="table table-hover" id="searchTable">
					<thead>
						<tr>
							<th>항공편명</th>
							<th>출발시간</th>
							<th>도착시간</th>
							<th>출발지</th>
							<th>도착지</th>
							<th>상태</th>
						</tr>
					</thead>
					<c:forEach items="${list}" var="list">
						<tbody>
							<tr>
								<td>${list.flightName}</td>
								<td>${list.fullDeptime}</td>
								<td>${list.fullArrtime}</td>
								<td>${list.depName}</td>
								<td>${list.arrName}</td>
								<c:choose>
									<c:when test="${now<list.fullDeptime}">
										<td><i class='far fa-clock' style='font-size:24px'></i><br>출발 전</td>
									</c:when>
									<c:when test="${now>list.fullArrtime}">
										<td><i class='fas fa-plane-arrival' style='font-size:24px'></i><br>도착 완료</td>
									</c:when>
									<c:otherwise>
										<td><i class='fas fa-plane' style='font-size:24px'></i><br>비행 중</td>										
									</c:otherwise>
								</c:choose>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			
				<!-- 페이징 -->
				<ul class="pagination justify-content-center">
					<c:if test="${pageMaker.prev}">
						<li class="page-item">
							<a class="page-link" href="${pageMaker.startPage-1}">Previous</a>
						</li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
							<li class="page-item ${pageMaker.cri.pageNum==num ? "active" : ""}" >
								<a class="page-link" href="${num}">${num}</a>
							</li>
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<li class="page-item"><a class="page-link" href="${pageMaker.endPage+1}">Next</a></li>
					</c:if>
				</ul>
		
			</div>
		</div>
	</section>
	
	<!-- 전달 폼 -->
	<form id="actionForm2" action="/flight/flightDepArrSearch" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
		<input type="hidden" name="dep" value="${dep}" />
		<input type="hidden" name="arr" value="${arr}" />
		<input type="hidden" name="targetDate" value="${targetDate}" />
	</form>

</div>
<!-- .tm-container-outer -->
<%@ include file="../includes/footer.jsp"%>

<script type="text/javascript">
	//페이지 버튼 클릭 이동
	var actionForm = $("#actionForm2");
	$(".page-item a").on("click", function(e) {
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href")); 
		actionForm.submit();
	});
	
</script>

<script>
	$("#fName").on("click", function(){
		console.log("편명");
		str = "";
		str += "<div class='form-group tm-form-group tm-form-group-pad tm-form-group-2' style='float:right;'>";
		str += "<label for='flightName'>항공편명</label> ";
		str += "<input name='flightName' type='text' class='form-control' id='flightName' placeholder='항공편명을 입력해주세요' value='OZ' required='required'>";
		str += "</div>";
		str += "<div class='form-group tm-form-group tm-form-group-pad tm-form-group-2' style='float:right;'>";
		str += "</div>";
		
		$("#searchText").html(str);
		
	});
	
	var sampleDep = $("#sampleDep").val();
	var sampleArr = $("#sampleArr").val();
	$("#route").on("click", function(){
		console.log("노선");
		str = "";
		str += "<div class='form-group tm-form-group tm-form-group-pad tm-form-group-2'>"; 
		str += "<label for='dep'>출발지</label>";
		str += "<input name='dep' type='text' class='form-control' id='departure' placeholder='출발지를 입력해주세요' value = '" + sampleDep + "' required='required'>";
		str += "</div>";
		str += "<div class='form-group tm-form-group tm-form-group-pad tm-form-group-2'>"; 
		str += "<label for='arr'>도착지</label>";
		str += "<input name='arr' type='text' class='form-control' id='arrival' placeholder='도착지를 입력해주세요' value = '" + sampleArr + "' required='required'>";
		str += "</div>";
		
		$("#searchText").html(str);
		
	});
	
	$jLatest('input[id="targetDate"]').daterangepicker({
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