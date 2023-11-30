package com.airline.service;

import java.util.List;

import com.airline.vo.BoardEventFileVO;

public interface BoardEventFileService {

	List<BoardEventFileVO> searchFileByBoardNum(int boardNum);
	
	int fileCount(int boardNum);
	
	int insertFile(BoardEventFileVO vo); 
	
	int deleteFiles(int boardNum);
	
	List<BoardEventFileVO> findRepImg();

	int updateRepImg(String ori_file_name, int boardNum);
	
}
