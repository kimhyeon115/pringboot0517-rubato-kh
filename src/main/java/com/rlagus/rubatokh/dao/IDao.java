package com.rlagus.rubatokh.dao;

import java.util.List;

import com.rlagus.rubatokh.dto.FileDto;
import com.rlagus.rubatokh.dto.RFboardDto;
import com.rlagus.rubatokh.dto.RReplyDto;

public interface IDao {
	
	// 게시판 기본 기능
	public int boardWriteDao(String bname, String btitle, String bcontent, String buserid, int filecount);
	public int boardTotalCountDao();								// 게시판 총 게시글 개수
	public List<RFboardDto> boardListDao();							// 게시판 모든 글 가져오기
	public RFboardDto boardContentViewDao(String bnum);				// 클릭한 게시글 내용 가져오기
	public void boardHitDao(String bnum);							// 조회수 증가
	public void boardContentDeleteDao(String bnum);					// 게시판 글 삭제
	
	// 게시판 검색 기능
	public List<RFboardDto> boardSearchTitleDao(String keyword);	// 게시판 제목에서 검색
	public List<RFboardDto> boardSearchContentDao(String keyword);	// 게시판 내용에서 검색
	public List<RFboardDto> boardSearchWriterDao(String keyword);	// 게시판 글쓴이로 검색
	
	// 댓글 기능
	public void replyWriteDao(String rcontent, String rorinum);		// 댓글 입력
	public void replyCountDao(String rorinum);						// 댓글 수 카운트(추가시)
	public List<RReplyDto> replyListDao(String rorinum);			// 해당 원글에 달린 댓글의 리스트 가져오기
	public void replyDeleteDao(String rnum);						// 선택된 댓글 삭제
	public void replyDeleteCountDao(int rnum);						// 원글의 댓글 개수(삭제시)
	public void replysDeleteDao(String rorinum);					// 원글 삭제시 해당 댓글 전부 삭제
	
	// 파일 관련 기능
	public void fileInfoCreateDao(int forinum, String fileoriname, String filename, String fileextension, String fileurl);
	public FileDto getFileInfoDao(String forinum);					// 파일이 첨부된 글의 번호로 검색하여 파일정보 가져오기
}
