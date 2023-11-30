package com.airline.mapper;

import java.util.List;

import com.airline.vo.BoardEventVO;
import com.airline.vo.Criteria;

public interface BoardEventMapper {

	public List<BoardEventVO> getList();

	public List<BoardEventVO> getListwithPaging(Criteria cri);

	public BoardEventVO get(int boardNum);

	public int insert(BoardEventVO vo);
	
	public int delete(int boardNum);
	
	public int update(BoardEventVO vo);
	
	public int getTotalCount(Criteria cri);

	public int updateReadCount(int boardNum);
	
}
