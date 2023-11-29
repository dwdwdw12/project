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
</style>

<div class="tm-page-wrap mx-auto">
	<section class="p-5 tm-container-outer tm-bg-gray">
		<div class="container">
			<div class="row gx-6">
				<div class="col">
					<div class="p-3 border bg-light">
						<input type="hidden" id="weather" value=""/>
						<button type="button"
							class="btn btn-primary btn-sm btn-block btn-weath" onclick="">상세조회 >></button>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	<section class="p-5 tm-container-outer tm-bg-gray">
		<div class="container">
			<div class="row gx-6"><div class="col"><p><h2 style="text-align: center;">오늘의 날씨</h2></p></div></div>
			<div class="row gx-6">
				<div class="col">
					<div class="p-3 bg-light" style="float: left; width: 33%;">
					
						<dl>
							<dt>기온</dt>
							<dd class="temperature"><dd>
						</dl>
					</div>
					<div class="p-3  bg-light" style="float: left; width: 33%;">
						<dl>
							<dt>위치</dt>
							<dd class="place"><dd>
						</dl>
					</div>
					<div class="p-3 bg-light" style="float: left; width: 33%;">
						<dl>
							<dt>설명</dt>
							<img class="icon"/>
							<dd class="description"><dd>
						</dl>
					</div>
					<div class="p-3 border bg-light">
						<input type="hidden" id="weather" value=""/>
						<button type="button"
							class="btn btn-primary btn-sm btn-block btn-weather" onclick="">상세조회 >></button>
					</div>
				</div>
			</div>
		</div>
	</section>

<!-- 회원정보 조회 -->
	<section class="p-5 tm-container-outer tm-bg-gray">

		<!-- .tm-container-outer -->
		<div class="container">
			<div class="row gx-6">
				<div class="col">
					<div class="p-3 border bg-light">
						<p><h2>전체 회원정보 조회</h2></p>
						<table class="table table-hover">
			      		   <thead>
						      <tr>
						        <th>아이디</th>
						        <th>닉네임</th>
						        <th>등급</th>
						        <th>메일</th>
						        <th>핸드폰</th>
						        <th>관리자여부</th>
						      </tr>
						    </thead>
						    <c:forEach items="${vo}" var="vo">
						    <tbody>
						      <tr>
						        <td>${vo.userId}</td>
						        <td>${vo.userNick}</td>
						        <c:choose>
							        <c:when test="${vo.gradeCode=1}">
							        	<td>관리자</td>
							        </c:when>
							        <c:otherwise test="${vo.gradeCode=0}">
							        	<td>일반회원</td>
							        </c:otherwise>
						        
						        </c:choose>
						        <td>${vo.mail}</td>
						        <td>${vo.phone}</td>
						        <td>${vo.admin}</td>
						      </tr>
						     </tbody>
						      </c:forEach>	      		
			      		</table>
 					<button type="button" class="btn btn-primary btn-sm btn-block btn-custom" onclick="">내정보조회 >></button>	
		    	 </div>
		    </div>
 		 </div>
		
		</div>
	</section>
	
	<!-- 매출현황 조회 -->
	<section class="p-5 tm-container-outer tm-bg-gray">

		<!-- .tm-container-outer -->
		<div class="container">
			<div class="row gx-6">
				<div class="col">
					<div class="p-3 border bg-light">
						<p><h2>매출현황</h2></p>
				<%-- 		<table class="table table-hover">
			      		   <thead>
						      <tr>
						        <th>일시</th>
						        <th>적립/사용 카카오페이</th>
						      </tr>
						    </thead>
						    <c:forEach items="${kvo3}" var="kvo">
						    <tbody>
						      <tr>
						        <td><fmt:formatDate value="${kvo.buyDate}"
														pattern="yyyy-MM-dd HH:mm" /></td>
						        <td>${kvo.amount}</td>
						      </tr>
						     </tbody>
						      </c:forEach>	      		
			      		</table> --%>
 					<button type="button" class="btn btn-primary btn-sm btn-block btn-custom" onclick="">내정보조회 >></button>	
		    	 </div>
		    </div>
			<div class="col">
					<div class="p-3 border bg-light">
						<p><h2>매출현황</h2></p>
	<%-- 					<table class="table table-hover">
			      		   <thead>
						      <tr>
						        <th>일시</th>
						        <th>적립/사용 카카오페이</th>
						      </tr>
						    </thead>
						    <c:forEach items="${kvo3}" var="kvo">
						    <tbody>
						      <tr>
						        <td><fmt:formatDate value="${kvo.buyDate}"
														pattern="yyyy-MM-dd HH:mm" /></td>
						        <td>${kvo.amount}</td>
						      </tr>
						     </tbody>
						      </c:forEach>	 --%>      		
			      		</table>
 					<button type="button" class="btn btn-primary btn-sm btn-block btn-custom" onclick="">내정보조회 >></button>	
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
							 항공권 예약/구매 현황 </h3>
						</p>
<%-- 			    	 	<table class="table table-hover">
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
	      			</table> --%>
	      			<button type="button"
							class="btn btn-primary btn-sm btn-block btn-custom" onclick="">상세조회 >></button>
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
							공지사항 작성 현황 </h3>
						</p>
<%-- 			    	 	<table class="table table-hover">
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
	      			</table> --%>
	      			<button type="button"
							class="btn btn-primary btn-sm btn-block btn-custom" onclick="">상세조회 >></button>
			    	 </div>
			   	 </div>
			   	 
   	 		    <div class="col">
			    	 <div class="p-3 border bg-light">
			    	 <p>
						<h3 style="text-align: center;">
							이벤트 게시판 작성 현황 </h3>
						</p>
<%-- 			    	 	<table class="table table-hover">
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
	      			</table> --%>
	      			<button type="button"
							class="btn btn-primary btn-sm btn-block btn-custom" onclick="">상세조회 >></button>
			    	 </div>
			   	 </div>
	    	 </div>
    	 </div>
   	 </section>
	    	 

	<!-- .tm-container-outer -->
	<%@ include file="includes/footer.jsp"%>
<!--  	<script type="text/javascript">
	$(".btn-weather").on("click",function(e){
		e.preventDefault();
		console.log("dd");
		
		const API_KEY = '7b8ae9e52a7e1bb3db6bfbe353ec511d';
		
		const success = (position) => {
  			console.log(position);
  			const latitude = position.coords.latitude;
  		  	const longitude = position.coords.longitude;
  		  	getWeather(latitude, longitude);
		}
		
		const fail = () => {
  			console.log("좌표정보 받기 실패");
		}
		
		const getWeather = (lat, lon) => {
			fetch(
			    `https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}&units=metric&lang=kr`
			  ).then((response) => {
			      return response.json();
		    }).then((json) => {
		        console.log(json);
		    }).catch((error) => {
		        alert(error);
		    }).then((json) => {
		        const temperature = json.main.temp;
		        const place = json.name;
		        const description = json.weather[0].description;
		        const icon = json.weather[0].icon;
		        const iconURL = `http://openweathermap.org/img/wn/${icon}@2x.png`;

		        tempSection.innerText = temperature;
		        placeSection.innerText = place;
		        descSection.innerText = description;
		        iconSection.setAttribute('src', iconURL);
		      });
		}
		
		
		
		navigator.geolocation.getCurrentPosition(success, fail);
		//navigator.geolocation.getCurrentPosition(success, error, [options])
		//requestCoords();
	})
	  
</script>-->
<script type="text/javascript">
$(function(){
	console.log("dd");
	const API_KEY = '7b8ae9e52a7e1bb3db6bfbe353ec511d';
	
	const success = (position) => {
			console.log(position);
			const latitude = position.coords.latitude;
		  	const longitude = position.coords.longitude;
		  	getWeather(latitude, longitude);
	}
	
	const fail = () => {
			console.log("좌표정보 받기 실패");
	}
	
	const getWeather = (lat, lon) => {
		fetch(
		    `https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}&units=metric&lang=kr`
		  ).then((response) => {
		      return response.json();
	    }).then((json) => {
	        console.log(json);
	    }).catch((error) => {
	        alert(error);
	    }).then((json) => {
	        const temperature = json.main.temp;
	        const place = json.name;
	        const description = json.weather[0].description;
	        const icon = json.weather[0].icon;
	        const iconURL = `http://openweathermap.org/img/wn/${icon}@2x.png`;

	        tempSection.innerText = temperature;
	        placeSection.innerText = place;
	        descSection.innerText = description;
	        iconSection.setAttribute('src', iconURL);
	      });
	}
	
	
	
	navigator.geolocation.getCurrentPosition(success, fail);
	//navigator.geolocation.getCurrentPosition(success, error, [options])
	//requestCoords();
	
});
</script>