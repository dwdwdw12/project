package com.airline.service;

import java.util.List;

import com.airline.vo.BoardEventVO;
import com.airline.vo.Criteria;

public interface BoardEventService {

	public List<BoardEventVO> getListwithPaging(Criteria criteria);
	
	public BoardEventVO get(int boardNum);
	
	public boolean insert(BoardEventVO board);	
	
	public boolean delete(int boardNum);		
	
	public boolean update(BoardEventVO board);	
	
	public int getTotalCount(Criteria cri);
	
}
