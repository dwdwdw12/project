package com.airline.mapper;

public interface BoardDiaryLikeMapper {

	int insertLikecount(int boardNum, String userId);
	
	int deleteLikecount(int boardNum, String userId);
	
	int checkLike(int boardNum, String userId);
	
	int likecount(int boardNum);	
	
}
