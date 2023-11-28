package com.airline.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.airline.service.JoinService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
@RequestMapping("/join/*")
public class JoinController {
	@Autowired
	private JoinService join;
	
	@GetMapping("/joinTerms")
	public void joinTemrs() {
		log.info("JoinController >> joinTerms");
	}
	
	@GetMapping("/findId")
	public void findId() {
		log.info("JoinController >> findId");
	}
	@PostMapping("/findId")
	public String findId(String email, Model model, RedirectAttributes attr) {
		String result = join.confirmEmail(email);
		model.addAttribute("email", result);
		
		log.info("email >> " + email);
		log.info("result >> " + result);
		
		if(result != null) {		
			return "redirect:/join/showUserId";
		} else {
			model.addAttribute("message", "입력하신 정보를 다시 확인해주시기 바랍니다.");
			return "redirect:/join/findId";
		}
	}
	
	@GetMapping("/getUserId")
	public void getUserId(@PathVariable String email, @PathVariable String mail_key) {
		log.info("JoinController >> getUserId");
		join.showUserId(email, mail_key);
	}

	
	
	
	
	
	@GetMapping("/findPwd")
	public void findPwd() {
		log.info("JoinController >> findPwd");
	}
	
}
