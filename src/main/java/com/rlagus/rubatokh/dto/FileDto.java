package com.rlagus.rubatokh.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FileDto {

	private int filenum;				// 파일 고유번호(기본키-AI)
	private int forinum;				// 파일 첨부된 게시글 번호
	private String fileoriname;			// 첨부된 파일 원래 이름
	private String filename;			// 첨부된 파일의 랜덤으로 바뀐 이름
	private String fileextension;		// 첨부된 파일의 확장명
	private String fileurl;				// 첨부된 파일이 실제로 저장된 서버의 위치
}	
