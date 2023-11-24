package com.airline.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airline.mapper.FlightMapper;
import com.airline.vo.Criteria;
import com.airline.vo.FlightVO;

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

}
