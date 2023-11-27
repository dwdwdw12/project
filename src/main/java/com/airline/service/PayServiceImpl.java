package com.airline.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airline.mapper.PayMapper;

@Service
public class PayServiceImpl implements PayService {

	@Autowired
	private PayMapper mapper;
	
	@Override
	public int chargePoint(String userid,int amount) {
		// TODO Auto-generated method stub
		return mapper.chargePoint(userid, amount);
	}

}
