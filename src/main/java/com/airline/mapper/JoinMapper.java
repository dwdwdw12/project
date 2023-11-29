package com.airline.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.airline.vo.KakaoUserVO;

@Component
public interface JoinMapper {

	public String checkEmail(String email);
	public KakaoUserVO getUserId(@Param("email") String email, @Param("mail_key") String mail_key);
	public KakaoUserVO checkMember(@Param("userNameE") String userNameE, 
							@Param("userNameK") String userNameK, 
							@Param("gender") String gender, 
							@Param("userReginumFirst") int userReginumFirst, 
							@Param("userReginumLast") int userReginumLast);
	//parameter가 여러개면 명시해줘야함
}
