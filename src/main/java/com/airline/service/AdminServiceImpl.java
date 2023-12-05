package com.airline.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airline.mapper.AdminMapper;
import com.airline.vo.BoardEventVO;
import com.airline.vo.BoardNoticeVO;
import com.airline.vo.CancelVO;
import com.airline.vo.Criteria;
import com.airline.vo.FlightResVO;
import com.airline.vo.KakaoUserVO;
import com.airline.vo.UserPayVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminMapper mapper;

	@Override
	public List<CancelVO> getCancelList(Criteria cri) {
		return mapper.getCancelList(cri);
	}

	@Override
	public int getCancelCtn(Criteria cri) {
		return mapper.getCancelCnt(cri);
	}

	@Override
	public List<FlightResVO> getResInfo(Criteria cri) {
		return mapper.getResInfo(cri);
	}

	@Override
	public UserPayVO getPayInfo(String resno) {
		return mapper.getPayInfo(resno);
	}

	@Override
	public int updatePrice(String resno, int price, int mileage) {
		return mapper.updatePrice(resno,price,mileage);
	}

	@Override
	public int sumMile(String userid) {
		return mapper.sumMile(userid);
	}

	@Override
	public int sumPrice(String userid) {
		return mapper.sumPrice(userid);
	}

	@Override
	public int insertlog(String userid, int sumMile, int sumPrice) {
		return mapper.insertlog(userid, sumMile, sumPrice);
	}

	@Override
	public void updateCancel(String resno) {
		mapper.updateCancel(resno);
		
	}

	@Override
	public int getTicketCnt(Criteria cri) {
		return mapper.getTicketCnt(cri);
	}

	@Override
	public List<KakaoUserVO> getUserInfo(Criteria cri) {
		return mapper.getUserInfo(cri);
	}

	@Override
	public int getUserCnt(Criteria cri) {
		return mapper.getUserCnt(cri);
	}

	@Override
	public int updateUserInfo1(String userid) {
		return mapper.updateUserInfo1(userid);
	}

	@Override
	public int updateUserInfo0(String userid) {
		return mapper.updateUserInfo0(userid);
	}

	@Override
	public List<BoardNoticeVO> getNotice(Criteria cri) {
		return mapper.getNotice(cri);
	}

	@Override
	public int noticeCnt(Criteria cri) {
		return mapper.noticeCnt(cri);
	}

	@Override
	public int deleteNotice(int boardnum) {
		return mapper.deleteNotice(boardnum);
	}

	@Override
	public List<BoardEventVO> getEvent(Criteria cri) {
		return mapper.getEvent(cri);
	}

	@Override
	public int eventCtn(Criteria cri) {
		return mapper.eventCtn(cri);
	}

}
