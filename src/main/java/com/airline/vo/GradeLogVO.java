package com.airline.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class GradeLogVO {

		private int gno;
		private String userid;
		private Date updateDate;
		private int gradecode;
	
}
