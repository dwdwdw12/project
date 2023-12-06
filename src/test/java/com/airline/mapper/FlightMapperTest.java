package com.airline.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.airline.vo.Criteria;

import lombok.extern.log4j.Log4j;
 
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/security-context.xml","file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class FlightMapperTest {
	
	@Autowired
	private FlightMapper mapper;
	
	@Test
	public void getListTest() {
		 mapper.getList(new Criteria()).forEach(vo->log.info(vo));
	}
	
	@Test
	public void getSearchTest() {
		mapper.getListSearch(new Criteria(),"김포","제주", "2024-02-28")
		.forEach(vo->log.info(vo));
	}
	
	@Test
	public void getSearchByFlightNameTest() {
		mapper.getListSearchByFlightName(new Criteria(),"OZ8234", "2023-12-01")
		.forEach(vo->log.info(vo));
	}
	
	@Test
	public void getTotalSearchByFlightNameTest() {
		log.info(mapper.getTotalSearchByFlightName(new Criteria(),"OZ8234", "2023-12-01"));
	}
	
	@Test
	public void getRoundTripPriceTest() {
		log.info(mapper.getRoundTripPrice("홍콩", "인천"));
	}
	
	@Test
	public void getDistinctDepTest() {
//		List<String> list = mapper.getDistinctDep();
//		for(String str : list) {			
//			log.info(str);
//		}
	}
	
//	@Test
//	public void getDistinctArrByDepTest() {
//		List<String> list = mapper.getDistinctArrByDep("제주");
//		for(String str : list) {			
//			log.info(str);
//		}
//	}
	
	//검색어만 하는건 성공
	/*
	 * @Test public void getSearchTest2() { mapper.getListSearch2("인천","오사카",
	 * "2022-12-01") .forEach(vo->log.info(vo)); }
	 */
	

}
