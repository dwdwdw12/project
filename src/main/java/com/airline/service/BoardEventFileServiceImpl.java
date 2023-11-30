package com.airline.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.airline.mapper.BoardEventFileMapper;
import com.airline.mapper.BoardEventMapper;
import com.airline.vo.BoardEventFileVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class BoardEventFileServiceImpl implements BoardEventFileService{

	private final BoardEventFileMapper mapper;
	
	@Override
	public List<BoardEventFileVO> searchFileByBoardNum(int boardNum) {
		log.info("searchFileByBoardNum service");
		return mapper.searchFileByBoardNum(boardNum);
	}

	@Override
	public int fileCount(int boardNum) {
		log.info("fileCount service");
		return mapper.fileCount(boardNum);
	}

	@Override
	public int insertFile(BoardEventFileVO vo) {
		log.info("insertFile service");
		return mapper.insertFile(vo);
	}

	@Override
	public int deleteFiles(int boardNum) {
		log.info("deleteFiles service");
		return mapper.deleteFiles(boardNum);
	}

	@Override
	public List<BoardEventFileVO> findRepImg() {
		log.info("findRepImg service");
		return mapper.findRepImg();
	}

	@Override
	public int updateRepImg(String ori_file_name, int boardNum) {
		log.info("updateRepImg service");
		return mapper.updateRepImg(ori_file_name, boardNum);
	}

}
