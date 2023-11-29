package com.airline.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.airline.service.BoardNoticeService;
import com.airline.vo.BoardNoticeVO;
import com.airline.vo.Criteria;
import com.airline.vo.KakaoUserVO;
import com.airline.vo.PageDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/notice/*")
@Log4j
@RequiredArgsConstructor
public class BoardNoticeController {

	@Autowired
	private BoardNoticeService service;
	
	@GetMapping("/list")
	public void getList(Model model, Criteria cri) {
		model.addAttribute("list", service.getPageList(cri));
		model.addAttribute("page", new PageDTO(cri, service.getTotal()));
	}
	
	@GetMapping("/read")
	public void read(Model model, @Param("boardnum")int boardnum, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("board", service.getOne(boardnum));
		System.out.println(service.getOne(boardnum));
		service.updateReadCount(boardnum);
	}
	
	
	@PostMapping("/delete")
	public String delete(@Param("boardnum") int boardnum, RedirectAttributes rttr) {
		service.delete(boardnum);
		return "redirect:/notice/list";
	}
	
	@GetMapping("/register")
	public void getRegister() {
	}
	
	@PostMapping("/register")
	public String register( BoardNoticeVO vo, RedirectAttributes rttr) throws Exception{
		System.out.println(vo);
		service.insert(vo);
		return "redirect:/notice/list";
	}

	@GetMapping("/modify")
	public void getModify(Model model, @Param("boardnum")int boardnum, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("board", service.getOne(boardnum));
		System.out.println(service.getOne(boardnum));
	}
	
	@PostMapping("/modify")
	public String modify(BoardNoticeVO vo, RedirectAttributes rttr) {
		service.modify(vo);
		System.out.println(">>>>>>>>>>>>>>>>"+vo);
		return "redirect:/notice/list";
	}
	
}
