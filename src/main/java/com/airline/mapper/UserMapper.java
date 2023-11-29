package com.airline.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import com.airline.vo.BoardDiaryVO;
import com.airline.vo.KakaoUserVO;
import com.airline.vo.PointVO;
import com.airline.vo.UserPayVO;

@Component
public interface UserMapper {
	
	public KakaoUserVO getUser(String userId);

	public String getGrade(int gradeCode);

	public UserPayVO getPoint(String userid);

	public int getSumP(String userid);

	public List<UserPayVO> getPoint3(String userid);

	public int getSumK(String userid);

	public List<PointVO> getKakao3(String userid);
	
	public List<BoardDiaryVO> getDiary(String userid);
	

}
