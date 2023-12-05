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

<div class="tm-page-wrap mx-auto" style="margin-top : 180px;">
	
	<section class="p-5 tm-container-outer tm-bg-gray">
	<h2>운항 일정</h2>
		<div class="container">
			
			<form action="/flight/search" method="get" class="tm-search-form tm-section-pad-1">
				<button type="button" class="btn btn-primary tm-btn tm-btn-search text-uppercase" id="oneWay" style="width: 100px;">편도</button> 
				<button type="button" class="btn btn-primary tm-btn tm-btn-search text-uppercase" style="width: 100px;" id="roundTrip">왕복</button>
				<br><br>
				<div class="form-row tm-search-form-row">
					<div class="form-group tm-form-group tm-form-group-pad tm-form-group-2">
						<label for="dep">출발지</label> 
						<input name="dep" type="text" class="form-control" id="departure" placeholder="출발지를 입력해주세요" required="required">
					</div>
					
					<div class="form-group tm-form-group tm-form-group-pad tm-form-group-2">
						<label for="arr">도착지</label> 
						<input name="arr" type="text" class="form-control" id="arrival" placeholder="도착지를 입력해주세요" required="required">
					</div>
				</div>
				<br>
				<!-- form-row -->
				<div class="form-row tm-search-form-row">
					<div class="form-group tm-form-group tm-form-group-pad tm-form-group-1">
						<label>가는 날</label> 
						<input type="text" class="form-control" id="depDate" name="depDate" value = "${depDate}">
					</div>
					<div class="form-group tm-form-group tm-form-group-pad tm-form-group-1" id="depDiv">
						<%-- <label for="boardTitle" id="depLabel" hidden="">오는 날</label> 
						<input type="hidden" class="form-control" id="arrDate" name="arrDate" value = "${arrDate}"> --%>
					</div>
					<div class="form-group tm-form-group tm-form-group-pad tm-form-group-1">
						<label for="btnSubmit">&nbsp;</label>
						<button type="submit" class="btn btn-primary tm-btn tm-btn-search text-uppercase" id="btnSubmit">검색</button>
					</div>
				</div>
			</form>
			<br>
			<div class="container">
				
				<table class="table table-hover">
					<thead>
						<tr>
							<th>항공편명</th>
							<th>출발시간</th>
							<th>도착시간</th>
							<th>출발지</th>
							<th>도착지</th>
							<th>예약하기</th>
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
								<td><button type="button" class="btn btn-primary tm-btn tm-btn-search text-uppercase reserve-button" id="reserve" data-fno="${list.fno}">reservation</button></td>
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
	<form id="actionForm" action="/flight/list" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
		<input type="hidden" value='sec:authentication property="principal.username"'/>
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
	
	$("#roundTrip").on("click", function(){
		console.log("왕복");
		str = "";
		str += "<label>오는 날</label>"; 
		str += "<input type='text' class='form-control' id='arrDate' name='arrDate'>";
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