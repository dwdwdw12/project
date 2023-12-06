package com.airline.mapper;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.airline.mail.TempKey;
import com.airline.vo.KakaoUserVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class) 
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class JoinMapperTest {
 
	@Autowired
	private JoinMapper join;

	
	@Autowired
	private PasswordEncoder pwencoder;
	

	 
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

		KakaoUserVO vo = KakaoUserVO.builder()
				.userNameE("userchoi")
				.userNameK("최유저")
				.gender("M")
				.userReginumFirst(881231)
				.userReginumLast(1111111)
				.build();
		
		join.checkMember(vo);
	}
	
	@Test
	public void getTermsTest() {
		join.getTerms(1);
	}
	
	@Test
	public void insertMemberTest() {
//		KakaoUserVO vo = KakaoUserVO.builder()
//				.userId("kakaooo")
//				.userNick("test000")
//				.userNameK("테스트")
//				.userNameE("test")
//				.gender("F")
//				.pwd("test000")
//				.mail("dsdf1@nddver.com")
//				.phone("010-1111-1111")
//				.postCode(12345)
//				.address("수원시")
//				.userReginumFirst(800808)
//				.userReginumLast(2222222)
//				.build();
//		join.insertMember(vo);
	}


	@Test
	public void checkUserIdAndEmailTest() {
		
		String email = "1111111@naver.com";
		String userId = "hana111";
		
		join.checkUserIdAndEmail(userId, email);
	}
	
	@Test
	public void updatePwdByMailKeyTest() {
		String mail_key = new TempKey().getKey();
		String userId = "hana111";
		
		join.updatePwdByMailKey(userId, mail_key);
	}
	@Test
	public void registerAllTermsTest() {
		String userId = "test11";
		join.registerAllTerms(userId);
	}
	
	@Test
	public void bcryptTest() {//@ContextConfiguration에다가 security 추가 + @Autowired(PasswordEncoder) 추가함
		log.info(pwencoder.encode("test11!"));
	}
}
