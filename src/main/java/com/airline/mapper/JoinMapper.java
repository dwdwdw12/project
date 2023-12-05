package com.airline.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.airline.vo.KakaoUserVO;
import com.airline.vo.TermsVO;

@Component
public interface JoinMapper {

	public String checkEmail(String email);
	
	public String checkUserIdAndEmail(@Param("userId") String userId, @Param("email") String email);
	
	public void updatePwdByMailKey(@Param("userId") String userId, @Param("mail_key") String mail_key);
	
	public KakaoUserVO getUserId(@Param("email") String email, @Param("mail_key") String mail_key);
	
	public KakaoUserVO checkMember(KakaoUserVO vo);
/*
 * @Param("userNameE") String userNameE, 
							@Param("userNameK") String userNameK, 
							@Param("gender") String gender, 
							@Param("userReginumFirst") int userReginumFirst, 
							@Param("userReginumLast") int userReginumLast
 */
	public TermsVO getTerms(int termscode);
	
	//parameter가 여러개면 명시해줘야함	
	public void insertMember(@Param("userNameE") String userNameE, 
			@Param("userNameK") String userNameK, 
			@Param("gender") String gender, 
			@Param("userReginumFirst") int userReginumFirst, 
			@Param("userReginumLast") int userReginumLast,
			@Param("userId") String userId,
			@Param("userNick") String userNick,
			@Param("pwd") String pwd,
			@Param("mail") String mail,
			@Param("phone") String phone,
			@Param("postCode" ) int postCode, 
			@Param("address") String address);
	public KakaoUserVO insertkakaoMember(KakaoUserVO vo);
	
	public int userIdDuplicateCheck(String userId);
	public int userNickDuplicateCheck(String userNick);
	
	public KakaoUserVO kakaoLoginCheck(@Param("email") String email, @Param("userNameK") String userNameK);

	public void registerBasicTerms(String userId);
	public void registerAllTerms(String userId);

} 
