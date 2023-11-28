package com.airline.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class) 
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MailSendMapperTest {

	@Autowired
	private MailSendMapper mailMapper;
	
	@Test
	public void updateMailKeytest() {
		String email = "dbswjd4991@naver.com";
		mailMapper.updateMailKey(email);
	}

}
