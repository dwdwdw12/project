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
import com.airline.vo.BoardDiaryLikeDTO;

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
	public ResponseEntity<BoardDiaryLikeDTO> updateLike(@PathVariable("boardNum") int boardNum, @PathVariable("userId") String userId){
		log.info("insert like controller ");
		
		int checkLike = service.checkLike(boardNum, userId);
		log.info("checklike : "+checkLike);
		
		diaryMapper.updateLikeCount(boardNum);
		int likeCount = service.likeCount(boardNum);
		
		BoardDiaryLikeDTO dto = new BoardDiaryLikeDTO();
		
		if(checkLike==0) {
			log.info("add like>>> ");
			boolean insertLike = service.insertLike(boardNum, userId);
			diaryMapper.updateLikeCount(boardNum);
			
			dto.setMessage("success");
			dto.setCheckLike(checkLike);
			dto.setLikeCount(likeCount);
			
			return insertLike ? new ResponseEntity<BoardDiaryLikeDTO>(dto, HttpStatus.OK) 	
					: new ResponseEntity<BoardDiaryLikeDTO>(dto, HttpStatus.INTERNAL_SERVER_ERROR); 
			
		} else if(checkLike==1) {
			log.info("delete like>>> ");
			boolean deleteLike = service.deleteLike(boardNum, userId);
			diaryMapper.updateLikeCount(boardNum);
			
			dto.setMessage("success");
			dto.setCheckLike(checkLike);
			dto.setLikeCount(likeCount);
			
			return deleteLike ? new ResponseEntity<BoardDiaryLikeDTO>(dto, HttpStatus.OK) 	
					: new ResponseEntity<BoardDiaryLikeDTO>(dto, HttpStatus.INTERNAL_SERVER_ERROR); 
		}
		
		return new ResponseEntity<BoardDiaryLikeDTO>(dto, HttpStatus.INTERNAL_SERVER_ERROR); 
	}
	
//	@PreAuthorize("isAuthenticated()")
//	@PostMapping(value = "/{boardNum}/{userId}")
//	public ResponseEntity<String> updateLike(@PathVariable("boardNum") int boardNum, @PathVariable("userId") String userId){
//		log.info("insert like controller ");
//		
//		int checkLike = service.checkLike(boardNum, userId);
//		log.info("checklike : "+checkLike);
//		if(checkLike==0) {
//			boolean insertLike = service.insertLike(boardNum, userId);
//			diaryMapper.updateLikeCount(boardNum);
//			
//			return insertLike ? new ResponseEntity<String>("success", HttpStatus.OK) 	
//					: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR); 
//			
//		} else if(checkLike==1) {
//			boolean deleteLike = service.deleteLike(boardNum, userId);
//			log.info("delete like 통과 ");
//			diaryMapper.updateLikeCount(boardNum);
//			log.info("update like count 통과 ");
//			return deleteLike ? new ResponseEntity<String>("success", HttpStatus.OK) 	
//					: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR); 
//		}
//		
//		return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR); 
//	}
	
}
