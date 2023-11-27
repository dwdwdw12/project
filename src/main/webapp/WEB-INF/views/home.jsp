<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<img src="../resources/img/tm-img-01.jpg" alt="Image"> <img
					src="../resources/img/tm-img-02.jpg" alt="Image"> <img
					src="../resources/img/tm-img-03.jpg" alt="Image">
			</div>
			<div class="tm-slideshow-description tm-bg-primary">
				<h2 class="">Europe's most visited places</h2>
				<p>Aenean in lacus nec dolor fermentum congue. Maecenas ut velit
					pharetra, pharetra tortor sit amet, vulputate sem. Vestibulum mi
					nibh, faucibus ac eros id, sagittis tincidunt velit. Proin interdum
					ullamcorper faucibus. Ut mi nunc, sollicitudin non pulvinar id,
					sagittis eget diam.</p>
				<a href="#"
					class="text-uppercase tm-btn tm-btn-white tm-btn-white-primary">Continue
					Reading</a>
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
					src="../resources/img/north-america.png" alt="Image"
					class="img-fluid"> North America
			</a></li>
			<li class="tm-tab-link-li"><a href="#2a" data-toggle="tab"
				class="tm-tab-link"> <img
					src="../resources/img/south-america.png" alt="Image"
					class="img-fluid"> South America
			</a></li>
			<li class="tm-tab-link-li"><a href="#3a" data-toggle="tab"
				class="tm-tab-link"> <img src="../resources/img/europe.png"
					alt="Image" class="img-fluid"> Europe
			</a></li>
			<li class="tm-tab-link-li"><a href="#4a" data-toggle="tab"
				class="tm-tab-link active"> <!-- Current Active Tab --> <img
					src="../resources/img/asia.png" alt="Image" class="img-fluid">
					Asia
			</a></li>
			<li class="tm-tab-link-li"><a href="#5a" data-toggle="tab"
				class="tm-tab-link"> <img src="../resources/img/africa.png"
					alt="Image" class="img-fluid"> Africa
			</a></li>
			<li class="tm-tab-link-li"><a href="#6a" data-toggle="tab"
				class="tm-tab-link"> <img src="../resources/img/australia.png"
					alt="Image" class="img-fluid"> Australia
			</a></li>
			<li class="tm-tab-link-li"><a href="#7a" data-toggle="tab"
				class="tm-tab-link"> <img src="../resources/img/antartica.png"
					alt="Image" class="img-fluid"> Antartica
			</a></li>
		</ul>
		<div class="tab-content clearfix">

			<!-- Tab 1 -->
			<div class="tab-pane fade" id="1a">
				<div class="tm-recommended-place-wrap">
					<div class="tm-recommended-place">
						<img src="img/tm-img-06.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">North Garden Resort</h3>
							<p class="tm-text-highlight">One North</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price">$110</p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-07.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">Felis nec dignissim</h3>
							<p class="tm-text-highlight">Two North</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<div id="preload-hover-img"></div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price">$120</p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-05.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">Sed fermentum justo</h3>
							<p class="tm-text-highlight">Three North</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price">$130</p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-04.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">Maecenas ultricies neque</h3>
							<p class="tm-text-highlight">Four North</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price">$140</p>
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
							<h3 class="tm-recommended-title">South Resort Hotel</h3>
							<p class="tm-text-highlight">South One</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price">$220</p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-04.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">Aenean ac ante nec diam</h3>
							<p class="tm-text-highlight">South Second</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price">$230</p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-07.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">Suspendisse nec dapibus</h3>
							<p class="tm-text-highlight">South Third</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price">$240</p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-06.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">Aliquam viverra mi at nisl</h3>
							<p class="tm-text-highlight">South Fourth</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price">$250</p>
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
							<h3 class="tm-recommended-title">Europe Hotel</h3>
							<p class="tm-text-highlight">Venecia, Italy</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price">$330</p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-05.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">In viverra enim turpis</h3>
							<p class="tm-text-highlight">Paris, France</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price">$340</p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-06.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">Volutpat pellentesque</h3>
							<p class="tm-text-highlight">Barcelona, Spain</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price">$350</p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-07.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">Grand Resort Pasha</h3>
							<p class="tm-text-highlight">Istanbul, Turkey</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price">$360</p>
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
							<h3 class="tm-recommended-title">Asia Resort Hotel</h3>
							<p class="tm-text-highlight">Singapore</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price">$440</p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-07.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">Nullam eget est a nisl</h3>
							<p class="tm-text-highlight">Yangon, Myanmar</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<div id="preload-hover-img"></div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price">$450</p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-05.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">Proin interdum ullamcorper</h3>
							<p class="tm-text-highlight">Bangkok, Thailand</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price">$460</p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-04.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">Lorem ipsum dolor sit</h3>
							<p class="tm-text-highlight">Vientiane, Laos</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price">$470</p>
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
							<h3 class="tm-recommended-title">Africa Resort Hotel</h3>
							<p class="tm-text-highlight">First City</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price">$550</p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-04.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">Aenean ac magna diam</h3>
							<p class="tm-text-highlight">Second City</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price">$560</p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-07.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">Beach Barbecue Sunset</h3>
							<p class="tm-text-highlight">Third City</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price">$570</p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-06.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">Grand Resort Pasha</h3>
							<p class="tm-text-highlight">Fourth City</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price">$580</p>
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
							<h3 class="tm-recommended-title">Hotel Australia</h3>
							<p class="tm-text-highlight">City One</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price">$660</p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-05.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">Proin interdum ullamcorper</h3>
							<p class="tm-text-highlight">City Two</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price">$650</p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-06.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">Beach Barbecue Sunset</h3>
							<p class="tm-text-highlight">City Three</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price">$640</p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-07.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">Grand Resort Pasha</h3>
							<p class="tm-text-highlight">City Four</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price">$630</p>
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
							<h3 class="tm-recommended-title">Antartica Resort</h3>
							<p class="tm-text-highlight">Ant City One</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price">$770</p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-05.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">Pulvinar Semper</h3>
							<p class="tm-text-highlight">Ant City Two</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price">$230</p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-06.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">Cras vel sapien</h3>
							<p class="tm-text-highlight">Ant City Three</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price">$140</p>
							<p class="tm-recommended-price-link">Continue Reading</p>
						</a>
					</div>

					<div class="tm-recommended-place">
						<img src="../resources/img/tm-img-07.jpg" alt="Image"
							class="img-fluid tm-recommended-img">
						<div class="tm-recommended-description-box">
							<h3 class="tm-recommended-title">Nullam eget est</h3>
							<p class="tm-text-highlight">Ant City Four</p>
							<p class="tm-text-gray">Sed egestas, odio nec bibendum
								mattis, quam odio hendrerit risus, eu varius eros lacus sit amet
								lectus. Donec blandit luctus dictum...</p>
						</div>
						<a href="#" class="tm-recommended-price-box">
							<p class="tm-recommended-price">$190</p>
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

	<div class="tm-container-outer tm-position-relative" id="tm-section-4">
		<div id="google-map"></div>
		<form action="index.html" method="post" class="tm-contact-form">
			<div class="form-group tm-name-container">
				<input type="text" id="contact_name" name="contact_name"
					class="form-control" placeholder="Name" required />
			</div>
			<div class="form-group tm-email-container">
				<input type="email" id="contact_email" name="contact_email"
					class="form-control" placeholder="Email" required />
			</div>
			<div class="form-group">
				<input type="text" id="contact_subject" name="contact_subject"
					class="form-control" placeholder="Subject" required />
			</div>
			<div class="form-group">
				<textarea id="contact_message" name="contact_message"
					class="form-control" rows="9" placeholder="Message" required></textarea>
			</div>
			<button type="submit"
				class="btn btn-primary tm-btn-primary tm-btn-send text-uppercase">Send
				Message Now</button>
		</form>
	</div>
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