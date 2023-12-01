package com.airline.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airline.mapper.UserMapper;
import com.airline.vo.BoardDiaryVO;
import com.airline.vo.BoardEventVO;
import com.airline.vo.BoardNoticeVO;
import com.airline.vo.CancelVO;
import com.airline.vo.FlightResVO;
import com.airline.vo.KakaoUserVO;
import com.airline.vo.PointVO;
import com.airline.vo.UserPayVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper mapper;
	
	
	@Override
	public KakaoUserVO getUserInfo(String userid) {
		return mapper.getUser(userid);
	}


	@Override
	public String getGrade(int gradeCode) {
		return mapper.getGrade(gradeCode);
	}


	@Override
	public UserPayVO getPoint(String userid) {
		return mapper.getPoint(userid);
	}


	@Override
	public int getSumP(String userid) {
		return mapper.getSumP(userid);
	}


	@Override
	public List<UserPayVO> getPoint3(String userid) {
		return mapper.getPoint3(userid);
	}


	@Override
	public int getSumK(String userid) {
		return mapper.getSumK(userid);
	}


	@Override
	public List<PointVO> getKakao3(String userid) {
		return mapper.getKakao3(userid);
	}


	@Override
	public List<BoardDiaryVO> getDiary(String userid) {
		return mapper.getDiary(userid);
	}


	@Override
	public List<KakaoUserVO> getUserInfoAll() {
		return mapper.getUserInfoAll();
	}


	@Override
	public List<UserPayVO> getSale() {
		return mapper.getSale();
	}


	@Override
	public List<CancelVO> reqCancel() {
		return mapper.reqCancel();
	}


	@Override
	public List<FlightResVO> getFlightres() {
		return mapper.getFlightres();
	}


	@Override
	public List<BoardNoticeVO> getNotice() {
		return mapper.getNotice();
	}


	@Override
	public List<BoardEventVO> getEvent() {
		return mapper.getEvent();
	}

}
