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

	//항공정보
	public FlightVO getFlightInfo(int fno);

	//가격구간 검색
	public int getPrice(String depName, String arrName);

	//유저나이 검색
	public int getUserAge(String userid);

	//나이별 할인율 검색
	public float getAgeDiscount(int age);

	//카카오포인트 검색	
	public int getKakaoPoint(String userid);

	//마일리지 검색
	public int getPoint(String userid);
	//마일리지 검색을 위한 null 체크
	public int getcount(String userid);
	//카카오포인트 검색을 위한 null 체크
	public int getKcount(String userid);
	//좌석별 가격구간
	public float getSeatPc(String seat);
	//유저 이메일
	public String getEmail(String userid);

	public String getUserName(String userid);
}
