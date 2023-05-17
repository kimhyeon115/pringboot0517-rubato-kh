package com.rlagus.rubatokh.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RFboardDto {

	private int bnum;			// 글번호(기본키)
	private String bname;		// 글쓴이 이름
	private String btitle;		// 제목
	private String bcontent;	// 내용
	private int bhit;			// 조회수
	private String buserid;		// 글쓴이 아이디
	private int breplycount;	// 댓글수
	private String bdate;		// 등록일
	private int bfilecount;		// 첨부파일수
	
}
