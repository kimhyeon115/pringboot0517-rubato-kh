package com.rlagus.rubatokh.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
		
		return "board_view";
	}
	
	@RequestMapping(value = "/board_writeOk")
	public String board_writeOk(HttpServletRequest request, Model model) {
		
		String bname = request.getParameter("bname");
		String btitle = request.getParameter("btitle");
		String bcontent = request.getParameter("bcontent");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.boardWriteDao(bname, btitle, bcontent, "정회원", 0);		
		
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
