package com.airline.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class HomeController {
	
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
		model.addAttribute("REST_API_KEY","a490df18ce9a725d8744f401c597d9eb");
		model.addAttribute("REDIRECT_URI","https://localhost:8081");
		
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
	public void userPage() {
		log.info("user page");
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
