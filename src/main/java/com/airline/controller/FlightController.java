package com.airline.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.airline.service.FlightService;
import com.airline.vo.Criteria;
import com.airline.vo.FlightResDTO;
import com.airline.vo.FlightVO;
import com.airline.vo.PageDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
@RequestMapping("/flight/*")
public class FlightController {

	@Autowired
	private FlightService flights;
	
	@GetMapping("/list")
	public void getList(Model model, Criteria cri) {
		model.addAttribute("list",flights.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, flights.getTotal(cri)));
	}
	
	@GetMapping(value="/search", produces = {MediaType.APPLICATION_JSON_VALUE})
	public void getSearch(Model model, Criteria cri,@Param("dep") String dep,@Param("arr") String arr,@Param("time") String time) {
		System.out.println("dep : "+dep+" arr : "+arr+" time : "+ time);
		Date date = new Date(time);
		SimpleDateFormat formate = new SimpleDateFormat("yyyy-MM-dd");
		int year = date.getYear()+1900;
		int month = date.getMonth()+1;
		int day = date.getDate();
		
		System.out.println("year : "+year);
		System.out.println("month : "+date.getMonth());
		System.out.println("date : "+date.getDate());

		LocalDate localdate = LocalDate.of(year,month,day);
		System.out.println("localdate : "+localdate);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); 

		String formattedDate = formatter.format(localdate);
		//System.out.println("날짜출력1>>>>"+formatter);
		System.out.println("날짜출력2>>>>"+formattedDate);
		
		model.addAttribute("list",flights.getListSearch(cri,dep,arr,formattedDate));
		model.addAttribute("pageMaker", new PageDTO(cri, flights.getTotalSearch(cri,dep,arr,formattedDate)));
		
		//검색창 반환값
		model.addAttribute("dep", dep);
		model.addAttribute("arr", arr);
		model.addAttribute("time", formattedDate);
		
	}
	
	@GetMapping("/flight/reservation")
	public void getReservation(Model model,@Param("fno")int fno) {
		log.info("res....");
		model.addAttribute("fno",fno);
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
	
	@GetMapping("/rescomplete")
	@PreAuthorize("isAuthenticated()")
	public void getRescomplete(Model model) {
		log.info("결제완료.. get");
		//결제완료 메세지 띄우기
		
		}
	
	@PostMapping(value="/rescomplete" )
	@PreAuthorize("isAuthenticated()")
	public @ResponseBody void rescomplete(@RequestBody FlightResDTO flight) {
		System.out.println(flight.getUserid());
		System.out.println(flight.getPoint());
		System.out.println(flight.getKakao());
		System.out.println(flight.getSeat());
		System.out.println(flight.getTotal());
		System.out.println(flight.getFno());
		log.info("결제완료.. post");
		//db에 집어넣기
		//1.예약 테이블
		//2.userpay
		//3.등급 업데이트
		//4.마일리지 및 카카오페이 사용내역 업데이트
		//getRescomplete으로 리다이렉트
	
	}
	

	
}
