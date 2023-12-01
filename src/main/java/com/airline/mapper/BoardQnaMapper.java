package com.airline.mapper;

import java.util.List;

import com.airline.vo.BoardQnaVO;
import com.airline.vo.Criteria;

public interface BoardQnaMapper {

	public List<BoardQnaVO> getList();
	
	public List<BoardQnaVO> getPageList(Criteria cri);
	
	public int getTotal();
	
	public BoardQnaVO readOne(int boardnum);
	
	public void deleteQna(int boardnum);
	
	public void updateQna(BoardQnaVO vo);
	
	public void updateReadCount(int boardnum);

	public void registerQna(BoardQnaVO vo);
	
	public void replyQna(BoardQnaVO vo); 
	
	public BoardQnaVO selectBoardreref(int boardnum); 
	
	public void updateRepAdmin(int boardreref); 
	
}
