package com.hfsc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import org.springframework.web.servlet.view.RedirectView;
import com.hfsc.service.impl.UserServiceImpl;
import com.hfsc.model.User;
import com.hfsc.service.UserService;
import com.hfsc.until.DBUntil;

@Controller
@RequestMapping("/register.do")
public class RegisterController extends AbstractController {

	
	
	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String stuId = request.getParameter("stu-id");
		String stuName = request.getParameter("stu-name");
		User user = new User();
		DBUntil db = new DBUntil();
		//Long mid = db.mid;
		long id = Integer.parseInt(stuId);
		user.setId(id);
		user.setUserName(username);
        user.setPassword(password);
        
        UserService userService = new UserServiceImpl();
        
        userService.insertUser(user);
		ModelAndView mav = new ModelAndView(new RedirectView("login.jsp"));
		return mav;
	}
}
