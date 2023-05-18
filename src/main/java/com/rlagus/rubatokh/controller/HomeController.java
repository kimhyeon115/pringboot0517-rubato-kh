package com.rlagus.rubatokh.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.yaml.snakeyaml.events.Event.ID;

import com.rlagus.rubatokh.dao.IDao;
import com.rlagus.rubatokh.dto.RFboardDto;

@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/index")
	public String index() {
		return "index";
	}
	
	@RequestMapping(value = "/board_list")
	public String board_list(Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);		
				
		model.addAttribute("list", dao.boardListDao());
		model.addAttribute("totalCount", dao.boardTotalCountDao());	
		
		return "board_list";
	}
	
	@RequestMapping(value = "/board_write")
	public String board_write() {
		return "board_write";
	}
	
	@RequestMapping(value = "/board_view")
	public String board_view(HttpServletRequest request, Model model) {	
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.boardHitDao(request.getParameter("bnum"));
		
		model.addAttribute("boardDto", dao.boardContentViewDao(request.getParameter("bnum")));
		
		model.addAttribute("replyList", dao.replyListDao(request.getParameter("bnum")));
		
		model.addAttribute("fileDto", dao.getFileInfoDao(request.getParameter("bnum")));		
		
		return "board_view";
	}
	
	@RequestMapping(value = "/board_writeOk")				// 파일 첨부시 받을 전용 객체(어너테이션 에서)
	public String board_writeOk(HttpServletRequest request, @RequestPart MultipartFile files) throws IllegalStateException, IOException {
		
		String bname = request.getParameter("bname");
		String btitle = request.getParameter("btitle");
		String bcontent = request.getParameter("bcontent");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		if(files.isEmpty()) {												// true면 파일이 첨부 않함
			dao.boardWriteDao(bname, btitle, bcontent, "정회원", 0);			// 파일 첨부 없이 글 작성
		} else {															// 파일이 첨부된 경우
			dao.boardWriteDao(bname, btitle, bcontent, "정회원", 1);			// 파일이 첨부된 글 작성
			List<RFboardDto> boardList = dao.boardListDao();				// 모든 글 목록 가져오기
			RFboardDto boardDto = boardList.get(0);							// 방금 쓴글 모든 정보
			int forinum = boardDto.getBnum();								// 파일이 첨부된 글 번호
			
			// 파일 첨부관련 코드
			String fileoriname = files.getOriginalFilename();				// 첨부된 파일의 원래 이름
			String fileextension = FilenameUtils.getExtension(fileoriname).toLowerCase();
									// 파일첨부 의존설정후 사용가능 메소드(확장자 소문자로 변경)
			File destinationFile;
			String destinationFileName;					// 실제 서버에 저장된 파일의 변경된 이름이 저장될 변수
			String fileurl="D:/springboot-workspace/springboot0517-rubato-kh/src/main/resources/static/uploadfiles/";
			// 첨부된 파일이 저장될 서버의 실제 폴더의 경로 (문자열 url 마지막 / 닫아야함)
			
			do {
			destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileextension;
								// 파일첨부 의존설정후 사용가능 메소드 (랜덤으로 32자리 문자+숫자로 구성한 파일명 생성)
			destinationFile = new File(fileurl+destinationFileName);
			} while(destinationFile.exists());								// 같은 파일이름이 존재하는지 확인
			
			// <파일 처리시에는 에러발생 가능성 아주높음 예외처리 필수>
			destinationFile.getParentFile().mkdir();
			files.transferTo(destinationFile);	// 업로드된 첨부 파일이 지정한 폴더로 이동
			
			dao.fileInfoCreateDao(forinum, fileoriname, destinationFileName, fileextension, fileurl);
		}
		
		return "redirect:board_list";
	}
	
	@RequestMapping(value = "/search_list")
	public String search_list(HttpServletRequest request, Model model) {
		
		String searchOption = request.getParameter("searchOption");
		String keyword = request.getParameter("keyword");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		if(searchOption.equals("title")) {
			model.addAttribute("list", dao.boardSearchTitleDao(keyword));
			model.addAttribute("totalCount", dao.boardSearchTitleDao(keyword).size());	// .size() 리스트의 개수를 활용
		} else if(searchOption.equals("content")) {
			model.addAttribute("list", dao.boardSearchContentDao(keyword));
			model.addAttribute("totalCount", dao.boardSearchContentDao(keyword).size());
		} else {
			model.addAttribute("list", dao.boardSearchWriterDao(keyword));
			model.addAttribute("totalCount", dao.boardSearchWriterDao(keyword).size());
		}
		
		return "board_list";
	}
	
	@RequestMapping(value = "/reply_write")
	public String reply_write(HttpServletRequest request, Model model) {
		
		String rcontent = request.getParameter("rcontent");
		String rorinum = request.getParameter("rorinum");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.replyWriteDao(rcontent, rorinum);
		dao.replyCountDao(rorinum);
		
		model.addAttribute("boardDto", dao.boardContentViewDao(request.getParameter("rorinum")));
		model.addAttribute("replyList", dao.replyListDao(request.getParameter("rorinum")));
		
		return "board_view";
	}
	
	@RequestMapping(value = "/replyDelete")
	public String replyDelete(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);		
		dao.replyDeleteDao(request.getParameter("rnum"));
		dao.replyDeleteCountDao(Integer.parseInt(request.getParameter("bnum")));
		
		model.addAttribute("boardDto", dao.boardContentViewDao(request.getParameter("bnum")));
		model.addAttribute("replyList", dao.replyListDao(request.getParameter("bnum")));
		
		return "board_view";
	}
	
	@RequestMapping(value = "/boar_delete")
	public String board_delete(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.boardContentDeleteDao(request.getParameter("bnum"));
		
		return "redirect:board_list";
	}
}
