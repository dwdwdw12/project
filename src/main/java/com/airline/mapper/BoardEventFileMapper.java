package com.airline.mapper;

import java.util.List;

import com.airline.vo.BoardEventFileVO;

public interface BoardEventFileMapper {
	
	List<BoardEventFileVO> searchFileByBoardNum(int boardNum);
	
	int fileCount(int boardNum);
	
	int insertFile(BoardEventFileVO vo); 
	
	int deleteFiles(int boardNum);
	
	List<BoardEventFileVO> findRepImg();

	int updateRepImg(String ori_file_name, int boardNum);
	
}
