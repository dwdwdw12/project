package com.airline.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.airline.vo.Criteria;
import com.airline.vo.FlightVO;

@Component
public interface FlightMapper {

	public List<FlightVO> getList(Criteria cri);
	
	public List<FlightVO> getListSearch(@Param("cri")Criteria cri,@Param("dep") String dep,@Param("arr") String arr,@Param("time") String time);

	//public List<FlightVO> getListSearch2(@Param("dep") String dep,@Param("arr") String arr,@Param("time") String time);
	
	public int getTotal(Criteria cri);

	public int getTotalSearch(@Param("cri")Criteria cri,@Param("dep") String dep,@Param("arr") String arr,@Param("time") String time);
	

}
