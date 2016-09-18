package com.hfsc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class IndexController {
	@RequestMapping("logout.do")
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {
		
		session.invalidate();
		Cookie cookie = new Cookie("name", "value");
		cookie.setMaxAge(0);
			
		response.addCookie(cookie);
		ModelAndView mav = new ModelAndView("login");
		
		return mav;
	}
}
