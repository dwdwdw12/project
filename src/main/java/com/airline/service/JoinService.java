package com.airline.service;

import java.util.HashMap;

import com.airline.vo.KakaoUserVO;

public interface JoinService {

	public String confirmEmail(String email); //아이디찾기 시 이메일이 존재하는지 확인 
	public KakaoUserVO showUserId(String email, String mail_key); //아이디찾기 시 이메일을 기준으로 랜덤키 생성해서 컬럼에 저장
	public KakaoUserVO confirmMember(KakaoUserVO vo);
	//kakaouserVO로 받아서 vo를 반환하면 무조건 값이 생겨서 (null이여도 반환되므로..)
	
	public String getAccessToken(String authorize_code) throws Throwable;
	public HashMap<String, Object> getUserInfo(String access_Token) throws Throwable;
	public String getTerms(int termsCode);
	public void registerMember(KakaoUserVO vo);
	

}
 