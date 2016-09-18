package com.hfsc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import org.springframework.web.servlet.view.RedirectView;

import com.hfsc.model.User;
import com.hfsc.service.UserService;
import com.hfsc.service.impl.UserServiceImpl;
import com.hfsc.until.DBUntil;


@Controller
@RequestMapping("/login.do")
public class LoginController extends AbstractController{
	
	protected ModelAndView handleRequestInternal(HttpServletRequest request
			, HttpServletResponse response) throws Exception {
		System.out.println("daozhele1");

		String username = request.getParameter("userName");
		String password = request.getParameter("passWord");
		User user = new User();
		DBUntil db = new DBUntil();
		List<Object> param = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		System.out.println("daozhele");
		sql.append(" select User_password from user where 1=1 ");
		if(username != null){
			sql.append("and User_name = ");
			sql.append(username);
		}
		System.out.println(sql.toString());
		try {
			List<User> list = db.quseryInfo(sql.toString(), param, User.class);
			list.get(0).getPassword();
			System.out.println(list.get(0).getPassword());
			boolean b = password.equals(list.get(0));
			if(password.equals(list.get(0).getPassword())){
				ModelAndView mav = new ModelAndView(new RedirectView("index.jsp"));
				return mav;
				
			}
			else{
				ModelAndView mav = new ModelAndView(new RedirectView("hello.jsp"));
				return mav;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
       
        UserService userService = new UserServiceImpl();
        
        userService.insertUser(user);
        
        ModelAndView mav = new ModelAndView(new RedirectView("view/index.jsp"));
    	return mav;
		
	}
	


}
