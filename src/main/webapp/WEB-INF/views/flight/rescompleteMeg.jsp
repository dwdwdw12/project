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

<!-- import import -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

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
						<div>
					
					<div class="form-row tm-search-form-row">
	                	<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
							<label for="userid">결제자</label> 
						</div>
						<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
							<input name="userid" type="text" class="form-control" id="userid" value="${userid}" readonly="readonly">
						</div>
	                	<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
							<label for="userid">연락처(이메일)</label> 
						</div>
	                	<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
							<input name="email" type="text" class="form-control" id="email" value="${kvo.mail}" readonly="readonly">
						</div>
					</div>
					<div class="form-row tm-search-form-row"><label for="vo"></label> </div>
					<div class="form-row tm-search-form-row">
						<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
							<label for="vo">항공정보</label> 
						</div>
							<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
							<input name="vo" type="text" class="form-control" id="vo" value="${vo.departure}=> ${vo.arrival} , ${vo.deptime}" readonly="readonly">
						</div>
						<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
							<label for="seat">좌석정보</label> 
						</div>
						<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
							<input name="seat" type="text" class="form-control" id="seat" value="${vo.seatid}" readonly="readonly">
						</div>
					</div>
<%-- 					<div class="form-row tm-search-form-row"><label for="vo"></label> </div>
					<div class="form-row tm-search-form-row">
						<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
				            <label class="checkbox-test">마일리지 사용금액</label>
						</div>
	                	<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
							<input name="point" type="text" class="form-control" id="point" value="${point}" readonly="readonly">
						</div>
						<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
	                		<label class="checkbox-test">카카오페이 사용 금액</label>
						</div>
						<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
							<input name="kakaoP" type="text" class="form-control" id="kakaoP" value="${kakaoP}" readonly="readonly">
						</div>
					</div> --%>
					<div class="form-row tm-search-form-row"><label for="vo"></label> </div>
					<div class="form-row tm-search-form-row">
						<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
							<label for="total">총 금액</label> 
						</div>
						<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
							<input name="total" type="text" class="form-control" id="total" value="${point}" readonly="readonly">
						</div>
					</div>
					<div class="form-row tm-search-form-row">
                		<button type="button" class="btn btn-primary tm-btn tm-btn-search text-uppercase" id="send_kakao">알림 메세지 보내기->카카오로그인시 사용가능</button>
						<button type="button" class="btn btn-primary tm-btn tm-btn-search text-uppercase" href="/">메인페이지</button>	
					</div>		
						</div>

				</div>
			</div>		
					
		</div>
	</section>
	

</div>
<!-- .tm-container-outer -->
<%@ include file="../includes/footer.jsp"%>
<script>
$(document).ready(function(){
	alter("ddd");
})
    $('#send_kakao').click(function () {
    	alert("dd");
    	var url = "https://kapi.kakao.com/v2/api/talk/memo/default/send";
    	
    	$.ajax({
    		type:"POST",
    		url : url,
    		contentType : application/x-www-form-urlencoded,
    		Authorization :  Bearer ${a490df18ce9a725d8744f401c597d9eb},
    		data-urlencode 'template_object={
            "object_type": "feed",
            "content": {
                "title": "오늘의 디저트",
                "description": "아메리카노, 빵, 케익",
                "image_url": "https://mud-kage.kakao.com/dn/NTmhS/btqfEUdFAUf/FjKzkZsnoeE4o19klTOVI1/openlink_640x640s.jpg",
                "image_width": 640,
                "image_height": 640,
                "link": {
                    "web_url": "http://www.daum.net",
                    "mobile_web_url": "http://m.daum.net",
                    "android_execution_params": "contentId=100",
                    "ios_execution_params": "contentId=100"
                }
            },
    	}),
    	"item_content" : {
            "profile_text" :"Kakao",
            "profile_image_url" :"https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png",
            "title_image_url" : "https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png",
            "title_image_text" :"Cheese cake",
            "title_image_category" : "Cake",
            "items" : [
                {
                    "item" :"Cake1",
                    "item_op" : "1000원"
                },
                {
                    "item" :"Cake2",
                    "item_op" : "2000원"
                },
                {
                    "item" :"Cake3",
                    "item_op" : "3000원"
                },
                {
                    "item" :"Cake4",
                    "item_op" : "4000원"
                },
                {
                    "item" :"Cake5",
                    "item_op" : "5000원"
                }
            ],
            "sum" :"Total",
            "sum_op" : "15000원"
        },
        "social": {
            "like_count": 100,
            "comment_count": 200,
            "shared_count": 300,
            "view_count": 400,
            "subscriber_count": 500
        },
        "buttons": [
            {
                "title": "웹으로 이동",
                "link": {
                    "web_url": "http://www.daum.net",
                    "mobile_web_url": "http://m.daum.net"
                }
            },
            {
                "title": "앱으로 이동",
                "link": {
                    "android_execution_params": "contentId=100",
                    "ios_execution_params": "contentId=100"
                }
            }
        ]
     })
    	
/*     	curl -v -X POST "https://kapi.kakao.com/v2/api/talk/memo/default/send" \
        -H "Content-Type: application/x-www-form-urlencoded" \
        -H "Authorization: Bearer ${a490df18ce9a725d8744f401c597d9eb}" \
        --data-urlencode 'template_object={
            "object_type": "feed",
            "content": {
                "title": "오늘의 디저트",
                "description": "아메리카노, 빵, 케익",
                "image_url": "https://mud-kage.kakao.com/dn/NTmhS/btqfEUdFAUf/FjKzkZsnoeE4o19klTOVI1/openlink_640x640s.jpg",
                "image_width": 640,
                "image_height": 640,
                "link": {
                    "web_url": "http://www.daum.net",
                    "mobile_web_url": "http://m.daum.net",
                    "android_execution_params": "contentId=100",
                    "ios_execution_params": "contentId=100"
                }
            },
            "item_content" : {
                "profile_text" :"Kakao",
                "profile_image_url" :"https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png",
                "title_image_url" : "https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png",
                "title_image_text" :"Cheese cake",
                "title_image_category" : "Cake",
                "items" : [
                    {
                        "item" :"Cake1",
                        "item_op" : "1000원"
                    },
                    {
                        "item" :"Cake2",
                        "item_op" : "2000원"
                    },
                    {
                        "item" :"Cake3",
                        "item_op" : "3000원"
                    },
                    {
                        "item" :"Cake4",
                        "item_op" : "4000원"
                    },
                    {
                        "item" :"Cake5",
                        "item_op" : "5000원"
                    }
                ],
                "sum" :"Total",
                "sum_op" : "15000원"
            },
            "social": {
                "like_count": 100,
                "comment_count": 200,
                "shared_count": 300,
                "view_count": 400,
                "subscriber_count": 500
            },
            "buttons": [
                {
                    "title": "웹으로 이동",
                    "link": {
                        "web_url": "http://www.daum.net",
                        "mobile_web_url": "http://m.daum.net"
                    }
                },
                {
                    "title": "앱으로 이동",
                    "link": {
                        "android_execution_params": "contentId=100",
                        "ios_execution_params": "contentId=100"
                    }
                }
            ]
        }' */
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