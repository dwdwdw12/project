package com.airline.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class CancelVO {
		private int cno;
		private String userid;
		private String resno;
		private int isCancel;
		private Date RequestTime;
		private Date CancelTime;
}
