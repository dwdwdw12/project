package com.airline.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;

import com.airline.vo.KakaoUserVO;

public interface MailSendService {

	public void updateMailKey(String email) throws Exception;
	
	
}
