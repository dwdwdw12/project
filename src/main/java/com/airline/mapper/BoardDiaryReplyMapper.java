package com.airline.mapper;

import java.util.List;

import com.airline.vo.BoardDiaryReplyVO;
import com.airline.vo.Criteria;

public interface BoardDiaryReplyMapper {
	
	int insertReply(BoardDiaryReplyVO vo);
	
	int replyCount(int boardNum);
	
	List<BoardDiaryReplyVO> selectAllReply(Criteria cri, int boardNum);	//param 써야할수도.
	
	void updateReply(BoardDiaryReplyVO vo);
	
	void deleteReply(int replyNum, int boardNum);
	
	BoardDiaryReplyVO selectOneReply(int replyNum, int boardNum);
	
	
	
}
