package com.hfsc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;
import com.hfsc.until.DBUntil;
import com.hfsc.service.impl.UserServiceImpl;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.hfsc.model.User;
import com.hfsc.model.Page;
import com.hfsc.model.Session;
import com.hfsc.service.UserService;

@Controller
@RequestMapping("/usermanage.do")
public class UserManageController extends AbstractController {
	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String userid = request.getParameter("User_id");
		String type = request.getParameter("type");
		String page = request.getParameter("page");
		String subject_name =request.getParameter("Subject-name");
		String role_name = request.getParameter("role");
		System.out.println(role_name);
		role_name = "teacher";
		int role ;
		String class_id = request.getParameter("Class-id");
		System.out.println(class_id);
		
		String username = request.getParameter("User_name");
		String password = request.getParameter("User_password");
		UserService userService = new UserServiceImpl();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userManage");
		if ("delete".equals(type)) {
			userService.deleteUser(Long.valueOf(userid));
		}
		if ("add".equals(type)) {
			User user = new User();
			user.setUserName(username);
			user.setPassword(password);
			userService.insertUser(user);
			if (role_name == "leader") {
				userService.insertLeader(user);
				role=5;
				List<User> nlist = new ArrayList<User>();
				nlist = userService.queryUser_id(user.getUser_name());
				userService.insertUser_role((int) nlist.get(0).getUser_id(), role);
				
			}
			if (role_name == "teacher") {
				role=1;
				List<User> nlist = new ArrayList<User>();
				nlist = userService.queryUser_id(user.getUser_name());
				userService.insertUser_role((int) nlist.get(0).getUser_id(), role);
				int Class_id =Integer.parseInt(class_id);
				userService.insertTeacher(user, Class_id);
				List<Session> slist = new ArrayList<Session>();
				slist = userService.queryTeacher_id(user.getUser_name());
				
				userService.insertTeacher_subject(slist.get(0).getTeacher_id(), subject_name);
				
			}
			if (role_name == "student") {
				role=2;
				List<User> nlist = new ArrayList<User>();
				nlist = userService.queryUser_id(user.getUser_name());
				userService.insertUser_role((int) nlist.get(0).getUser_id(), role);
				int Class_id =Integer.parseInt(class_id);
				userService.insertStudent(user, Class_id);
			}

		}
		if ("edit".equals(type)) {
			User user = new User();
			user.setId(Long.valueOf(userid));
			user.setUserName(username);
			user.setPassword(password);
			userService.updateUser(user);
		}
		if ("query".equals(type)) {
			User user = new User();
			if (null != username) {
				user = userService.queryUserByName(username);
				JSONObject result = new JSONObject();
				result = JSONObject.fromObject(user);
				mav = new ModelAndView(new MappingJacksonJsonView());
				mav.addObject("uu", result);
			} else {
				Page npage = new Page();
				npage.setPage(Integer.parseInt(page));
				List<User> nlist = new ArrayList<User>();
				nlist = userService.queryUser(user, npage);
				JSONArray nulist = JSONArray.fromObject(nlist);
				mav.addObject("nulist", nulist);
				System.out.println(nulist);
			}

		}

		return mav;
	}
}
