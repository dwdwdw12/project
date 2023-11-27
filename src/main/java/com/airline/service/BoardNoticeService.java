package com.airline.service;

import java.util.List;

import com.airline.vo.BoardNoticeVO;
import com.airline.vo.Criteria;

public interface BoardNoticeService {

	public List<BoardNoticeVO> getList();

	public List<BoardNoticeVO> getPageList(Criteria cri);
	
	public int getTotal();
	
	public BoardNoticeVO getOne(int boardnum);
	
	public void insert(BoardNoticeVO vo);
	
	public void modify(BoardNoticeVO vo);
	
	public void delete(int boardnum);

	
}
