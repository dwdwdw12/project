package com.airline.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.airline.mapper.BoardEventMapper;
import com.airline.vo.BoardEventVO;
import com.airline.vo.Criteria;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class BoardEventServiceImpl implements BoardEventService{

	private final BoardEventMapper mapper;
	
	@Override
	public List<BoardEventVO> getListwithPaging(Criteria criteria) {
		log.info("get list with paging service");
		return mapper.getListwithPaging(criteria);
	}

	@Transactional
	@Override
	public BoardEventVO get(int boardNum) {
		log.info("get service");
		mapper.updateReadCount(boardNum);
		return mapper.get(boardNum);
	}

	@Override
	public boolean insert(BoardEventVO board) {
		log.info("insert service");
		return mapper.insert(board)==1;
	}

	@Override
	public boolean delete(int boardNum) {
		log.info("delete service");
		return mapper.delete(boardNum)==1;
	}

	@Override
	public boolean update(BoardEventVO board) {
		log.info("update service");
		return mapper.update(board)==1;
	}

	@Override
	public int getTotalCount(Criteria cri) {
		log.info("getTotalCount");
		return mapper.getTotalCount(cri);
	}
	
}
