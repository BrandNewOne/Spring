package controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dto.Members;
import dto.Schedule;
import service.UserService;

@Controller
@RequestMapping("jquery/*")
public class JqueryController {

	@Autowired
	UserService userService;

	@RequestMapping("jquery/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginUser");
		return "/prac4/user/login";
	}

	@RequestMapping(value = "jquery/login", method = RequestMethod.POST)
	@ResponseBody
	public int login(Members members, HttpSession session) {

//		System.out.println("들어옴");
//		System.out.println(members.getId());
//		System.out.println(members.getPw());

		int result = 0;
		String col = null;
		col = "id";
		Members idCheck = userService.getUserOne(members.getId(), col);
		if (idCheck == null) {
			result = 2;
		} else {
			if (members.getId().equals(idCheck.getId())) { // ID OK
				if (members.getPw().equals(idCheck.getPw())) { // PW OK
					session.setAttribute("loginUser", idCheck);
					System.out.println(idCheck);
					result = 3;
				} else {
					result = 2;
				}

			} else { // ID not OK
				result = 2;
			}
		}

		return result;
	}

	@RequestMapping(value = "jquery/signUp", method = RequestMethod.POST)
	@ResponseBody
	public int signUp(Members members) {
//		System.out.println("들어옴");
//		System.out.println(members.getId());
//		System.out.println(members.getPw());
		
		int result = 0;
		String col = null;

		col = "id";
		Members idCheck = userService.getUserOne(members.getId(), col);
		if (idCheck != null) {
			result = 2;
		}

		if (result < 2) {
			result = userService.userJoin(members);
		}

		return result;
	}
	
	@RequestMapping(value = "jquery/inputSchedule", method = RequestMethod.POST)
	@ResponseBody
	public int insertSchedule(Schedule schedule) {
		
//		System.out.println("들어옴");
//		System.out.println(schedule.getTitle());
//		System.out.println(schedule.getStart());
//		System.out.println(schedule.getEnd());
//		System.out.println(schedule.getId());
		
		
		userService.inputSchedule(schedule);
		
		int result = 0;
		return result;
	}
	
	
	
	@RequestMapping(value = "jquery/deleteSchedule", method = RequestMethod.POST)
	@ResponseBody
	public int deleteSchedule(Schedule schedule) {
		
//		System.out.println("들어옴");
//		System.out.println(schedule.getTitle());
		
		userService.deleteSchedule(schedule);
		
		int result = 0;
		return result;
	}
}