package com.airline.mapper;

import org.springframework.stereotype.Component;

import com.airline.vo.KakaoUserVO;

@Component
public interface UserMapper {
	
	public KakaoUserVO getUser(String userId);
	

}
