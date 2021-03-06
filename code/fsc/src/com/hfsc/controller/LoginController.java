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
import org.springframework.web.servlet.mvc.AbstractController;
import org.springframework.web.servlet.view.RedirectView;


import com.hfsc.model.Session;
import com.hfsc.model.User;
import com.hfsc.service.UserService;
import com.hfsc.service.impl.UserServiceImpl;


@Controller

public class LoginController {
	@RequestMapping("/login.do")
	protected ModelAndView handleRequestInternal(HttpServletRequest request
			, HttpServletResponse response,HttpSession session) throws Exception {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		User user = new User();
		UserService userService = new UserServiceImpl();
		user.setUser_name(username);
		user = userService.queryUserByName(username);
		ModelAndView mav = new ModelAndView();
			
			if(password.equals(user.getPassword())){
				
				/*Cookie cookie = new Cookie("name","value");
				//cookie.setMaxAge(1800);
				//cookie.setPath("/");
				response.addCookie(cookie);
				List<User> nnlist1 = new ArrayList<User>();
				nnlist1 = userService.queryRole(user);
				Cookie cookie1 = new Cookie("role_name",nnlist1.get(0).getRole_name());
				response.addCookie(cookie1);*/
				
				//session创建
				Session ss = new Session();
				ss.setUser_name(user.getUserName());
				List<User> nnlist = new ArrayList<User>();
				nnlist = userService.queryRole(user);
				//System.out.println(nnlist.get(0).getRole_name());
				ss.setRole_name(nnlist.get(0).getRole_name());//身份设置
				nnlist = userService.queryResource(ss.getRole_name());
				//System.out.println(nnlist.get(0).getResource_name());
				ss.setResource(Integer.parseInt(nnlist.get(0).getResource_name() ));//权限设置
				//老师身份插入Class_id和Subject_name
				if(ss.getRole_name().equals("teacher")){
					List<Session> list = new ArrayList<Session>();
					list = userService.queryClass_id(ss.getUser_name());
					ss.setClass_id(list.get(0).getClass_id());
					list = userService.querySubject_name(ss.getUser_name());
					ss.setSubject_name(list.get(0).getSubject_name());
				}
				//学生身份插入Class_id
				if(ss.getRole_name().equals("student")){
					List<Session> list = new ArrayList<Session>();
					list = userService.queryClass_idByStu(ss.getUser_name());
					ss.setClass_id(list.get(0).getClass_id());
					list = userService.queryStu_idByStu_name(ss.getUser_name());
					ss.setStudent_id(list.get(0).getStudent_id());
				}
				//家长身份插入Student_id，学生的Class_id
				if(ss.getRole_name().equals("parent")){
					List<Session> list = new ArrayList<Session>();
					list = userService.queryStu_idByParent(ss.getUser_name());
					ss.setStudent_id(list.get(0).getStudent_id());
					list = userService.queryStu_name(ss.getStudent_id());
					ss.setStudent_name(list.get(0).getStudent_name());
					list = userService.queryClass_idByStu_id(ss.getStudent_id());
					ss.setClass_id(list.get(0).getClass_id());
					
				}
				
				
				
				
				
				
				session.setAttribute("sessiontest", ss);
				//session.setMaxInactiveInterval(-1); 
			
				mav = new ModelAndView(new RedirectView("school.jsp"));
				return mav;
				
			}
			else{
				return new ModelAndView("login","info","用户名不存在或密码错误");
			}
	
	}

}
