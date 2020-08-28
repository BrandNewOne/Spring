package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

import dto.Boards;
import dto.Members;
import dto.Reply;
import service.BoardService;
import service.ReplyService;
import service.UserService;

@Controller
@RequestMapping("board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	ReplyService replyService;
	
	// 게시판 글 작성 화면
//	@RequestMapping(value = "board/writeView", method = RequestMethod.GET)
//	public void writeView() throws Exception{
//		logger.info("writeView");
//		
//	}
	
	@RequestMapping(value = "board/writeView", method = RequestMethod.GET)
	public ModelAndView writeView(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception {
		ModelAndView mav = new ModelAndView();
		
//		HttpSession session = req.getSession();
//		members member = (Members)session.getAttribute("loginUser");
		
//		mav.addObject("member",member);
		
		return mav;
	}

	// 게시판 글 작성
	@RequestMapping(value = "board/boardWrite", method = RequestMethod.POST)
	public String boardWrite(Boards boards) throws Exception{
		logger.info("write");
		boardService.boardWrite(boards);
		
		
		return "redirect:/view/home";
	}
	
	// 게시글 보기
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String boardRead(Boards boards, Model model) throws Exception{
		logger.info("boardRead");
			
		model.addAttribute("boardRead", boardService.boardRead(boards.getBno()));
		
		//댓글
		List<Reply> boardReply = replyService.boardReply(boards.getBno());
		model.addAttribute("boardReply", boardReply);
		return "board/readView";
	}
	
	// 게시판 수정뷰
	@RequestMapping(value = "/boardUpdateView", method = RequestMethod.POST)
	public String updateView(Boards boards, Model model) throws Exception{
		logger.info("updateView");
		
		model.addAttribute("boardUpdate", boardService.boardRead(boards.getBno()));
		//System.out.println("Update 들어옴 Bno : "+boards.getBno());
		return "board/reWriteView";
	}
	
	// 게시판 수정
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.POST)
	public String update(Boards boards) throws Exception{
		logger.info("update");
		
		boardService.boardUpdate(boards);
		
		return "redirect:/view/home";
	}
	
	// 게시판 삭제
	@RequestMapping(value = "/boardDelete", method = RequestMethod.POST)
	public String delete(Boards boards) throws Exception{
		logger.info("delete");
		
		//System.out.println("DELETE 들어옴 Bno : "+boards.getBno());
		boardService.boardDelete(boards.getBno());
		
		return "redirect:/view/home";
	}
		
		
}
