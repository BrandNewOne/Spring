package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.cj.xdevapi.JsonArray;

import dto.Boards;
import dto.Criteria;
import dto.Members;
import dto.PageMaker;
import dto.Schedule;
import service.BoardService;
import service.UserService;

@Controller
@RequestMapping("view/*")
public class ViewController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	BoardService boardService;


//	@RequestMapping("view/a")
//	public ModelAndView a() throws Exception {
//		
//		System.out.println("들어옴");
//		
//		List<Members> result = userService.selectMember(); 
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("result",result);
//	
//		System.out.println(result);
//		
//		return mav;
//	}
	
	
	@RequestMapping(value = "view/home", method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest req, HttpServletResponse res, Object obj, Criteria cri) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = req.getSession();
		Members member = (Members)session.getAttribute("loginUser");
		
		//System.out.println(session.getId());
		//System.out.println(member);
		
		if(member == null) {
			res.sendRedirect("/prac4/user/login");
		}
		//게시글 조회
		List<Boards> boardList = boardService.boardList(cri);
		mav.addObject("boardList",boardList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardService.listCount());
		
		mav.addObject("pageMaker", pageMaker);
		
		//System.out.println("목록 : "+boardList);
		
		return mav;
	}
	
	@RequestMapping("view/calendar")
	@ResponseBody
	public ModelAndView calendar(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception {
		
		HttpSession session = req.getSession();
		Members member = (Members)session.getAttribute("loginUser");
		
		//System.out.println(session);
		//System.out.println(member);
		
		if(member == null) {
			res.sendRedirect("/prac4/user/login");
		}
		
		//System.out.println("들어옴");
		
		List<Schedule> result = userService.selectSchedule();  
		//List ex) "[{"title" : Conference, "start" : 2020-03-20, "end" : 2020-02-21}]"
		ModelAndView mav = new ModelAndView();
		mav.setViewName("view/calendar"); // 뷰의 이름
		mav.addObject("result",result);
		
		
		
		//System.out.println(result);
		
		
		return mav;
	}
	
	
	@RequestMapping("view/myCalendar")
	@ResponseBody
	public ModelAndView myCalendar(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception {
		
		HttpSession session = req.getSession();
		Members member = (Members)session.getAttribute("loginUser");
		
		if(member == null) {
			res.sendRedirect("/prac4/user/login");
		}
		
		//System.out.println("들어옴");
		//System.out.println(member.getId());
		
		List<Schedule> result = userService.selectMySchedule(member.getId());  
		//List ex) "[{"title" : Conference, "start" : 2020-03-20, "end" : 2020-02-21}]"
		ModelAndView mav = new ModelAndView();
		mav.setViewName("view/myCalendar"); // 뷰의 이름
		mav.addObject("result",result);
		
		
		return mav;
	}
	
	@RequestMapping("view/memberView")
	@ResponseBody
	public ModelAndView memberView(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	
}