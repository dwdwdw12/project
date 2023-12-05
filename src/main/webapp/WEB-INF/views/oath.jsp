<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includes/header2.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.5.0/kakao.min.js" integrity="sha384-kYPsUbBPlktXsY6/oNHSUDZoTX6+YI51f63jCPEIPFP09ttByAdxd2mEjKuhdqn4" crossorigin="anonymous"></script>
<!-- <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.5.0/kakao.min.js"
  integrity="sha384-kYPsUbBPlktXsY6/oNHSUDZoTX6+YI51f63jCPEIPFP09ttByAdxd2mEjKuhdqn4" crossorigin="anonymous"></script>	 -->
<!-- <script>
  Kakao.init('607caeca9f2a0089b46f99c667e0dee3'); // restapi
</script> -->
<script>
  Kakao.init('2cc49f4ac1f17ec5d30cf1893fd98d05'); // js
</script>
<title>Insert title here</title>
</head>
<body>
<p>dd</p>
<p>dd</p>
<p>dd</p>
<p>dd</p>
<p>dd</p>
<p>dd</p>
<p>dd</p>
<p>dd</p>
<p>dd</p>
<p>dd</p>
<p>dd</p>
<button class="api-btn" onclick="return sendToMe()">나에게 메시지 보내기</button>
						<p id="token-result"></p>
						<input id="refresh" value=${refresh_token}/>
						<input id="access" value=${access_Token}/>
<script>
var tocken = $("#refresh").val();
var tocken2 = $("#access").val();
Kakao.Auth.setAccessToken(tocken2);
function sendToMe() {
	  console.log("dd");
    Kakao.API.request({
      url: '/v2/api/talk/memo/default/send',
      data: {
        template_object: {
          object_type: 'feed',
          content: {
            title: '딸기 치즈 케익',
            description: '#케익 #딸기 #삼평동 #카페 #분위기 #소개팅',
            image_url:
              'http://k.kakaocdn.net/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
            link: {
              // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
              mobile_web_url: 'http://localhost:8081/oath',
              web_url: 'http://localhost:8081/oath',
            },
          },
          social: {
            like_count: 286,
            comment_count: 45,
            shared_count: 845,
          },
          buttons: [
            {
              title: '웹으로 보기',
              link: {
                mobile_web_url: 'http://localhost:8081/oath',
                web_url: 'http://localhost:8081/oath',
              },
            },
            {
              title: '앱으로 보기',
              link: {
                mobile_web_url: 'http://localhost:8081/oath',
                web_url: 'http://localhost:8081/oath',
              },
            },
          ],
        },
      },
    })
      .then(function(res) {
        alert('success: ' + JSON.stringify(res));
      })
      .catch(function(err) {
        alert('error: ' + JSON.stringify(err));
      });
  }
$(document).ready(function(){
	console.log("ddd");

    	alert("dd");
  		
  		  function loginWithKakao() {
  			  e.preventDefault();
  		    Kakao.Auth.authorize({ //카카오 간편로그인 요청
  		      //redirectUri: https://developers.kakao.com/tool/demo/oauth',
  		      redirectUri: 'http://localhost:8081/oath',
  		      prompt: 'select_account',
  		      state: 'sendme_feed',
  		      scope: 'talk_message', // 앱 동의 항목 설정 및 사용자 동의 필요
  		    });
  		  Kakao.Auth.setAccessToken('${ACCESS_TOKEN}');
  		  }

  		  function sendToMe() {
  			  console.log("dd");
  		    Kakao.API.request({
  		      url: '/v2/api/talk/memo/default/send',
  		      data: {
  		        template_object: {
  		          object_type: 'feed',
  		          content: {
  		            title: '딸기 치즈 케익',
  		            description: '#케익 #딸기 #삼평동 #카페 #분위기 #소개팅',
  		            image_url:
  		              'http://k.kakaocdn.net/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
  		            link: {
  		              // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
  		              mobile_web_url: 'http://localhost:8081/oath',
  		              web_url: 'http://localhost:8081/oath',
  		            },
  		          },
  		          social: {
  		            like_count: 286,
  		            comment_count: 45,
  		            shared_count: 845,
  		          },
  		          buttons: [
  		            {
  		              title: '웹으로 보기',
  		              link: {
  		                mobile_web_url: 'http://localhost:8081/oath',
  		                web_url: 'http://localhost:8081/oath',
  		              },
  		            },
  		            {
  		              title: '앱으로 보기',
  		              link: {
  		                mobile_web_url: 'http://localhost:8081/oath',
  		                web_url: 'http://localhost:8081/oath',
  		              },
  		            },
  		          ],
  		        },
  		      },
  		    })
  		      .then(function(res) {
  		        alert('success: ' + JSON.stringify(res));
  		      })
  		      .catch(function(err) {
  		        alert('error: ' + JSON.stringify(err));
  		      });
  		  }

  		  // 아래는 데모를 위한 UI 코드입니다.
  		  displayToken()
  		  function displayToken() {
  		    var token = getCookie('authorize-access-token');

  		    if(token) {
  		      Kakao.Auth.setAccessToken(token);
  		      document.querySelector('#token-result').innerText = 'login success, ready to send a message';
  		      document.querySelector('button.api-btn').style.visibility = 'visible';
  		    }
  		  }

  		  function getCookie(name) {
  		    var parts = document.cookie.split(name + '=');
  		    if (parts.length === 2) { return parts[1].split(';')[0]; }
  		  }
  		

        	

    });
</script>
						
</body>
</html>