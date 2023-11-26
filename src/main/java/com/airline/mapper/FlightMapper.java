package com.airline.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.airline.vo.Criteria;
import com.airline.vo.FlightVO;
import com.airline.vo.KakaoUserVO;

@Component
public interface FlightMapper {

	public List<FlightVO> getList(Criteria cri);
	
	public List<FlightVO> getListSearch(@Param("cri")Criteria cri,@Param("dep") String dep,@Param("arr") String arr,@Param("time") String time);

	//public List<FlightVO> getListSearch2(@Param("dep") String dep,@Param("arr") String arr,@Param("time") String time);
	
	public int getTotal(Criteria cri);

	public int getTotalSearch(@Param("cri")Criteria cri,@Param("dep") String dep,@Param("arr") String arr,@Param("time") String time);

	public FlightVO getFlightInfo(int fno);

	public int getPrice(@Param("depname")String depName,@Param("arrname") String arrName);

	public int getUserAge(String userid);

	public float getAgeDiscount(@Param("age")int age);

	public int getKakaoPoint(String userid);

	public int getPoint(String userid);

	public int getCount(String userid);
	

}
