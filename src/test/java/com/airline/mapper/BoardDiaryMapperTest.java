package com.airline.mapper;

import org.junit.Test; 
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.airline.vo.BoardDiaryVO;
import com.airline.vo.Criteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/security-context.xml","file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class BoardDiaryMapperTest {
	
	@Autowired
	private BoardDiaryMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(board->log.info(board));
	}
	
	@Test
	public void testGetListwithPaging() {
		Criteria cri = new Criteria();
		cri.setPageNum(2);
		cri.setAmount(2);
		
		mapper.getListwithPaging(cri).forEach(board->log.info(board));
	}
	
	@Test
	public void testGet() {
		BoardDiaryVO vo = mapper.get(3);
		log.info("MemberVO : "+vo);
	}
	
	@Test
	public void testInsert() {
		BoardDiaryVO vo = new BoardDiaryVO();
		vo.setBoardTitle("test5");
		vo.setBoardContent("test content5");
		vo.setBoardWriter("유저01");
				
		int insert = mapper.insert(vo);
		log.info("insert result : " + insert);
	}
	
	@Test
	public void testUpdate() {
		BoardDiaryVO vo = new BoardDiaryVO();
		vo.setBoardTitle("test update1");
		vo.setBoardContent("test content update1");
		vo.setBoardNum(3);
		
		int result = mapper.update(vo);
		log.info("update result : " + result);
	}
	
	@Test
	public void testDelete() {
		int delete = mapper.delete(4);
		log.info("delete result : " + delete);
	}
	

}
