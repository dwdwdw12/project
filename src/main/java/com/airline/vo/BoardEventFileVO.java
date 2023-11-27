package com.airline.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*create table boardEventFile(
    fileNum int auto_increment primary key,
    boardNum int,
    oriFileName varchar(2000), 
    savedFileName varchar(2000),
    extension varchar(10),
    repImgYn varchar(1),
    fileSize int,
    fileOrder varchar(50) DEFAULT 'uploadFile01',
    constraint fk_Evnet_file_boardNum foreign key(boardNum) references boardEvent(boardNum) on delete cascade
);*/

@Getter @Setter @ToString
public class BoardEventFileVO {
	private int fileNum;
	private int boardNum;
	private String oriFileName;
	private String savedFileName;
	private String extension;
	private String repImgYn;
	private int fileSize;
	private String fileOrder;
}
