package com.airline.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Component
public interface PayMapper {

	public int chargePoint(@Param("userid")String userid,@Param("amount") int amount);

}
