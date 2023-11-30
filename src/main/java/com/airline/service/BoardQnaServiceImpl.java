package com.airline.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airline.mapper.BoardQnaMapper;
import com.airline.vo.BoardQnaVO;
import com.airline.vo.Criteria;

@Service
public class BoardQnaServiceImpl implements BoardQnaService{

	@Autowired
	private BoardQnaMapper mapper;
	
	@Override
	public List<BoardQnaVO> getList() {
		return mapper.getList();
	} 

	@Override
	public BoardQnaVO readOne(int boardnum) {
		return mapper.readOne(boardnum);
	}

	@Override
	public void deleteQna(int boardnum) {
		mapper.deleteQna(boardnum);
	}

	@Override
	public void updateQna(BoardQnaVO vo) {
		mapper.updateQna(vo);
	}

	@Override
	public void registerQna(BoardQnaVO vo) {
		mapper.registerQna(vo);
	}

	@Override
	public List<BoardQnaVO> getPageList(Criteria cri) {
		return mapper.getPageList(cri);
	}

	@Override
	public int getTotal() {
		return mapper.getTotal();
	}

	@Override
	public void updateReadCount(int boardnum) {
		mapper.updateReadCount(boardnum);
	}

	@Override
	public void replyQna(BoardQnaVO vo) {
		mapper.replyQna(vo);
	}

	@Override
	public BoardQnaVO selectBoardreref(int boardnum) {
		return mapper.selectBoardreref(boardnum);
	}

}
