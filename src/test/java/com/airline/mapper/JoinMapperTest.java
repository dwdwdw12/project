package com.airline.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class) 
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class JoinMapperTest {

	@Autowired
	private JoinMapper join;
	
	@Test
	public void checkEmailtest() {
		join.checkEmail("user01@naver.com");
	}
	
	@Test
	public void getUserIdTest() {
		String email = "dbswjd4991@naver.com";
		String mail_key = "MPjgjx9Uys";
		join.getUserId(email, mail_key);
	}

	@Test
	public void checkMemberTest() {
		String userNameE = "userchoi";
		String userNameK = "최유저";
		String gender="M";
		int userReginumFirst = 881231;
		int userReginumLast = 1111111;
		
		join.checkMember(userNameE, userNameK, gender, userReginumFirst, userReginumLast);
	}
}
