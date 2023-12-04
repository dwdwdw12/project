package com.airline.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class PointVO {
	private int pno;
	private String userid;
	private int amount;
	private Date buyDate;
	private int sum;

}
