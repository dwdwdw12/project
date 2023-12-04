package com.airline.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.airline.service.UserService;
import com.airline.vo.BoardDiaryVO;
import com.airline.vo.Criteria;
import com.airline.vo.FlightResVO;
import com.airline.vo.PageDTO;
import com.airline.vo.PointVO;
import com.airline.vo.UserPayVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
@RequestMapping("/user/*")
public class UserController {

	@Autowired
	private UserService service;

	@Autowired
//	private PayService pay;

	// 좌석 선택 후 결제창으로 넘어가기
//	@GetMapping("/flightRes")
//	public void flightRes(Model model,@Param("fno")int fno, @Param("seat")String seat) {
//		log.info("유저 결제창...");
//		//유저정보 가져오기
//		model.addAttribute("fno", fno);
//		model.addAttribute("seat",seat);
//	}

	//포인트 충전 view단
	@GetMapping("/chargePoint")
	public void chargePoint() {

	}
	
	//포인트 충전을 위한 url 받음
	@GetMapping("/chargePoint2")
	public void chargePoint2(int amount) {
		System.out.println("amount : " + amount);
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication.getPrincipal() instanceof UserDetails) {
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String userid = userDetails.getUsername();
			System.out.println("id : " + userid);
			int result = service.chargePoint(userid, amount);
		}

	}
	
	//포인트 충전 상세조회
	@GetMapping("/kakaoDetail")
	public void kakaoDetail(Model model,Criteria cri) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication.getPrincipal() instanceof UserDetails) {
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String userid = userDetails.getUsername();
			System.out.println("id : " + userid);
			List<PointVO> vo = service.getKPoint(userid, cri);
			int sumK = service.getSumK(userid);
			model.addAttribute("vo",vo);
			model.addAttribute("sumK",sumK);
			System.out.println( new PageDTO(cri, service.getKTotal(userid, cri)));
			model.addAttribute("paging", new PageDTO(cri, service.getKTotal(userid, cri)));
		}
	}
	
	//마일리지 적립,사용 상세조회
	@GetMapping("/mileage")
	public void mileage(Model model, Criteria cri) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication.getPrincipal() instanceof UserDetails) {
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String userid = userDetails.getUsername();
			System.out.println("id : " + userid);
			List<UserPayVO> vo = service.getMPoint(userid, cri);
			int sumP= service.getSumP(userid);
			model.addAttribute("vo",vo);
			model.addAttribute("sumP",sumP);
			PageDTO dto = new PageDTO(cri, service.getMTotal(userid, cri));
			model.addAttribute("paging", new PageDTO(cri,  service.getMTotal(userid, cri)));
			System.out.println("dto>>>"+dto);
		}
	}
	
	//유저별 항공예약 상세조회
	@GetMapping("/userResDetail")
	public void userResDetail(Model model,Criteria cri) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication.getPrincipal() instanceof UserDetails) {
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String userid = userDetails.getUsername();
			System.out.println("id : " + userid);
			List<FlightResVO> vo = service.getUserRes(userid, cri);
			System.out.println(vo);
			//항공구매횟수, 총 구매금액
			int count= service.getCountBuy(userid);
			int totalPrice= service.getTotal(userid);
			model.addAttribute("vo",vo);
			model.addAttribute("count",count);
			model.addAttribute("totalPrice",totalPrice);
			model.addAttribute("paging", new PageDTO(cri, service.getFlightTotal(userid, cri)));
			System.out.println("test>>>>>"+new PageDTO(cri, service.getFlightTotal(userid, cri)));
		}
	}
	
	//항공취소, 체크인 처리
	@PostMapping(value="/userResDetail", produces = MediaType.APPLICATION_JSON_VALUE)
	public void userResDetailPost(@RequestParam("resno")String data) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication.getPrincipal() instanceof UserDetails) {
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String userid = userDetails.getUsername();
			System.out.println("id : " + userid);
			System.out.println("data : "+data);
			//항공취소 처리
			int result = service.cancelTicket(data);
			//체크인 처리
			int resultCheckin = service.checkin(data);
		}
	}
	
	//여행일기 상세조회
	@GetMapping("/diary")
	public void userDiary(Model model,Criteria cri) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication.getPrincipal() instanceof UserDetails) {
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String userid = userDetails.getUsername();
			System.out.println("id : " + userid);
			String username = service.getName(userid);
			List<BoardDiaryVO> vo = service.getUserDiary(username, cri);
			model.addAttribute("vo",vo);
			model.addAttribute("paging", new PageDTO(cri, service.getUserDiaryCnt(username, cri)));

		}
	}
	
	

	@GetMapping("/joinTerms")
	public void joinTerms() {
		log.info(">>>>>>>>>>>>>>>");
	}
	
}
