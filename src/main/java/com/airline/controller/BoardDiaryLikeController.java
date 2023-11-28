package com.airline.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.airline.mapper.BoardDiaryMapper;
import com.airline.service.BoardDiaryLikeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequiredArgsConstructor
@RequestMapping("/boardDiary/like")
public class BoardDiaryLikeController {

	private final BoardDiaryLikeService service;

	private final BoardDiaryMapper diaryMapper;
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/{boardNum}/{userId}")
	public ResponseEntity<String> create(@PathVariable("boardNum") int boardNum, @PathVariable("userId") String userId){
		log.info("insert like controller ");
		
		int checkLike = service.checkLike(boardNum, userId);
		
		if(checkLike==0) {
			service.insertLike(boardNum, userId);
			diaryMapper.updateLikeCount(boardNum);
			
			return service.insertLike(boardNum, userId) ? new ResponseEntity<String>("success", HttpStatus.OK) 	
					: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR); 
			
		} else if(checkLike==1) {
			service.deleteLike(boardNum, userId);
			diaryMapper.updateLikeCount(boardNum);
			
			return service.deleteLike(boardNum, userId) ? new ResponseEntity<String>("success", HttpStatus.OK) 	
					: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR); 
		}
		
		return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR); 
	}
	
}
