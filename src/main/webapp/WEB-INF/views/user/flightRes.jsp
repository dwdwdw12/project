<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
img{
max-width: 100%;
}

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
						비행기 티켓 결제페이지
					</h2>
					<p class="mb-4">Nullam auctor, sapien sit amet lacinia euismod,
						lorem magna lobortis massa, in tincidunt mi metus quis lectus.
						Duis nec lobortis velit. Vivamus id magna vulputate, tempor ante
						eget, tempus augue. Maecenas ultricies neque magna.</p>
					<!-- 					<a href="#" class="text-uppercase btn-primary tm-btn">Continue
						explore</a> -->
						${fno}, ${seat}
				</div>
			</div>		
					
		</div>
	</section>
	
	<!-- 전달 폼 -->
	<form id="actionForm" action="/user/flightRes" method="get">
	</form>


</div>
<!-- .tm-container-outer -->
<%@ include file="../includes/footer.jsp"%>
<script>
$(document).ready(function(e) {
	$('img[usemap]').rwdImageMaps();
	
	$("#seats").on("click","area",function(e){
		e.preventDefault();
		$("#actionForm").append("<input type='hidden' name='fno' value='" + ${fno}+ "'>");
		$("#actionForm").append("<input type='hidden' name='seat' value='" + $(this).attr("href")+ "'>");
		$("#actionForm").submit();
		
	})
});
</script>

<script type="text/javascript">
	//페이지 버튼 클릭 이동
	var actionForm = $("#actionForm");
	$(".page-item a").on("click", function(e) {
		e.preventDefault();
		console.log("test--------------------------");
		actionForm.find("input[name='pageNum']").val($(this).attr("href")); 
		actionForm.submit();
	});
</script>
<!-- 충돌부분 추가 -->
<script type="text/javascript">
	var $jLatest = jQuery.noConflict();
	$jLatest('input[id="dates"]').daterangepicker();
	$jLatest('input[id="startDate"]').daterangepicker(
			{
				singleDatePicker : true,
				timePicker : true,
				timePicker24Hour : true,
				"locale" : {
					"format" : 'YYYY-MM-DD HH:mm:SS',
					"separator" : " ~ ",
					"applyLabel" : "확인",
					"cancelLabel" : "취소",
					"fromLabel" : "From",
					"toLabel" : "To",
					"customRangeLabel" : "Custom",
					"weekLabel" : "주",
					"daysOfWeek" : [ "일", "월", "화", "수", "목", "금", "토" ],
					"monthNames" : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월",
							"8월", "9월", "10월", "11월", "12월" ],
					"firstDay" : 1
				},
			});
	$jLatest('input[id="endDate"]').daterangepicker(
			{
				singleDatePicker : true,
				timePicker : true,
				timePicker24Hour : true,
				"locale" : {
					"format" : 'YYYY-MM-DD HH:mm:SS',
					"separator" : " ~ ",
					"applyLabel" : "확인",
					"cancelLabel" : "취소",
					"fromLabel" : "From",
					"toLabel" : "To",
					"customRangeLabel" : "Custom",
					"weekLabel" : "주",
					"daysOfWeek" : [ "일", "월", "화", "수", "목", "금", "토" ],
					"monthNames" : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월",
							"8월", "9월", "10월", "11월", "12월" ],
					"firstDay" : 1
				},
			});
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