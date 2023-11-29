package com.airline.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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

import com.airline.service.UserService;
import com.airline.vo.BoardDiaryVO;
import com.airline.vo.KakaoUserVO;
import com.airline.vo.PointVO;
import com.airline.vo.UserPayVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class HomeController {
	
	@Autowired
	private UserService user;
	
	//메인화면
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {		
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
			//여행일기 게시글 최근3개
			List<BoardDiaryVO> dvo = user.getDiary(userid);
			model.addAttribute("dvo",dvo);
			//문의게시글 최근3개
			/*
			 * List<BoardQnaVO> dvo = user.getDiary(userid); model.addAttribute("dvo",dvo);
			 */
			
		}
		
	}
	
	
	//마이페이지(관리자)
	@GetMapping("/admin")
	public void adminPage() {
		log.info("admin page");
	}
	
	@GetMapping("/contact")
	public void contact() {
		
	}
	
}
