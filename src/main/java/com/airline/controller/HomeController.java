package com.airline.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.airline.service.BoardEventService;
import com.airline.service.BoardNoticeService;
import com.airline.service.FlightService;
import com.airline.service.UserService;
import com.airline.vo.BoardDiaryVO;
import com.airline.vo.BoardEventVO;
import com.airline.vo.BoardNoticeVO;
import com.airline.vo.BoardQnaVO;
import com.airline.vo.CancelVO;
import com.airline.vo.Criteria;
import com.airline.vo.FlightResVO;
import com.airline.vo.KakaoUserVO;
import com.airline.vo.PointVO;
import com.airline.vo.UserPayVO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j
public class HomeController {
	
	@Autowired
	private UserService user;
	
	@Autowired
	private BoardEventService eventService;	
	
	@Autowired
	private FlightService flightService;
		
    @Autowired
 	private BoardNoticeService service;
	
	//메인화면
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, Criteria cri) {		
		model.addAttribute("emer", service.noticePopup(cri));
    
		//이벤트 슬라이더용 8개만 출력.
		Criteria criEvent = new Criteria();
		criEvent.setAmount(8);
		List<BoardEventVO> EventImglist = eventService.getListwithPaging(criEvent);
		model.addAttribute("EventList", EventImglist);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");         
		Date now = new Date();         
		String today = sdf.format(now);
		model.addAttribute("today", today);

		LocalDate date = LocalDate.now();
		DateTimeFormatter fm = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String fdate = date.format(fm);
		
		model.addAttribute("nextWeek", date.plusWeeks(1));
		
		//국내선
		model.addAttribute("GMPtoCJU", flightService.getRoundTripPrice("김포", "제주"));
		model.addAttribute("KWJtoCJU", flightService.getRoundTripPrice("광주", "제주"));
		model.addAttribute("GMPtoRSU", flightService.getRoundTripPrice("김포", "여수"));
		
		//동북아
		model.addAttribute("ICNtoKIX", flightService.getRoundTripPrice("인천", "오사카"));
		model.addAttribute("ICNtoFUK", flightService.getRoundTripPrice("인천", "후쿠오카"));
		model.addAttribute("ICNtoTPE", flightService.getRoundTripPrice("인천", "타이베이"));
		model.addAttribute("ICNtoHKG", flightService.getRoundTripPrice("인천", "홍콩"));

		//동남아/서남아
		model.addAttribute("ICNtoSGN", flightService.getRoundTripPrice("인천", "호찌민"));
		model.addAttribute("ICNtoMNL", flightService.getRoundTripPrice("인천", "마닐라"));
		model.addAttribute("ICNtoSIN", flightService.getRoundTripPrice("인천", "싱가포르"));
		model.addAttribute("ICNtoBKK", flightService.getRoundTripPrice("인천", "방콕"));
		
		//중앙아시아
		model.addAttribute("ICNtoUBN", flightService.getRoundTripPrice("인천", "울란바타르"));
		model.addAttribute("ICNtoALA", flightService.getRoundTripPrice("인천", "알마티"));
		model.addAttribute("ICNtoTAS", flightService.getRoundTripPrice("인천", "타슈켄트"));

		//유럽
		model.addAttribute("ICNtoFRA", flightService.getRoundTripPrice("인천", "프랑크푸르트"));
		model.addAttribute("ICNtoLHR", flightService.getRoundTripPrice("인천", "런던히드로"));
		model.addAttribute("ICNtoCDG", flightService.getRoundTripPrice("인천", "파리"));
		model.addAttribute("ICNtoFCO", flightService.getRoundTripPrice("인천", "로마"));
		
		//미주
		model.addAttribute("ICNtoLAX", flightService.getRoundTripPrice("인천", "로스앤젤레스"));
		model.addAttribute("ICNtoJFK", flightService.getRoundTripPrice("인천", "뉴욕"));
		model.addAttribute("ICNtoSFO", flightService.getRoundTripPrice("인천", "샌프란시스코"));
		model.addAttribute("ICNtoHNL", flightService.getRoundTripPrice("인천", "호놀룰루"));

		//대양주
		model.addAttribute("ICNtoSYD", flightService.getRoundTripPrice("인천", "시드니"));
		model.addAttribute("ICNtoSPN", flightService.getRoundTripPrice("인천", "사이판"));

		return "home";
	}
	
	//로그인->spring 페이지로 뺄까..?
	@GetMapping("/login")
	public void login(String error, String logout, Model model) {
		log.info("error>>"+error);
		log.info("logout>>"+logout);
		log.info("login page");
		
		if(error != null) {
			model.addAttribute("error","Login Error Check your account");
		}
		
		if(model != null) {
			model.addAttribute("logout", "logout");
		}
		
		
	}
		
	@PostMapping("/logout")
	public ResponseEntity<String> logout(HttpServletRequest request, HttpServletResponse response){
		log.info("logout..post");
	    try {
	        log.info("logout..post");
	        request.getSession();
	        Cookie[] cookies = request.getCookies();
	        if (cookies != null) {
	            for (Cookie cookie : cookies) {
	                cookie.setMaxAge(0);
	                response.addCookie(cookie);
	            }
	        }
	        return ResponseEntity.ok("Logout success");
	    } catch (Exception e) {
	        log.error("Logout failed", e);
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Logout failed");
	    }
	}
	
	//마이페이지(유저)
	@GetMapping("/user")
	public void userPage(Model model) {
		log.info("user page");
		//유저정보 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if(authentication.getPrincipal() instanceof UserDetails) {
			UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
			String userid = userDetails.getUsername();

			KakaoUserVO vo = user.getUserInfo(userid);
			//등급조회
			String getGrade = user.getGrade(vo.getGradeCode());
			model.addAttribute("vo",vo);
			model.addAttribute("grade",getGrade);
			//마일리지 가져오기
			//UserPayVO pvo = user.getPoint(userid); //마일리지 내역
			int sumP = user.getSumP(userid);
			model.addAttribute("sumP",sumP);
			//model.addAttribute("pvo",pvo);
			//마일리지 내역 최근 3개 가져오기
			List<UserPayVO> pvo3 = user.getPoint3(userid);
			model.addAttribute("pvo3",pvo3);
			//카카오페이 가져오기
			int sumK = user.getSumK(userid);
			model.addAttribute("sumK",sumK);
			//카카오페이 최근내역 3개
			List<PointVO> kvo3 = user.getKakao3(userid);
			model.addAttribute("kvo3",kvo3);
			//예약내역 3개
			List<FlightResVO> rvo3 = user.getFlight3(userid);
			model.addAttribute("rvo3",rvo3);
			//여행일기 게시글 최근3개
			List<BoardDiaryVO> dvo = user.getDiary(userid);
			model.addAttribute("dvo",dvo);
			//문의게시글 최근3개
			String username = user.getName(userid);
			List<BoardQnaVO> qvo = user.getQna(username);
			model.addAttribute("qvo",qvo);
			 
			
		}
		
	}
	

	
	//마이페이지(관리자)
	@GetMapping(value="/admin", produces = MediaType.APPLICATION_JSON_VALUE)
	public void adminPage(Model model)throws Exception {
		log.info("admin page");
		//유저정보 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if(authentication.getPrincipal() instanceof UserDetails) {
			UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
			String userid = userDetails.getUsername();
			//회원정보 조회
		}
		//회원정보 가져오기
		List<KakaoUserVO> vo = user.getUserInfoAll();
		model.addAttribute("vo",vo);
		//매출현황(카카오페이+항공결제내역 월별/년도별)
		//일별 항공매출현황
        List<UserPayVO> pvo = user.getSale();
       // System.out.println("pvo>> "+pvo);
	    // 데이터를 JSON 문자열로 변환하여 모델에 추가
	    ObjectMapper objectMapper = new ObjectMapper();
	    try {
	        String json = objectMapper.writeValueAsString(pvo);
	        model.addAttribute("json", json);
	        //System.out.println("json>> "+json);
	    } catch (JsonProcessingException e) {
	        e.printStackTrace(); // 또는 예외 처리 로직 추가
	    }
		
	    System.out.println(pvo);
        model.addAttribute("pvo", pvo);
        //취소요청
        List<CancelVO> cvo = user.reqCancel();
        model.addAttribute("cvo",cvo);
        //항공권 구매/예약 현황
        List<FlightResVO> fvo = user.getFlightres();
        System.out.println(fvo);
        model.addAttribute("fvo",fvo);
        //공지사항
        List<BoardNoticeVO> nvo = user.getNotice();
        model.addAttribute("nvo",nvo);
        //이벤트 게시판
        List<BoardEventVO> evo = user.getEvent();
        model.addAttribute("evo",evo);
        
        

		
	}
	

	
	@GetMapping("/contact")
	public void contact() {
		
	}
	
	//카카오메세지 토큰값 가져오기
	@GetMapping(value="/oath")
	public void oath(@RequestParam("code")String code, Model model) {
		System.out.println(code);
		String getCode = code;
		String grant_type = code;
		String url = "https://kauth.kakao.com/oauth/token";
		String redirect_url = "http://localhost:8081/oath";
		String rest_api_key="607caeca9f2a0089b46f99c667e0dee3";
		Map<String, String> jsonData = new HashMap<String, String>();
		jsonData.put("grant_type", grant_type);
		jsonData.put("client_id", rest_api_key);
		jsonData.put("redirect_url", redirect_url);
		jsonData.put("code", code);
		
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.enable(SerializationFeature.INDENT_OUTPUT); // 예쁜 형식으로 출력
        String access_Token = "";
        try {
            // JSON 파일 생성
            objectMapper.writeValue(new File("output.json"), jsonData);
            System.out.println("JSON 파일이 생성되었습니다.");
        } catch (IOException e) {
            e.printStackTrace();
        }
		
        try {
            URL reqUrl = new URL(url);
            HttpURLConnection conn = (HttpURLConnection) reqUrl.openConnection();
            
          //필수 헤더 세팅
            conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
            conn.setDoOutput(true); //OutputStream으로 POST 데이터를 넘겨주겠다는 옵션.
            conn.setRequestMethod("POST");
            
            //	POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            //필수 쿼리 파라미터 세팅
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=").append(rest_api_key);
            sb.append("&redirect_uri=").append(redirect_url);
            sb.append("&code=").append(code);
            
            bw.write(sb.toString());
            bw.flush();
            
            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
            
           
			/*
			 * BufferedReader br = new BufferedReader(new
			 * InputStreamReader(conn.getInputStream())); String line = ""; String result =
			 * "";
			 */
            
            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br;
            if (responseCode >= 200 && responseCode <= 300) {
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }

            String line = "";
            StringBuilder responseSb = new StringBuilder();
            while((line = br.readLine()) != null){
                responseSb.append(line);
            }
            
            String result = responseSb.toString();
            System.out.println("result : " + result);
            
//          Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            String refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);
            model.addAttribute("access_Token",access_Token);
            model.addAttribute("refresh_token",refresh_Token);
            br.close();
            bw.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        //return access_Token;
	}
	
	@PostMapping(value="/oath")
	public void sendMeg(@RequestParam("code")String code, HttpServletRequest req) {
		
	}
	
}
