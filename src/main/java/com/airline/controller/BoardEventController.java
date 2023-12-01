package com.airline.controller;

import java.util.List; 

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.airline.service.BoardEventService;
import com.airline.vo.BoardEventVO;
import com.airline.vo.Criteria;
import com.airline.vo.PageDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/boardEvent/*")
@RequiredArgsConstructor
public class BoardEventController {

	private final BoardEventService service;
	
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		log.info("list..." + cri);
		//cri.setPageNum(1);
		//cri.setAmount(2);
				
		model.addAttribute("EventList", service.getListwithPaging(cri));
		model.addAttribute("paging", new PageDTO(cri, service.getTotalCount(cri)));
	}
	
	@GetMapping("/gridList")
	public void gridList(Model model, Criteria cri) {
		log.info("grid list..." + cri);
		//cri.setPageNum(1);
		cri.setAmount(12);
				
		model.addAttribute("EventList", service.getListwithPaging(cri));
		model.addAttribute("paging", new PageDTO(cri, service.getTotalCount(cri)));
	}
	
	@GetMapping("/write")
	@PreAuthorize("isAuthenticated()")
	public void write() {
		log.info("insert...");
		
	}
	
	@PostMapping("/write")
	@PreAuthorize("isAuthenticated()")
	public String write(BoardEventVO board, RedirectAttributes rttr){	

		service.insert(board);
		rttr.addFlashAttribute("result", board.getBoardNum());	
		
		return "redirect:/boardEvent/list";
	}
	

	@GetMapping({"/view", "/update"})
	public void get(@RequestParam("boardNum") int boardNum, @ModelAttribute("cri") Criteria cri , Model model) {
		log.info("get/modify...");
		log.info(boardNum);
		BoardEventVO eventVO = service.get(boardNum);
		model.addAttribute("board", eventVO);
		
	}
	
	@PostMapping("/delete")
	public String remove(int boardNum, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove : " + boardNum);
		
		if(service.delete(boardNum)) {
			
			rttr.addFlashAttribute("result", "success");
		}
		
		
		return "redirect:/boardEvent/list" + cri.getListLink();
	}
	
	@PostMapping("/update")
	public String modify(BoardEventVO vo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("update...");
		
		if(service.update(vo)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		
		return "redirect:/boardEvent/list" + cri.getListLink();
	}
	
}
