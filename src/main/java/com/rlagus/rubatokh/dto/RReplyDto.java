package com.rlagus.rubatokh.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RReplyDto {

	private int rnum;			// 댓글 번호(기본키)
	private String rcontent;	// 댓글 내용
	private String rid;			// 댓글 유저 아이디
	private int rorinum;		// 원글의 게시번호
	private String rdate;		// 댓글 등록일
	
}
