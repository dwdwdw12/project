package com.airline.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.airline.service.FlightService;
import com.airline.service.PayService;
import com.airline.vo.Criteria;
import com.airline.vo.FlightResDTO;
import com.airline.vo.FlightResVO;
import com.airline.vo.FlightVO;
import com.airline.vo.KakaoUserVO;
import com.airline.vo.PageDTO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
@RequestMapping("/flight/*")
public class FlightController {

	@Autowired
	private FlightService flights;
	
	@Autowired
	private PayService pservice;
	
	@GetMapping("/list")
	public void getList(Model model, Criteria cri) {
		model.addAttribute("list",flights.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, flights.getTotal(cri)));
	}
	
	@GetMapping(value="/search", produces = {MediaType.APPLICATION_JSON_VALUE})
	public void getSearch(Model model, Criteria cri, @Param("dep") String dep,@Param("arr") String arr,@Param("arrDate") String arrDate, @Param("depDate") String depDate) throws ParseException {
		System.out.println("dep : "+dep+" arr : "+arr+" time : "+ arrDate);
		
		List<FlightVO> listSearch = flights.getListSearch(cri,dep,arr,depDate);
		System.out.println(listSearch.size());
		for(FlightVO vo : listSearch) {
			System.out.println("vo : "+vo);
		}
		
		model.addAttribute("list", flights.getListSearch(cri,dep,arr,depDate));
		model.addAttribute("pageMaker", new PageDTO(cri, flights.getTotalSearch(cri,dep,arr,depDate)));
		
		model.addAttribute("arrlist", flights.getListSearch(cri,arr,dep,arrDate));
		model.addAttribute("arrPageMaker", new PageDTO(cri, flights.getTotalSearch(cri,arr,dep,arrDate)));
		
		//검색창 반환값
		model.addAttribute("dep", dep);
		model.addAttribute("arr", arr);
		model.addAttribute("arrDate", arrDate);
		model.addAttribute("depDate", depDate);
		
	}
	
	@GetMapping("/flight/reservation")
	public void getReservation(Model model,@Param("fno")int fno) {
		log.info("res....");
		FlightVO vo = flights.getFlightInfo(fno);
		model.addAttribute("vo",vo);
		model.addAttribute("fno",fno);
		String flightName = vo.getFlightName();
		System.out.println("flightName>>"+flightName);
		//예약된 좌석 명단
		List<FlightResVO> rvo = flights.getResAll(flightName);
	    ObjectMapper objectMapper = new ObjectMapper();
	    try {
	        String json = objectMapper.writeValueAsString(rvo);
	        model.addAttribute("json", json);
	        //System.out.println("json>> "+json);
	    } catch (JsonProcessingException e) {
	        e.printStackTrace(); // 또는 예외 처리 로직 추가
	    }
	    model.addAttribute("rvo",rvo);
		//list.add(flights.getResAll(flightName));

		System.out.println("list>>"+flights.getResAll(flightName));
		
	}
	
	//좌석 선택 후 결제창으로 넘어가기
	@GetMapping("/flightRes")
	@PreAuthorize("isAuthenticated()")
	public void flightRes(Model model,@Param("fno")int fno, @Param("seat")String seat) {
		log.info("유저 결제창...");
		//예약할 항공정보
		FlightVO vo = flights.getFlightInfo(fno);
		System.out.println("vo : "+vo);
		//가격구간 검색
		int price = flights.getPrice(vo.getDepName(),vo.getArrName());
		float pc = 0;
		System.out.println("price : "+price);

		//좌석별 가격구간 검색
		float seatPc = 0;
		String className = seat.charAt(0)+"";
		if(className == "A") {
			seat = "비지니스";
			seatPc = flights.getSeatPc(seat);
		}else if(className == "B") {
			seat = "이코노미";
			seatPc = flights.getSeatPc(seat);
		}else {
			seat = "일등석";
			seatPc = flights.getSeatPc(seat);
		}
		
		System.out.println("seat : "+seat);
		model.addAttribute("seat",seatPc);
		model.addAttribute("className",className);
				
		//유저정보 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if(authentication.getPrincipal() instanceof UserDetails) {
			UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
			String userid = userDetails.getUsername();
			
			System.out.println("id : "+userid);
			model.addAttribute("userid",userid);
			//유저이메일
			String email = flights.getEmail(userid);
			model.addAttribute("email",email);
			
			//유저나이 검색
			String dbage = flights.getUserAge(userid)+"";
			int age = 0;
			if(Integer.parseInt(dbage.substring(0, 2))<11 || Integer.parseInt(dbage.substring(0, 2))>59) {
				age = 12;
				//age = 2023-Integer.parseInt(19+dbage.substring(0, 2));
			}else {
				//나잇값 다시 고쳐야함...;;
				age = 2023-Integer.parseInt(20+dbage.substring(0, 2));
			}
			System.out.println("age : "+age);
			
			//나이별 할인구간 검색
			  pc = flights.getAgeDiscount(age); 
			  System.out.println(pc);
			  
			//카카오 포인트 검색
				int kpoint = flights.getKcount(userid);
				int kakaoP = 0;
				if(kpoint ==0) {
					kakaoP = 0;
				}else {
					kakaoP = flights.getKakaoPoint(userid);
				}
				
				System.out.println(kakaoP);
				model.addAttribute("kakaoP", kakaoP);
			//유저 마일리지 검색 
			int count = flights.getcount(userid);
			System.out.println(count);
			int point = 0;
			if(count == 0) {
				point = 0;
			}else {
				point = flights.getPoint(userid);
			}

			System.out.println(point);
			model.addAttribute("point",point);
			
			
			//int ageP =flights.getAgePercent()
			
			
			//pay.chargePoint(userid,amount);
			} else { 
				String userid = authentication.getPrincipal().toString(); 
				System.out.println("id : "+userid);
			} 
		model.addAttribute("fno",fno);
		model.addAttribute("seat",seat);
		model.addAttribute("vo", vo);
		model.addAttribute("price", price);
		model.addAttribute("pc", pc);
		model.addAttribute("total", Math.round(price*pc*seatPc));
		
		
	}
		
	@PostMapping(value="/rescomplete" )
	@PreAuthorize("isAuthenticated()")
	public @ResponseBody void rescomplete(@RequestBody FlightResDTO flight, RedirectAttributes rttr, HttpServletResponse res) throws IOException {
		/*
		 * System.out.println(flight.getUserid());
		 * System.out.println(flight.getPoint()); System.out.println(flight.getKakao());
		 * System.out.println(flight.getSeat()); System.out.println(flight.getTotal());
		 * System.out.println(flight.getFno());
		 */
		log.info("결제완료.. post");
		String userid = flight.getUserid();
		//db에 집어넣기
		//항공정보 가져오기 + user정보 가져오기
		FlightVO vo = flights.getFlightInfo(flight.getFno());
		//KakaoUserVO kvo = flights.getUserInfo(flight.getUserid());
		String uName = flights.getUserName(userid);
		//1.예약 테이블
		String rno = UUID.randomUUID().toString();
		Map<String, String> map = new HashMap<String, String>();
		map.put("resno", rno);
		map.put("userid", userid);
		map.put("username", uName);
		map.put("flightname", vo.getFlightName());
		map.put("departure", vo.getDepName());
		map.put("arrival", vo.getArrName());
		map.put("arrtime", vo.getFullArrtime());
		map.put("deptime", vo.getFullDeptime());
		map.put("seatid", flight.getSeat());
		System.out.println(map);
		/*
		 * FlightResVO resvo = FlightResVO.builder() .resno(rno)
		 * .userid(flight.getUserid()) .username(uName) .flightname(vo.getFlightName())
		 * .departure(vo.getDepName()) .arrival(vo.getArrName())
		 * .arrtime(vo.getArrTime()) .deptime(vo.getArrTime())
		 * .seatid(flight.getSeat()).build();
		 */
		int resResult = flights.insertRes(map);
		//2.userpay 테이블 업데이트
		if(resResult == 1) {
			//2-1.마일리지 및 카카오페이 사용내역 업데이트
			if(flight.getPoint()!=0 ) {
				int usePoint = pservice.updatePoint(-flight.getPoint(), userid);
			}
			if(flight.getKakao() != 0) {
				int useKakao = pservice.updateKakaoPoint(-flight.getKakao(), userid);
			}
			//2-2. 구매관련 마일리지 및 금액 적립
			int total = flight.getTotal();
			int mileage = (int) (Math.round(flight.getTotal()*0.1));
			int payResult = flights.insertPay(rno, userid, total, mileage);
			System.out.println("payResult>>"+payResult);
			//2-3. 유저로그 업데이트(비행내역, 구매총금액, 총 마일리지)
			int flightCount = flights.getBuyCount(userid); //예약내역으로 구매횟수 조회
			System.out.println("flightCount>>"+flightCount);
			int flightSum = flights.getTotalBuy(userid);//총 구매금액 조회 ->등급업데이트에 이용
			System.out.println("flightSum>>"+flightSum);
			int userPoint = flights.getCurMileage(userid);//현재 마일리지 금액		
			System.out.println("userPoint>>"+userPoint);
			int logresult = flights.logUpdate(userid,flightCount, flightSum, userPoint);
			System.out.println("logresult>>"+logresult);
			//2-4. 등급 업데이트
			int flightSum1 = 0;
			if(flightSum<300000) { flightSum1 = 0;}
			else if(flightSum>=300000 && flightSum<500000) {flightSum1 = 300000;}
			else if(flightSum>=500000 && flightSum<1000000) {flightSum1 = 500000;}
			else{flightSum1 = 1000000;}
			System.out.println("등급코드기준금액>>>>"+flightSum1);
			int getCode = flights.getGradeCode(flightSum1);
			//원래 등급과 비교해서 변동사항이 잇을시 로우 인서트
			int oriCode = flights.getOriCode(userid);
			if(oriCode != getCode) {
				//kakaouser + log 테이블 바꿈
				int codeUpdate = flights.updateGrade(userid,getCode);
				int logInsert = flights.insertGradeUpdate(userid,flightCount,flightSum,userPoint);
			}
			System.out.println("oriCode>>"+oriCode + ":" +getCode );
			//flightSum이 grade 테이블의 gradeStandard 이상인 gradeCode를 가져와 kakaoUser 테이블에 업데이트
		}
		
		//getRescomplete으로 리다이렉트(예약정보 가져오기)
		FlightResVO resVo = flights.getResInfo(rno);
		System.out.println("resVo >>>"+resVo);
		
		rttr.addAttribute("userid", userid);
		//rttr.addAttribute("resVo",resVo);
		//rttr.addAttribute("rno",rno);
		res.sendRedirect("/flight/rescompleteMeg");
	}
	
	@GetMapping("/rescompleteMeg")
	@PreAuthorize("isAuthenticated()")
	public void getRescomplete(Model model, @RequestParam("userid")String userid) {
		log.info("결제완료.. get");
		
		System.out.println("id>>>>"+userid);
		//비행기 예약내역 최신순 1 찾아오기
		FlightResVO vo = flights.getResFirst(userid);
		//결제자 정보
		KakaoUserVO kvo = flights.getUserInfo(userid);
		model.addAttribute("userid",userid);
		model.addAttribute("vo",vo);
		model.addAttribute("kvo",kvo);
		//총 결제금액
		int usePoint = flights.usePoint(userid);
		model.addAttribute("point",usePoint);


		}
	

	
}
