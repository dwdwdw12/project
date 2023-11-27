package com.airline.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airline.mapper.FlightMapper;
import com.airline.vo.Criteria;
import com.airline.vo.FlightVO;
import com.airline.vo.KakaoUserVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
public class FlightServiceImpl implements FlightService{

	@Autowired
	private FlightMapper mapper;
	
	@Override
	public List<FlightVO> getList(Criteria cri) {
		return mapper.getList(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotal(cri);
	}

	@Override
	public List<FlightVO> getListSearch(Criteria cri, String dep, String arr, String time) {
		return mapper.getListSearch(cri, dep, arr, time);
	}

	@Override
	public int getTotalSearch(Criteria cri, String dep, String arr, String time) {
		return mapper.getTotalSearch(cri, dep, arr, time);
	}

	@Override
	public FlightVO getFlightInfo(int fno) {
		return mapper.getFlightInfo(fno);
	}

	@Override
	public int getPrice(String depName, String arrName) {
		return mapper.getPrice(depName,arrName);
	}

	@Override
	public int getUserAge(String userid) {
		return mapper.getUserAge(userid);
	}

	@Override
	public float getAgeDiscount(int age) {
		return mapper.getAgeDiscount(age);
	}

	@Override
	public int getKakaoPoint(String userid) {
		return mapper.getKakaoPoint(userid);
	}

	@Override
	public int getPoint(String userid) {
		return mapper.getPoint(userid);
	}

	@Override
	public int getcount(String userid) {
		return mapper.getCount(userid);
	}

	@Override
	public String getEmail(String userid) {
		return mapper.getEmail(userid);
	}

	@Override
	public int getKcount(String userid) {
		return mapper.getKCount(userid);
	}

	@Override
	public float getSeatPc(String seat) {
		return mapper.getSeatPc(seat);
	}

}
