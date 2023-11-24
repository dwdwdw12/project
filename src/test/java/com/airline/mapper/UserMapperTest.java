package com.airline.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.airline.vo.KakaoUserVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/security-context.xml","file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class UserMapperTest {
	
	@Autowired
	private UserMapper mapper;
	
	@Test
	public void getUserTest() {
		KakaoUserVO vo = mapper.getUser("admin");
		log.info(vo);
		vo.getAuthority().forEach(auth->log.info(auth));
	}
	
	/*
	 * @Test public void queryTest() { log.info(mapper.getq()); }
	 */

}
