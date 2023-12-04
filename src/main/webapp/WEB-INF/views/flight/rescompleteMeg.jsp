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

</style>

<div class="tm-page-wrap mx-auto">
	<section class="tm-banner">

		<!-- .tm-container-outer -->
<!-- 		<div class="inner">
			<div class="slideshow">
				<img src="../resources/img/tm-img-01.jpg" alt="" width="1600"
					height="1000"> <img src="../resources/img/tm-img-02.jpg"
					alt="" width="1600" height="1000"> <img
					src="../resources/img/tm-img-03.jpg" alt="" width="1600"
					height="1000"> <img src="../resources/img/tm-img-04.jpg"
					alt="" width="1600" height="1000">
			</div>
		</div> -->
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
						<button type="button" class="btn btn-primary tm-btn tm-btn-search text-uppercase" href="location.href='/'">메인페이지</button>	
						<a id="kakao-login-btn" href="javascript:loginWithKakao()">
 						<img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222" alt="카카오 로그인 버튼" /></a>
						<p id="token-result"></p>
					</div>		
						</div>

				</div>
			</div>		
					
		</div>
	</section>
	

</div>
<!-- .tm-container-outer -->
<script>
console.log("aaa");
$(document).ready(function(){
	console.log("ddd");
    $('#send_kakao').click(function () {
    	alert("dd");
    	loginWithKakaoPopUp();
    	var url = "https://kapi.kakao.com/v2/api/talk/memo/default/send";
        
    	/*
    	
  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'https://localhost:8443/kakao',
    });
  }

  // 아래는 데모를 위한 UI 코드입니다.
  displayToken()
  function displayToken() {
    var token = getCookie('authorize-access-token');

    if(token) {
      Kakao.Auth.setAccessToken(token);
      Kakao.Auth.getStatusInfo()
        .then(function(res) {
          if (res.status === 'connected') {
            document.getElementById('token-result').innerText
              = 'login success, token: ' + Kakao.Auth.getAccessToken();
          }
        })
        .catch(function(err) {
          Kakao.Auth.setAccessToken(null);
        });
    }
  }

  function getCookie(name) {
    var parts = document.cookie.split(name + '=');
    if (parts.length === 2) { return parts[1].split(';')[0]; }
  }

    	
    	
    	
    	
    	
/*     	function loginWithKakaoPopUp() {
            Kakao.Auth.login({
                success: function(authObj) {
                    document.getElementById("Response").innerText = JSON.stringify(authObj);
                    Kakao.Auth.setAccessToken(authObj.access_token);
                },
                fail: function(err) {
                    document.getElementById("Response").innerText = JSON.stringify(err);
                },
            })
        } */
    });
        	

    });
</script>
<%@ include file="../includes/footer.jsp"%>