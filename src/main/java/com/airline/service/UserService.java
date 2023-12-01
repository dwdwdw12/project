package com.airline.service;

import java.util.List;

import com.airline.vo.BoardDiaryVO;
import com.airline.vo.KakaoUserVO;
import com.airline.vo.PointVO;
import com.airline.vo.UserPayVO;

public interface UserService {
	//유저 정보 불러오기
	KakaoUserVO getUserInfo(String userid);
	//등급조회(grade 테이블)
	String getGrade(int gradeCode);
	//유저별 포인트 내역 가져오기
	UserPayVO getPoint(String userid);
	//포인트 합
	int getSumP(String userid);
	//최근 마일리지 내역3개
	List<UserPayVO> getPoint3(String userid);
	//카카오포인트 합
	int getSumK(String userid);
	//최근 카카오내역3
	List<PointVO> getKakao3(String userid);
	//여행일기 게시글 3개
	List<BoardDiaryVO> getDiary(String userid);
	//전체 유저정보 가져오기(가입순서 desc)
	List<KakaoUserVO> getUserInfoAll();

}
