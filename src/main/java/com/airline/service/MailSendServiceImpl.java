package com.airline.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.airline.mail.MailHandler;
import com.airline.mail.TempKey;
import com.airline.mapper.MailSendMapper;
import com.airline.vo.KakaoUserVO;

@Service
public class MailSendServiceImpl implements MailSendService{

	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	private MailSendMapper mailMapper;

	@Override
	public void updateMailKey(String email) throws Exception {
		
		
	}


}
