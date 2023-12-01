package com.airline.service;

import java.util.List;

import com.airline.vo.BoardEventFileVO;
import com.airline.vo.BoardEventVO;
import com.airline.vo.Criteria;

public interface BoardEventService {

	public List<BoardEventVO> getListwithPaging(Criteria criteria);
	
	public BoardEventVO get(int boardNum);
	
	public void insert(BoardEventVO board);	
	
	public boolean delete(int boardNum);		
	
	public boolean update(BoardEventVO board);	
	
	public int getTotalCount(Criteria cri);
	
	public List<BoardEventFileVO> getFileList(int boardNum);
	
}
