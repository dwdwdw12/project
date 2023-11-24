package com.airline.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.airline.service.FlightService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	private FlightService flights;
	
	//좌석 선택 후 결제창으로 넘어가기
	@GetMapping("/flightRes")
	public void flightRes(Model model,@Param("fno")int fno, @Param("seat")String seat) {
		log.info("유저 결제창...");
		model.addAttribute("fno", fno);
		model.addAttribute("seat",seat);
	}
	

}
