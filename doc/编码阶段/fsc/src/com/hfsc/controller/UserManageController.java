package com.hfsc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import org.springframework.web.servlet.view.RedirectView;
import com.hfsc.service.impl.UserServiceImpl;
import com.hfsc.model.User;
import com.hfsc.service.UserService;

@Controller
@RequestMapping("/usermanage.do")
public class UserManageController extends AbstractController {

  
  
  
  @Override
  protected ModelAndView handleRequestInternal(HttpServletRequest request,
      HttpServletResponse response) throws Exception {
	  String userid = request.getParameter("User_id");  
	  String type = request.getParameter("type");
	  String username = request.getParameter("User_name");
	  String password = request.getParameter("User_password");
	  UserService userService = new UserServiceImpl(); 
	  ModelAndView mav = new ModelAndView();
	  mav.setViewName("index"); 
		if("delete".equals(type)){
			userService.deleteUser(Long.valueOf(userid));
		}
		if("add".equals(type)) {
			User user = new User();
			user.setId(Long.valueOf(userid));
			user.setUserName(username);
	        user.setPassword(password);
	        userService.insertUser(user);
		}
		if("edit".equals(type)) {
			User user = new User();
			user.setId(Long.valueOf(userid));
			user.setUserName(username);
	        user.setPassword(password);
	        userService.updateUser(user);
		}
		if("query".equals(type)) {
			User user = new User();					
			if(null!= userid ){
				user = userService.queryUserByUserId(Long.parseLong(userid));
				mav.addObject("uu", user);
			}
			else {
				List<User> nlist = new ArrayList<User>();
				nlist = userService.queryUser(user);	 
				        mav.addObject("nlist", nlist);  								
			}
			
		}
    
    return mav;
  }
}
