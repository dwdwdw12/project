package com.airline.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FlightResVO {
	private String resno;
	private String userid;
	private String username;
	private String flightname;
	private String departure;
	private String arrival;
	private Date arrtime;
	private Date deptime;
	private Date purchasetime;
	private String seatid;
	private int ispaid;
	
}
