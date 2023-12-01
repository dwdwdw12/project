<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="includes/header2.jsp"%>
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

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="../resources/js/vendor/modernizr.custom.min.js"></script>
<link rel="stylesheet" href="../resources/css/normalize.css">
<style>
span:before {
	font-family: bootstrap-icons;
}

.currIcon{
   font-size: 22ex;
   text-align: center; 
   color: #ffc107;
}

.currTemp{
	text-align: center; 
}
.city{
 	text-align: center; 
}
</style>

<div class="tm-page-wrap mx-auto">
	<%-- <section class="p-5 tm-container-outer tm-bg-gray">
		<div class="container">
			<div class="row gx-6">
				<div class="col">
					<div class="p-3 border bg-light">
						<img src="../resources/img/kakao/flyinglion.png" alt="background img for userPage" width="1000" height="335"/>
					</div>
				</div>
			</div>
		</div>
	</section>
	 --%>
	
	<section class="p-5 tm-container-outer tm-bg-gray">
		<div class="container">
			<div class="row gx-6">
<!-- 				<div class="col">
					<div class="p-3 bg-light" style="float: left; width: 33%;">
						<div class="weather">
							<div class="currIcon"></div>
							<div class="currTemp"></div>
							<div class="city"></div>
						</div>
					</div>
				</div> -->
				<div class="col" style="width: 33%;">
					<div class="p-3 bg-light">
						<div class="weather">
							<div class="currIcon"></div>
							<div class="currTemp"></div>
							<div class="city"></div>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="p-3 bg-light">
					<p ><h3 style="text-align: center;"><i class="bi bi-check-lg"></i><strong>오늘의 날씨</strong></h3></p>
						<div class="detail">
							<div class=""></div>
							<div class=""></div>
							<div class=""></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="p-5 tm-container-outer tm-bg-gray">

		<!-- .tm-container-outer -->
		<div class="container">
			<div class="row gx-6">
				<div class="col">
					<div class="p-3 border bg-light">
						<p><h2>
							<strong>${vo.userNameK}(${vo.userNameE})</strong>님
						</h2>
						</p>
 					<button type="button"
							class="btn btn-primary btn-sm btn-block btn-custom" onclick="">내정보조회 >></button>
					<p>현재 등급 >> ${grade}</p>
					<button type="button"
							class="btn btn-primary btn-sm btn-block btn-custom" onclick="">등급조회 >></button>
					<p>
						<h2 style="text-align: center;">
							<strong>알림</strong>
						</h2>
						</p>
					<hr>
					<p>
							<i class="bi bi-check2-circle"></i>결항사항 체크 완료</p>
					<p>
							<i class="bi bi-check-lg"></i>별도 공지사항</p>
		    	 </div>
		    </div>

	        <div class="col">
	      		<div class="p-3 border bg-light">
	      		<p>
						<h3>마일리지 >><strong><fmt:formatNumber
									value="${sumP}" pattern="#,###" /></strong>
						</h3>
						</p>
	      		<table class="table table-hover">
	      		   <thead>
				      <tr>
				        <th>일시</th>
				        <th>적립/사용마일리지</th>
				      </tr>
				    </thead>
				    <c:forEach items="${pvo3}" var="list">
				    <tbody>
				      <tr>
				        <td><fmt:formatDate value="${list.getDate}"
												pattern="yyyy-MM-dd HH:mm" /></td>
				        <td>${list.mileage}</td>
				      </tr>
				     </tbody>
				      </c:forEach>	      		
	      		</table>
	      		<button type="button"
							class="btn btn-primary btn-sm btn-block btn-custom" onclick="location.href='/user/mileage'">상세조회 >></button>
	      		</div>
	   		 </div>
	   		 
	   		  <div class="col">
				<div class="p-3 border bg-light">
	      		<p>
						<h3>카카오페이 잔액 >><strong><fmt:formatNumber
									value="${sumK}" pattern="#,###" /></strong>
						</h3>
						</p>
	      		<table class="table table-hover">
	      		   <thead>
				      <tr>
				        <th>일시</th>
				        <th>적립/사용 카카오페이</th>
				      </tr>
				    </thead>
				    <c:forEach items="${kvo3}" var="kvo">
				    <tbody>
				      <tr>
				        <td><fmt:formatDate value="${kvo.buyDate}" pattern="yyyy-MM-dd HH:mm" /></td>
				        <td>${kvo.amount}</td>
				      </tr>
				     </tbody>
				      </c:forEach>	      		
	      		</table>
	      		
		      		<button type="button" class="btn btn-primary btn-sm btn-block" onclick="location.href='/user/chargePoint'" >충전 >></button>
		      		<button type="button" class="btn btn-primary btn-sm btn-block" onclick="location.href='/user/kakaoDetail'" >상세조회 >></button>
	      		
	      		</div>
		    </div>
 		 </div>
		
		</div>
	</section>
	
	<!-- 항공권 예약/조회내역 -->
	<section class="p-5 tm-container-outer tm-bg-gray">
		<div class="container">
			<div class="row gx-6">
			    <div class="col">
			    	 <div class="p-3 border bg-light">
			    	 <p>
						<h3 style="text-align: center;">
							<strong>${vo.userNameK} 님</strong> 항공권 예약 현황 </h3>
						</p>
			    	 	<table class="table table-hover">
					    <thead>
					    	<th>시간</th>
					    	<th>내용</th>
					    	<th>내용</th>
					    	<th>내용</th>
					    </thead>
					    <c:forEach items="${pvo3}" var="list">
					    <tbody>
					      <tr>
					        <td><fmt:formatDate value="${list.getDate}"
												pattern="yyyy-MM-dd HH:mm" /></td>
					        <td>${list.mileage}</td>
					        <td>${list.mileage}</td>
					        <td>${list.mileage}</td>
					      </tr>
					     </tbody>
					      </c:forEach>	      		
	      			</table>
	      			<button type="button" class="btn btn-primary btn-sm btn-block btn-custom" onclick="location.href='/user/userResDetail'">상세조회 >></button>
			    	 </div>
			   	 </div>
	    	 </div>
    	 </div>
   	 </section>
   	 
   	 	<!-- 게시글 작성내역 -->
	<section class="p-5 tm-container-outer tm-bg-gray">
		<div class="container">
			<div class="row gx-6">
			    <div class="col">
			    	 <div class="p-3 border bg-light">
			    	 <p>
						<h3 style="text-align: center;">
							<strong>${vo.userNameK} 님</strong> 문의게시글 작성 현황 </h3>
							<p>아직 없음</p>
						</p>
			    	 	<table class="table table-hover">
					    <thead>
					    	<th>시간</th>
					    	<th>내용</th>
					    	<th>내용</th>
					    	<th>내용</th>
					    </thead>
					    <c:forEach items="${pvo3}" var="list">
					    <tbody>
					      <tr>
					        <td><fmt:formatDate value="${list.getDate}"
												pattern="yyyy-MM-dd HH:mm" /></td>
					        <td>${list.mileage}</td>
					        <td>${list.mileage}</td>
					        <td>${list.mileage}</td>
					      </tr>
					     </tbody>
					      </c:forEach>	      		
	      			</table>
	      			<button type="button"
							class="btn btn-primary btn-sm btn-block btn-custom" onclick="">상세조회 >></button>
			    	 </div>
			   	 </div>
			   	 
   	 		    <div class="col">
			    	 <div class="p-3 border bg-light">
			    	 <p>
						<h3 style="text-align: center;">
							<strong>${vo.userNameK} 님</strong> 여행일기작성 현황 </h3>
						</p>
			    	 	<table class="table table-hover">
					    <thead>
					    	<th>제목</th>
					    	<th>내용</th>
					    	<th>작성일자</th>
					    </thead>
					    <c:forEach items="${dvo}" var="dvo">
					    <tbody>
					      <tr>
					        <td>${dvo.boardTitle}</td>
					        <td>${dvo.boardContent}</td>
  					        <td><fmt:parseDate var = "datePase" value="${dvo.regiDate}" pattern="yyyy-MM-dd HH:mm"/><fmt:formatDate value="${datePase}" pattern="yyyy-MM-dd HH:mm" /></td>
					      </tr>
					     </tbody>
					      </c:forEach>	      		
	      			</table>
	      			<button type="button"
							class="btn btn-primary btn-sm btn-block btn-custom" onclick="">상세조회 >></button>
			    	 </div>
			   	 </div>
	    	 </div>
    	 </div>
   	 </section>
	    	 

	<!-- .tm-container-outer -->
<script defer src="https://use.fontawesome.com/releases/v5.15.2/js/all.js" integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF" crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function(){
	const API_KEY = '7b8ae9e52a7e1bb3db6bfbe353ec511d';
	var apiUrl = "https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid="+API_KEY+"&units=metric";
	let weatherIcon = {        
			'01' : 'fas fa-sun',
			'02' : 'fas fa-cloud-sun',
			'03' : 'fas fa-cloud',
			'04' : 'fas fa-cloud-meatball',
			'09' : 'fas fa-cloud-sun-rain',
			'10' : 'fas fa-cloud-showers-heavy',
			'11' : 'fas fa-poo-storm',
			'13' : 'far fa-snowflake',
			'50' : 'fas fa-smog'      
	};
	  
	
	$.ajax({
		url : apiUrl,
		dataType: "json",
		type : "GET",
		async : "false",
		success : function(resp){
			console.log(resp);
			console.log("현재 온도 : "+(resp.main.temp));
			console.log("현재 습도 : "+(resp.main.humidity));
			console.log("날씨 : "+(resp.weather[0].main));
			console.log("상세날씨설명 : "+(resp.weather[0].description));
			console.log("날씨 이미지 : "+(resp.weather[0].icon));
			console.log("바람 : "+(resp.wind.speed));
			console.log("나라 : "+(resp.sys.country));
			console.log("도시이름 : "+(resp.name));
			console.log("구름 : "+(resp.clouds.all));
/* 			$(".weather").append("<p>현재 온도: " + (resp.main.temp) + "℃</p>");
			$(".weather").append("<p>현재 습도: " + resp.main.humidity + "%</p>");
			$(".weather").append("<p>날씨: " + resp.weather[0].main + "</p>");
			$(".weather").append("<p>상세날씨설명: " + resp.weather[0].description + "</p>");
			$(".weather").append("<p>바람: " + resp.wind.speed + " m/s</p>");
			$(".weather").append("<p>나라: " + resp.sys.country + "</p>");
			$(".weather").append("<p>도시이름: " + resp.name + "</p>");
			$(".weather").append("<p>구름: " + resp.clouds.all + "%</p>"); */
			//var weatherIcon = '<img src="http://openweathermap.org/img/wn/'+resp.weather[0].icon+'png" alt="'+resp.weather[0].description+'"/>'
			//$(".weather").html(weatherIcon);
			var $Icon = (resp.weather[0].icon).substr(0,2);      
			var $Temp = Math.floor(resp.main.temp) + 'º';      
			var $city = resp.name;
			  $('.currIcon').append('<i class="' + weatherIcon[$Icon] +'"></i>');      
			  $('.currTemp').prepend($Temp);      
			  $('.city').append($city);
			  
			  $(".detail").append("<p>나라/도시: " + resp.sys.country+"/" +resp.name +"</p>");
			  $(".detail").append("<p>상세날씨설명: " + resp.weather[0].description + "</p>");
			  $(".detail").append("<p>구름: " + resp.clouds.all + "%</p>"); 
			  $(".detail").append("<p>바람: " + resp.wind.speed + " m/s</p>");
			  $(".detail").append("<p>현재 온도: " + (resp.main.temp) + "℃</p>");
			 

		}
	});
	});
</script>
	<%@ include file="includes/footer.jsp"%>