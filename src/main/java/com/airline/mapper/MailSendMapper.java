package com.airline.mapper;

import com.airline.vo.KakaoUserVO;

public interface MailSendMapper {

	public void updateMailKey(String email);
	public KakaoUserVO checkedMailKey(String mail_key);
}
