package com.airline.controller;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.airline.service.FlightService;
//import com.airline.service.PayService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	private FlightService flights;
	
	@Autowired
//	private PayService pay;
	
	//좌석 선택 후 결제창으로 넘어가기
//	@GetMapping("/flightRes")
//	public void flightRes(Model model,@Param("fno")int fno, @Param("seat")String seat) {
//		log.info("유저 결제창...");
//		//유저정보 가져오기
//		model.addAttribute("fno", fno);
//		model.addAttribute("seat",seat);
//	}
	
	
	@GetMapping("/chargePoint")
	public void chargePoint() {
		}
	
	@GetMapping("/chargePoint2")
	public @ResponseBody void postChargePoint(int amount) {
		System.out.println("amount : "+amount);
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//		if(authentication.getPrincipal() instanceof UserDetails) {
//			UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
//			String userid = userDetails.getUsername(); 
//			System.out.println("id : "+userid);
//			pay.chargePoint(userid,amount);
//			} else { 
//				String userid = authentication.getPrincipal().toString(); 
//				System.out.println("id : "+userid);
//			} 
		}
	
	@GetMapping("/joinTerms")
	public void joinTerms() {
		log.info(">>>>>>>>>>>>>>>");
	}
	

	

		

}
