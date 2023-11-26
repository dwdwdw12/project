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
public class FlightVO {
	private int fno;
	private String flightName;
	private String depDay;
	private String arrDay;
	private String fullDeptime;
	private String depTime;
	private String fullArrtime;
	private String arrTime;
	private String flihgtTime;
	private String fullDepartue;
	private String depCode;
	private String depName;
	private String fullArrival;
	private String arrCode;
	private String arrName;
	private String depRegioncode;
	private String arrRegioncode;
	private String ageGroup; //나이구간
	private float ageDiscountRate; //나이구간 추가
}
