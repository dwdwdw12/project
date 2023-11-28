package com.airline.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airline.mapper.JoinMapper;

@Service
public class JoinServiceImpl implements JoinService{

	@Autowired
	private JoinMapper join;
	
	@Override
	public String confirmEmail(String email) {
		return join.checkEmail(email);
	}

}
