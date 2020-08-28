package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dto.Members;

@Controller
@RequestMapping("user/*")
public class UserController {
	
	
	@RequestMapping(value = "user/logout", method = RequestMethod.GET)
	public String logout(HttpSession session,HttpServletResponse res) throws Exception {
		
		session.invalidate();
		
		return "user/login";
	}
	
	@RequestMapping(value = "user/login", method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}

	@RequestMapping(value = "user/signUp", method = RequestMethod.GET)
	public ModelAndView signUp() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}

}