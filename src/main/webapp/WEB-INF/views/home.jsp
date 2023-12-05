<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<script src="../resources/js/vendor/modernizr.custom.min.js"></script>
<link rel="stylesheet" href="../resources/css/normalize.css">
<style>
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

@media(min-width:768px){
#kako-talk-channel-chat-button{
position:fixed;
z-index:999;
right:30px;
bottom:30px;
}
}

@media(max-width:767px){
#kako-talk-channel-chat-button{
position:fixed;
z-index:999;
right:15px;
bottom:30px;
}
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
	
	<div
  id="kakao-talk-channel-add-button"
  data-channel-public-id="_frpnG"
  data-size="large"
  data-support-multiple-densities="true"
></div>

<div
  id="kakao-talk-channel-chat-button"
  data-channel-public-id="_frpnG"
  data-title="consult"
  data-size="small"
  data-color="yellow"
  data-shape="pc"
  data-support-multiple-densities="true"
></div>

	<section class="p-5 tm-container-outer tm-bg-gray">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 mx-auto tm-about-text-wrap text-center">
					<h2 class="text-uppercase mb-4">
						Your <strong>Journey</strong> is our priority
					</h2>
					<p class="mb-4">Nullam auctor, sapien sit amet lacinia euismod,
						lorem magna lobortis massa, in tincidunt mi metus quis lectus.
						Duis nec lobortis velit. Vivamus id magna vulputate, tempor ante
						eget, tempus augue. Maecenas ultricies neque magna.</p>
<!-- 					<a href="#" class="text-uppercase btn-primary tm-btn">Continue
						explore</a> -->
				</div>
			</div>
			
			
			

			
			
			
			<form action="index.html" method="get"
						class="tm-search-form tm-section-pad-2">
						<div class="form-row tm-search-form-row">
							<input type="hidden" name="command" value="flightList"/>
							<div class="form-row tm-search-form-row">
								<div class="form-group tm-form-group tm-form-group-pad tm-form-group-1">
									<label for="inputCity"><a>&#x2714&nbsp;&nbsp;</a>Choose Your Department</label> 
									<input name="department" type="text" class="form-control" id="inputCity" placeholder="Type your destination...">
								</div>
								<div class="form-group tm-form-group tm-form-group-pad tm-form-group-1">
									<label for="inputCity"><a>&#x2714&nbsp;&nbsp;</a>Choose Your Arrive</label> 
									<input name="arrive" type="text" class="form-control" id="inputCity" placeholder="Type your destination...">
								</div>
								<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
									<label for="inputCheckIn"><a>&#x2714&nbsp;&nbsp;</a>탑승객</label> 
									<input name="" type="text" class="form-control" id="" placeholder="탑승객">
								</div>
								<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
									<label for="inputCheckIn"><a>&#x2714&nbsp;&nbsp;</a>좌석등급</label> 
									<input name="" type="text" class="form-control" id="" placeholder="좌석등급">
								</div>
								<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
									<label for="inputCheckIn"><a>&#x1F551&nbsp;&nbsp;</a>Check In Date</label> 
									<input name="check-in" type="text" class="form-control" id="inputCheckIn" placeholder="Check In">
								</div>
								<div class="form-group tm-form-group tm-form-group-pad tm-form-group-1">
									<label for="btnSubmit">&nbsp;</label>
									<button type="submit" class="btn btn-primary tm-btn tm-btn-search text-uppercase" id="btnSubmit"  onclick="return checksubmit()">Check Availability</button>
								</div>
								</div>
						</div>
					</form>
			
			
			
			
			
			
			
		</div>
	</section>

	<div class="tm-container-outer" id="tm-section-2">
		<section class="tm-slideshow-section">
			<div class="tm-slideshow">
				
				<c:forEach var="board" items="${EventList}">
					<img src="/display?fileName=${board.filePath}" alt="" width="690px" height="400px" onclick="location.href='/boardEvent/view?boardNum=${board.boardNum}'">					
				</c:forEach>
			</div>
			<div class="tm-slideshow-description tm-bg-primary">
				<h2 class="">이벤트</h2>
				<p> 현재 진행중인 이벤트</p>
				<a href="/boardEvent/list"
					class="text-uppercase tm-btn tm-btn-white tm-btn-white-primary">게시판으로 이동</a>
			</div>
		</section>
		<section
			class="clearfix tm-slideshow-section tm-slideshow-section-reverse">

			<div class="tm-right tm-slideshow tm-slideshow-highlight">
				<img src="../resources/img/tm-img-02.jpg" alt="Image"> <img
					src="../resources/img/tm-img-03.jpg" alt="Image"> <img
					src="../resources/img/tm-img-01.jpg" alt="Image">
			</div>

			<div
				class="tm-slideshow-description tm-slideshow-description-left tm-bg-highlight">
				<h2 class="">Asia's most popular places</h2>
				<p>Vivamus in massa ullamcorper nunc auctor accumsan ac at arcu.
					Donec sagittis mattis pharetra. Proin commodo, ante et volutpat
					pulvinar, arcu arcu ullamcorper diam, id maximus sem tellus id sem.
					Suspendisse eget rhoncus diam. Fusce urna elit, porta nec
					ullamcorper id.</p>
				<a href="#"
					class="text-uppercase tm-btn tm-btn-white tm-btn-white-highlight">Continue
					Reading</a>
			</div>

		</section>
		<section class="tm-slideshow-section">
			<div class="tm-slideshow">
				<img src="../resources/img/tm-img-03.jpg" alt="Image"> <img
					src="../resources/img/tm-img-02.jpg" alt="Image"> <img
					src="../resources/img/tm-img-01.jpg" alt="Image">
			</div>
			<div class="tm-slideshow-description tm-bg-primary">
				<h2 class="">America's most famous places</h2>
				<p>Donec nec laoreet diam, at vehicula ante. Orci varius natoque
					penatibus et magnis dis parturient montes, nascetur ridiculus mus.
					Suspendisse nec dapibus nunc, quis viverra metus. Morbi eget diam
					gravida, euismod magna vel, tempor urna.</p>
				<a href="#"
					class="text-uppercase tm-btn tm-btn-white tm-btn-white-primary">Continue
					Reading</a>
			</div>
		</section>
	</div>
	<div class="tm-container-outer" id="tm-section-3">
		<ul class="nav nav-pills tm-tabs-links">
			<li class="tm-tab-link-li"><a href="#1a" data-toggle="tab"
				class="tm-tab-link"> <img
					src="../resources/mainImg/korea.png" width="100px" height="100px" alt="Image"
					class="img-fluid"> 국내선
			</a></li>
			<li class="tm-tab-link-li"><a href="#2a" data-toggle="tab"
				class="tm-tab-link"> 
				<img src="../resources/mainImg/north-east-asia.png" alt="Image" width="100px" height="100px" class="img-fluid"> 
				<br>동북아시아
			</a></li>
			<li class="tm-tab-link-li"><a href="#3a" data-toggle="tab" class="tm-tab-link"> 
			<img src="../resources/mainImg/south-east-asia.png" alt="Image" width="100px" height="100px" class="img-fluid"> 
					동남아/서남아시아
			</a></li>
			<li class="tm-tab-link-li"><a href="#4a" data-toggle="tab" class="tm-tab-link active"> <!-- Current Active Tab --> 
			<img src="../resources/mainImg/centraal-asia.png" alt="Image" width="100px" height="100px" class="img-fluid">
					중앙아시아
			</a></li>
			<li class="tm-tab-link-li"><a href="#5a" data-toggle="tab"
				class="tm-tab-link"> <img src="../resources/mainImg/europe.png"
					alt="Image" class="img-fluid"> 유럽
			</a></li>
			<li class="tm-tab-link-li"><a href="#6a" data-toggle="tab" class="tm-tab-link"> 
			<img src="../resources/mainImg/north_america.png" alt="Image" width="100px" height="100px" class="img-fluid"> 
			미주(미국/캐나다)
			</a></li>
			<li class="tm-tab-link-li"><a href="#7a" data-toggle="tab"
				class="tm-tab-link"> <img src="../resources/mainImg/oceania.png"
					alt="Image" width="100px" height="100px" class="img-fluid"> 대양주
			</a></li>
		</ul>
		<div class="tab-content clearfix">
		<input type="hidden" value="${today}">
		<input type="hidden" value="${nextWeek}">
		
			<!-- Tab 1 -->
			<div class="tab-pane fade" id="1a">
				<div class="tm-recommended-place-wrap">
					<div class="tm-recommended-place">
						<img src="img/tm-img-06.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">김포 ↔ 제주</h3>
							<p class="tm-text-highlight">왕복</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="/flight/search?dep=김포&arr=제주&depDate=${today}&arrDate=${nextWeek}" class="tm-recommended-price-box">
							<p class="tm-recommended-price"><fmt:formatNumber value="${GMPtoCJU}" type="currency" currencySymbol="￦" minFractionDigits="0" /></p>
							<p class="tm-recommended-price-link">예약하기</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-07.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">광주 ↔ 제주</h3>
							<p class="tm-text-highlight">왕복</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<div id="preload-hover-img"></div>
						<a href="/flight/search?dep=광주&arr=제주&depDate=${today}&arrDate=${nextWeek}" class="tm-recommended-price-box">
							<p class="tm-recommended-price"><fmt:formatNumber value="${KWJtoCJU}" type="currency" currencySymbol="￦" minFractionDigits="0" /></p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-05.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">김포 ↔ 여수</h3>
							<p class="tm-text-highlight">왕복</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price"><fmt:formatNumber value="${GMPtoRSU}" type="currency" currencySymbol="￦" minFractionDigits="0" /></p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

				</div>

				<a href="#"
					class="text-uppercase btn-primary tm-btn mx-auto tm-d-table">Show
					More Places</a>
			</div>
			<!-- tab-pane -->

			<!-- Tab 2 -->
			<div class="tab-pane fade" id="2a">

				<div class="tm-recommended-place-wrap">
					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-05.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">인천 ↔ 오사카</h3>
							<p class="tm-text-highlight">왕복</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price"><fmt:formatNumber value="${ICNtoKIX}" type="currency" currencySymbol="￦" minFractionDigits="0" /></p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-04.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">인천 ↔ 후쿠오카</h3>
							<p class="tm-text-highlight">왕복</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price"><fmt:formatNumber value="${ICNtoFUK}" type="currency" currencySymbol="￦" minFractionDigits="0" /></p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-07.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">인천 ↔ 타이베이</h3>
							<p class="tm-text-highlight">왕복</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price"><fmt:formatNumber value="${ICNtoTPE}" type="currency" currencySymbol="￦" minFractionDigits="0" /></p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-06.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">홍콩 ↔ 인천</h3>
							<p class="tm-text-highlight">편도</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price"><fmt:formatNumber value="${ICNtoHKG}" type="currency" currencySymbol="￦" minFractionDigits="0" /></p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>
				</div>

				<a href="#"
					class="text-uppercase btn-primary tm-btn mx-auto tm-d-table">Show
					More Places</a>
			</div>
			<!-- tab-pane -->

			<!-- Tab 3 -->
			<div class="tab-pane fade" id="3a">

				<div class="tm-recommended-place-wrap">
					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-04.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">인천 ↔ 호찌민</h3>
							<p class="tm-text-highlight">왕복</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price"><fmt:formatNumber value="${ICNtoSGN}" type="currency" currencySymbol="￦" minFractionDigits="0" /></p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-05.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">인천 ↔ 마닐라</h3>
							<p class="tm-text-highlight">왕복</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price"><fmt:formatNumber value="${ICNtoMNL}" type="currency" currencySymbol="￦" minFractionDigits="0" /></p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-06.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">인천 ↔ 싱가포르</h3>
							<p class="tm-text-highlight">왕복</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price"><fmt:formatNumber value="${ICNtoSIN}" type="currency" currencySymbol="￦" minFractionDigits="0" /></p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-07.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">인천 ↔ 방콕</h3>
							<p class="tm-text-highlight">왕복</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price"><fmt:formatNumber value="${ICNtoBKK}" type="currency" currencySymbol="￦" minFractionDigits="0" /></p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>
				</div>

				<a href="#"
					class="text-uppercase btn-primary tm-btn mx-auto tm-d-table">Show
					More Places</a>
			</div>
			<!-- tab-pane -->

			<!-- Tab 4 -->
			<div class="tab-pane fade show active" id="4a">
				<!-- Current Active Tab WITH "show active" classes in DIV tag -->
				<div class="tm-recommended-place-wrap">
					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-06.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">인천 ↔ 울란바타르</h3>
							<p class="tm-text-highlight">왕복</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price"><fmt:formatNumber value="${ICNtoUBN}" type="currency" currencySymbol="￦" minFractionDigits="0" /></p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-07.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">인천 ↔ 알마티</h3>
							<p class="tm-text-highlight">왕복</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<div id="preload-hover-img"></div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price"><fmt:formatNumber value="${ICNtoALA}" type="currency" currencySymbol="￦" minFractionDigits="0" /></p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-05.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">인천 ↔ 타슈켄트</h3>
							<p class="tm-text-highlight">왕복</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price"><fmt:formatNumber value="${ICNtoTAS}" type="currency" currencySymbol="￦" minFractionDigits="0" /></p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>
				</div>

				<a href="#"
					class="text-uppercase btn-primary tm-btn mx-auto tm-d-table">Show
					More Places</a>
			</div>
			<!-- tab-pane -->

			<!-- Tab 5 -->
			<div class="tab-pane fade" id="5a">

				<div class="tm-recommended-place-wrap">
					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-05.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">인천 ↔ 프랑크푸르트</h3>
							<p class="tm-text-highlight">왕복</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price"><fmt:formatNumber value="${ICNtoFRA}" type="currency" currencySymbol="￦" minFractionDigits="0" /></p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-04.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">인천 ↔ 런던히드로</h3>
							<p class="tm-text-highlight">왕복</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price"><fmt:formatNumber value="${ICNtoLHR}" type="currency" currencySymbol="￦" minFractionDigits="0" /></p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-07.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">인천 ↔ 파리</h3>
							<p class="tm-text-highlight">왕복</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price"><fmt:formatNumber value="${ICNtoCDG}" type="currency" currencySymbol="￦" minFractionDigits="0" /></p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-06.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">인천 ↔ 로마</h3>
							<p class="tm-text-highlight">왕복</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price"><fmt:formatNumber value="${ICNtoFCO}" type="currency" currencySymbol="￦" minFractionDigits="0" /></p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>
				</div>

				<a href="#"
					class="text-uppercase btn-primary tm-btn mx-auto tm-d-table">Show
					More Places</a>
			</div>
			<!-- tab-pane -->

			<!-- Tab 6 -->
			<div class="tab-pane fade" id="6a">

				<div class="tm-recommended-place-wrap">
					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-04.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">인천 ↔ 로스앤젤레스</h3>
							<p class="tm-text-highlight">편도</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price"><fmt:formatNumber value="${ICNtoLAX}" type="currency" currencySymbol="￦" minFractionDigits="0" /></p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-05.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">인천 ↔ 뉴욕</h3>
							<p class="tm-text-highlight">왕복</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price"><fmt:formatNumber value="${ICNtoJFK}" type="currency" currencySymbol="￦" minFractionDigits="0" /></p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-06.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">인천 ↔ 샌프란시스코</h3>
							<p class="tm-text-highlight">편도</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price"><fmt:formatNumber value="${ICNtoSFO}" type="currency" currencySymbol="￦" minFractionDigits="0" /></p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-07.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">인천 ↔ 호놀룰루</h3>
							<p class="tm-text-highlight">왕복</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price"><fmt:formatNumber value="${ICNtoHNL}" type="currency" currencySymbol="￦" minFractionDigits="0" /></p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>
				</div>

				<a href="#"
					class="text-uppercase btn-primary tm-btn mx-auto tm-d-table">Show
					More Places</a>
			</div>
			<!-- tab-pane -->

			<!-- Tab 7 -->
			<div class="tab-pane fade" id="7a">

				<div class="tm-recommended-place-wrap">
					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-04.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">인천 ↔ 시드니</h3>
							<p class="tm-text-highlight">왕복</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price"><fmt:formatNumber value="${ICNtoSYD}" type="currency" currencySymbol="￦" minFractionDigits="0" /></p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-05.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">인천 ↔ 사이판</h3>
							<p class="tm-text-highlight">왕복</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price"><fmt:formatNumber value="${ICNtoSPN}" type="currency" currencySymbol="￦" minFractionDigits="0" /></p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>
					
				</div>

				<a href="#"
					class="text-uppercase btn-primary tm-btn mx-auto tm-d-table">Show
					More Places</a>
			</div>
			<!-- tab-pane -->
		</div>
	</div>


	<!-- 모달창 -->
	<jsp:include page="/WEB-INF/views/NoticePopup.jsp"/>   
	<!-- /모달창 -->

	<!-- .tm-container-outer -->
	<%@ include file="includes/footer.jsp"%>
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
						"monthNames" : [ "1월", "2월", "3월", "4월", "5월", "6월",
								"7월", "8월", "9월", "10월", "11월", "12월" ],
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
						"monthNames" : [ "1월", "2월", "3월", "4월", "5월", "6월",
								"7월", "8월", "9월", "10월", "11월", "12월" ],
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

				let timer = setInterval(showNextSlide, 5000);
				$(this).on('mouseover', function() {
					//타이머 취소
					clearInterval(timer);
				}).on('mouseout', function() {
					//타이머 시작
					timer = setInterval(showNextSlide, 5000);
				})
			})
		});
		
		// Slick Carousel
        $('.tm-slideshow').slick({
            infinite: true,
            arrows: true,
            slidesToShow: 1,
            slidesToScroll: 1
        });
		
	
		
	</script>
	
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
kakao.init('3156d02ad4070a1c858f024518bda8c5');
Kakao.Channel.createAddChannelButton({
	  container: '#kakao-talk-channel-chat-button',
	  channelPublicId: '_frpnG' // 카카오톡 채널 홈 URL에 명시된 id로 설정합니다.
	});

</script>

<!-- 카카오 채널 추가 -->
<script>
  window.kakaoAsyncInit = function() {
    Kakao.Channel.createAddChannelButton({
      container: '#kakao-talk-channel-add-button',
    });
  };

  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = 'https://t1.kakaocdn.net/kakao_js_sdk/2.5.0/kakao.channel.min.js';
    js.integrity = 'sha384-j5TN6EqladB+HIfGV8dVYRIzoJf9Fb4lvrkPmo9KlnDWpN1CZz8yC4rCH1ChRbbh';
    js.crossOrigin = 'anonymous';
    fjs.parentNode.insertBefore(js, fjs);
  })(document, 'script', 'kakao-js-sdk');
</script>

<!-- 카카오 채팅 -->
<script>
  window.kakaoAsyncInit = function() {
    Kakao.Channel.createChatButton({
      container: '#kakao-talk-channel-chat-button',
    });
  };

  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = 'https://t1.kakaocdn.net/kakao_js_sdk/2.5.0/kakao.channel.min.js';
    js.integrity = 'sha384-j5TN6EqladB+HIfGV8dVYRIzoJf9Fb4lvrkPmo9KlnDWpN1CZz8yC4rCH1ChRbbh';
    js.crossOrigin = 'anonymous';
    fjs.parentNode.insertBefore(js, fjs);
  })(document, 'script', 'kakao-js-sdk');
</script>