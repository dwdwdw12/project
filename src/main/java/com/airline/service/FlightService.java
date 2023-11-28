package com.airline.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.airline.vo.Criteria;
import com.airline.vo.FlightResVO;
import com.airline.vo.FlightVO;
import com.airline.vo.KakaoUserVO;

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
	//유저 이름
	public String getUserName(String userid);
	//예약테이블 업데이트
	public int insertRes(Map<String, String> map);
	//구매테이블 업데이트
	public int insertPay(String rno, Integer total, long mileage);
	//구매횟수 조회
	public int getBuyCount(String userid);
	//총 구매금액 조회
	public int getTotalBuy(String userid);
	//현재 마일리지 조회
	public int getCurMileage(String userid);
	//로그 업데이트
	public int logUpdate(String userid, int flightCount, int flightSum, int userPoint);
	//업데이트를 위한 등급코드 가져오기
	public int getGradeCode(int flightSum);
	//user 테이블 등급 업데이트
	public int updateGrade(String userid, int getCode);
	//user 원래 등급
	public int getOriCode(String userid);
	//gradecode update 시 인서트
	public int insertGradeUpdate(String userid, int flightCount, int flightSum, int userPoint);
	//예약정보 가져오기
	public FlightResVO getResInfo(String rno);
	//카카오 유저테이블
	public KakaoUserVO getUserInfo(String userid);
}
