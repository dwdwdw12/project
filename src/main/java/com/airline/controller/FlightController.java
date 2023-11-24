package com.airline.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.airline.service.FlightService;
import com.airline.vo.Criteria;
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
	
}
