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

<!-- 이미지로더 -->
<script src="http://mattstow.com/experiment/responsive-image-maps/jquery.rwdImageMaps.min.js"></script>
<style>
/* img{
max-width: 100%;
} */

.slideshow {
	height: 465px;
	overflow: hidden; /*높이와 overflow만 잡아주면 이미지 중첩됨*/
	position: relative;
}

.slideshow img {
	position: absolute;
	/*이미지 위치 가운데로 옮기기*/
	left: 50%; /*오른쪽으로 50% 밀고 margin으로 위치 조정*/
	margin-left: -800px;
	display: none;
}
</style>

<div class="tm-page-wrap mx-auto">
	<section class="tm-banner">

		<!-- .tm-container-outer -->
		<div class="inner">
			<div class="slideshow">
				<img src="../resources/img/tm-img-01.jpg" alt="" width="1600"
					height="1000"> <img src="../resources/img/tm-img-02.jpg"
					alt="" width="1600" height="1000"> <img
					src="../resources/img/tm-img-03.jpg" alt="" width="1600"
					height="1000"> <img src="../resources/img/tm-img-04.jpg"
					alt="" width="1600" height="1000">
			</div>
		</div>
	</section>

	<section class="p-5 tm-container-outer tm-bg-gray">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 mx-auto tm-about-text-wrap text-center">
					<h2 class="text-uppercase mb-4">
						${fno} 번 비행기 좌석선택 -> 비행기 루트로 바꾸기
					</h2>
					<p class="mb-4">Nullam auctor, sapien sit amet lacinia euismod,
						lorem magna lobortis massa, in tincidunt mi metus quis lectus.
						Duis nec lobortis velit. Vivamus id magna vulputate, tempor ante
						eget, tempus augue. Maecenas ultricies neque magna.</p>
					<!-- 					<a href="#" class="text-uppercase btn-primary tm-btn">Continue
						explore</a> -->
					
					<img src="../resources/img/비행기 좌석도.jpg" usemap="#image-map" style="text-align: center;">
							<map name="image-map" id="seats">
								<area class="seat" target="" alt="A1" coords="292,204,374,277" shape="rect" id="A1" >
								<area class="seat" target="" alt="A2" href="A2" coords="292,296,374,370" shape="rect" id="A2" >
								<area class="seat" target="" alt="A3" href="A3" coords="292,389,374,462" shape="rect" id="A3">
								<area class="seat" target="" alt="A4" href="A4" coords="292,481,374,555" shape="rect" id="A4"  >
								<area class="seat" target="" alt="B1" href="B1" coords="465,204,546,277" shape="rect" id="B1">
								<area class="seat" target="" alt="B2" href="B2" coords="465,296,546,370" shape="rect" id="B2">
								<area class="seat" target="" alt="B3" href="B3" coords="465,389,546,462" shape="rect" id="B3">
								<area class="seat" target="" alt="B4" href="B4" coords="465,481,546,555" shape="rect" id="B4">
								<area class="seat" target="" alt="C1" href="C1" coords="564,204,644,277" shape="rect" id="C1">
								<area class="seat" target="" alt="C2" href="C2" coords="564,296,644,370" shape="rect" id="C2">
								<area class="seat" target="" alt="C3" href="C3" coords="564,389,644,462" shape="rect" id="C3">
								<area class="seat" target="" alt="C4" href="C4" coords="564,481,644,555" shape="rect" id="C4">
								<area class="seat" target="" alt="D1" href="D1" coords="750,204,833,277" shape="rect" id="D1">
								<area class="seat" target="" alt="D2" href="D2" coords="750,296,833,370" shape="rect" id="D2">
								<area class="seat" target="" alt="D3" href="D3" coords="750,389,833,462" shape="rect" id="D3">
								<area class="seat" target="" alt="D4" href="D4" coords="750,481,833,555" shape="rect" id="D4">
								<area class="seat" target="" alt="E1" href="E1" coords="850,204,931,277" shape="rect" id="E1">
								<area class="seat" target="" alt="E2" href="E2" coords="850,296,931,370" shape="rect" id="E2">
								<area class="seat" target="" alt="E3" href="E3" coords="850,389,931,462" shape="rect" id="E3">
								<area class="seat" target="" alt="E4" href="E4" coords="850,481,931,555" shape="rect" id="E4">
								<area class="seat" target="" alt="F1" href="F1" coords="946,204,1028,277" shape="rect" id="F1">
								<area class="seat" target="" alt="F2" href="F2" coords="946,296,1028,370" shape="rect" id="F2">
								<area class="seat" target="" alt="F3" href="F3" coords="946,389,1028,462" shape="rect" id="F3">
								<area class="seat" target="" alt="F4" href="F4" coords="946,481,1028,555" shape="rect" id="F4">
							</map>
					</div>
			</div>		
						
		</div>
	</section>
	
	<!-- 전달 폼 -->
	<form id="resForm" action="/flight/flightRes" method="get">
		<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'/>
	</form>
111
  
</div>
<!-- .tm-container-outer -->
<%@ include file="../includes/footer.jsp"%>
<script>
$(document).ready(function(e) {
	$('img[usemap]').rwdImageMaps();	
});
</script>
<script type="text/javascript">
	$(".seat").click(function(e){
		e.preventDefault();
		/* alert($(this).attr('id')); */
	 	$("#resForm").append("<input type='hidden' name='fno' value='" + ${fno}+ "'>");
		$("#resForm").append("<input type='hidden' name='seat' value='" +$(this).attr('id')+ "'>");
		$("#resForm").submit();
		alert("ddddddd");
		
	})
/* 	var seat = $("area[name='s']").href();
	/* var seat = $(this).document.getElementByName("s").getAttribute("href"); 
	alert(seat);
 	$("#actionForm").append("<input type='hidden' name='fno' value='" + ${fno}+ "'>");
	$("#actionForm").append("<input type='hidden' name='seat' value='" + $(this).attr("href")+ "'>");
	$("#actionForm").submit(); */
	
</script>
<script type="text/javascript">
	$(function() {
		$('.slideshow').each(function() {
			// each : 앞에 선택된 내용의 개수만큼 반복하도록 하는 메서드
			let $slides = $(this).find("img");
			let slideCount = $slides.length;
			let currentIndex = 0;
			$slides.eq(currentIndex).fadeIn();
			// 첫 이미지를 나타나게 함

			// 다음이미지가 나타나게 끔->현재 이미지를 페이드아웃하고 다음이미지를 나타나게 하고 현재이미지값으로 변경시켜서 로테이션돌게 함
			let showNextSlide = function() {
				let nextIndex = (currentIndex + 1) % slideCount;
				// 다음이미지의 인덱스 값을 구하는데 이미지가 4개이므로 최대값이 3이되어야 함 따라서 나머지 연산자를 통해 반복하도록 함(1~4의 값을 4로 나누므로 0~3을 반복시킴-어차피 0은 위에서 표시되도록 했으니까.....?)
				$slides.eq(currentIndex).fadeOut();
				// 현재 이미지를 사라지게 하고
				$slides.eq(nextIndex).fadeIn();
				// 위에서 구한 다음 이미지를 나타나게 함
				currentIndex = nextIndex;
				// 다음 이미지의 값을 현재로 
			}

			let timer = setInterval(showNextSlide, 1000);
			$(this).on('mouseover', function() {
				//타이머 취소
				clearInterval(timer);
			}).on('mouseout', function() {
				//타이머 시작
				timer = setInterval(showNextSlide, 1000);
			})
		})
	});

	// Slick Carousel
	$('.tm-slideshow').slick({
		infinite : true,
		arrows : true,
		slidesToShow : 1,
		slidesToScroll : 1
	});
</script>