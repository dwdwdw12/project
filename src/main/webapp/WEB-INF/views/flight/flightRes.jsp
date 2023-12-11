<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

</style>

<div class="tm-page-wrap mx-auto">
	<section class="tm-banner">

		<!-- .tm-container-outer -->
		<div class="inner">
			<div class="slideshow">
				<img src="../resources/img/kakao/카카오1.jpg" alt="" width="1400"
					height="650">
			</div>
		</div>
	</section>

	<section class="p-5 tm-container-outer tm-bg-gray">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 mx-auto tm-about-text-wrap text-center">
					<h2 class="text-uppercase mb-4">
						비행기 티켓 결제 정보
					</h2>
					<p class="mb-2">선택하신 항공 및 좌석정보, 탑승하실 승객의 개인정보를 모두 확인하여 주시기 바랍니다.</p> 
					<p class="mb-2">잘못 기재된 정보의 미확인으로 인한 책임은 모두 승객 본인에게 있음을 안내드립니다.</p>
					<!-- 					<a href="#" class="text-uppercase btn-primary tm-btn">Continue
						explore</a> -->
						<div>

						<input type="hidden" id="fno" value="${fno}">
						
						
						</div>
						<div class="card-body bg-white mt-0 shadow">
                <!-- <p style="font-weight: bold">카카오페이 현재 사용가능</p> -->
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
							<input name="email" type="text" class="form-control" id="email" value="${email}" readonly="readonly">
						</div>
					</div>
					
					<div class="form-row tm-search-form-row"><label for="totalPay"></label></div>
					
					<div class="form-row tm-search-form-row">
						<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
							<label for="vo">항공정보</label> 
						</div>
							<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
							<input name="vo" type="text" class="form-control" id="vo" value="${vo.depName}=> ${vo.arrName} , ${vo.fullDeptime}" readonly="readonly">
						</div>
						<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
							<label for="seat">좌석정보</label> 
						</div>
						<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
							<input name="seat" type="text" class="form-control" id="seat" value="${className}" readonly="readonly">
						</div>
					</div>

					<div class="form-row tm-search-form-row"><label for="totalPay"></label></div>

					<div class="form-row tm-search-form-row">
	                	<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
				            <label class="checkbox-test">
				            <input type="checkbox" class="checkbox-test" id="pointUse1">마일리지 사용</label>
						</div>
	                	<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
							<input name="pointUse2" type="text" class="form-control" id="pointUse2" value="0" readonly="readonly" >
						</div>
						<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
				            <label class="checkbox-test">마일리지 금액</label>
						</div>
	                	<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
	                	<input name="point" type="text" class="form-control" id="point" value=<fmt:formatNumber value="${point}" pattern="#,###" />  readonly="readonly">
						<input name="point" type="hidden" class="form-control" id="hpoint" value="${point}" readonly="readonly">
						</div>
					</div>
					
					<div class="form-row tm-search-form-row"><label for="totalPay"></label></div>
					
					<div class="form-row tm-search-form-row">
	                	<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
	                		<label class="checkbox-test">
				            <input type="checkbox" class="checkbox-test" id="kakaoPUse1">카카오페이 사용</label>
						</div>
						<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
							<input name="kakaoPUse2" type="text" class="form-control" id="kakaoPUse2" value="0" readonly="readonly">
						</div>
						<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
	                		<label class="checkbox-test">카카오페이 금액</label>
						</div>
						<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
							<input name="kakaoP" type="text" class="form-control" id="kakaoP" value=<fmt:formatNumber value="${kakaoP}" pattern="#,###" /> readonly="readonly">
						</div>
					</div>
					
					<div class="form-row tm-search-form-row"><label for="totalPay"></label></div>
					
					<div class="form-row tm-search-form-row">
						<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
							<label for="total">총 결제금액</label> 
						</div>
						<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
							<input name="total" type="text" class="form-control" id="total" value=<fmt:formatNumber value="${total}" pattern="#,###" /> readonly="readonly">
							<input name="total" type="hidden" class="form-control" id="htotal" value="${total}" readonly="readonly">
						</div>
	                	<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
							<label for="totalPay">최종결제금액</label> 
						</div>
						<div class="form-group tm-form-group tm-form-group-pad tm-form-group-3">
							<input name="totalPay" type="text" class="form-control" id="totalPay" value=<fmt:formatNumber value="${total}" pattern="#,###" /> readonly="readonly">
						</div>
					</div>
					<div class="form-row tm-search-form-row"><label for="totalPay"></label></div>
                <button type="button" class="btn btn-primary btn-lg btn-block btn-custom" id="charge_kakao">결 제</button>
 </div>
					
				</div>
			</div>		
					
		</div>
	</section>
	
	
</div>
<!-- .tm-container-outer -->

 <script>
 window.onload = function () {
	 console.log("dd");
   // $("#pointUse1").click(function(){
	//총합
	var total = $("#htotal").val();
	console.log("total : "+total);
	//포인트 사용 후 최종결제값
	var totalPay = $("#totalPay").val();
	console.log("totalPay : "+totalPay);
    $("#pointUse1").change(function(){
        var chk = $(this).is(":checked");
		console.log(chk);
        if(chk == true){
        	$("#pointUse2").removeAttr("readonly");
        	//체크상태이면 readonly 해제+keyup으로 밸류값 얻어오기
        	$("#pointUse2").keyup(function(){
        		var pointVal = $("#pointUse2").val();
        		console.log(pointVal);
        		totalPay = total - pointVal;
        		console.log("totalPay1 : "+totalPay);
        		$("#totalPay").val(totalPay);
            	//console.log("valTest>>"+$("#totalPay").val())
        		})

        	}
 /*        	var pointVal = $("#pointUse2").val();
        	 updatePayment(); */
        	
        else{
        	$("#pointUse2").val("0");
        	totalPay = total;
        	$("#pointUse2").attr("readonly","readonly");
        	$("#totalPay").val(totalPay);
        }
/*         updatePayment(); */
    });
    
    $("#kakaoPUse1").click(function(){
        var chk = $(this).is(":checked");
        
        if(chk == true){
        	$("#kakaoPUse2").removeAttr("readonly");
        	$("#kakaoPUse2").keyup(function(){
        		var kpoint = $("#kakaoPUse2").val();
        		console.log(kpoint);
        		totalPay = total - kpoint;
        		console.log("totalPay1 : "+totalPay);
        		$("#totalPay").val(totalPay);
        		})
        	/* var kpoint = $("#kakaoPUse2").val(); */
        }else{
        	console.log("체크박스 해제");
        	$("#kakaoPUse2").val("0");
        	totalPay = total;
        	$("#kakaoPUse2").attr("readonly","readonly");
        	$("#totalPay").val(totalPay);
        	
        }
        /* updatePayment(); */
    }); 
    
    function updatePayment(){
    	var total = parseInt($("#total").val()) || 0; // 총 결제금액 가져오기
        // 카카오페이 사용 체크 여부 확인
        if ($("#kakaoPUse1").is(":checked")) {
            var kakaoP = parseInt($("#kakaoPUse2").keyup(function(){
        		var pointVal = $("#kakaoPUse2").val();
        		console.log(kakaoPUse2);
        		})) || 0; // 카카오페이 금액 가져오기
            total -= kakaoP; // 카카오페이 금액 빼기
        }
    	
        // 포인트 사용 체크 여부 확인
        if ($("#pointUse1").is(":checked")) {
            var mileage = parseInt($("#pointUse2").keyup(function(){
        		var pointVal = $("#pointUse2").val();
        		console.log(pointVal);
        		})) || 0; // 마일리지 금액 가져오기
            total -= mileage; // 마일리지 금액 빼기
        }
        
        // 최종결제금액 표시
        $("#totalPay").val(total);
    }

 }

</script>
<script>

    $('#charge_kakao').click(function () {
        // getter
        var IMP = window.IMP;
        IMP.init('imp80062786');
       // var money = $('input[name="cp_item"]:checked').val();
       // console.log(money);
        var pointVal = $("#pointUse2").val();
        var kpoint = $("#kakaoPUse2").val();
        var name = $("#userid").val();
        var total = $("#total").val();
        var seat = $("#seat").val();
        var fno = $("#fno").val();
        var mail = $("#email").val();
        
        if(pointVal.length == 0){pointVal = 0};
        if(kpoint.length == 0){kpoint = 0};

        IMP.request_pay({
            pg : 'danal_tpay',
            pay_method : 'card',
            merchant_uid: 'merchant_' + new Date().getTime(), //상점에서 생성한 고유 주문번호
            name : '주문명:결제테스트',
            amount : 100,
            buyer_email : mail,
            buyer_name : name,
            buyer_tel : '010-1234-5678',
            buyer_addr : mail,
            buyer_postcode : '123-456',
            biz_num : '9810030929'
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
                $.ajax({
                    type: "POST", 
                    url: "/flight/rescomplete",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({
                    	//imp_uid : rsp.imp_uid,
                        //"amount" : 100,
                        point : pointVal,
                        kakao : kpoint,
                        total : total,
                        fno : fno,
                        seat : seat,
                        userid : name
                    })
                }).done(function(data){
                	if ( everythings_fine ) {
            			var msg = '결제가 완료되었습니다.';
            			msg += '\n고유ID : ' + rsp.imp_uid;
            			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
            			msg += '\결제 금액 : ' + rsp.paid_amount;
            			msg += '카드 승인번호 : ' + rsp.apply_num;
            			
            			alert(msg);
            		} else {
            			document.location.href="/flight/reservation";
            		}
                });
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
            document.location.href="/flight/rescompleteMeg?userid="+name; //alert창 확인 후 이동할 url 설정 
        });
    });
</script>
<%@ include file="../includes/footer.jsp"%>