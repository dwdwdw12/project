package com.airline.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.airline.vo.Criteria;
import com.airline.vo.FlightVO;

public interface FlightService {

	public List<FlightVO> getList(Criteria cri);

	public int getTotal(Criteria cri);
	
	//리스트 전체 페이지로 바꿔치기
	public List<FlightVO> getListSearch(@Param("cri")Criteria cri,@Param("dep") String dep,@Param("arr") String arr,@Param("time") String time);

	public int getTotalSearch(Criteria cri, String dep, String arr, String formattedDate);
}
