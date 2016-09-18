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
import com.hfsc.service.impl.UserServiceImpl;
import com.hfsc.model.Session;
import com.hfsc.model.User;
import com.hfsc.service.UserService;

@Controller
@RequestMapping("/register.do")
public class RegisterController extends AbstractController {

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String stuId = request.getParameter("stu-id");
		String stuName = request.getParameter("stu-name");
		User user = new User();
		UserService userService = new UserServiceImpl();
		/*
		 * Long newid = userService.getNowId(user); user.setId(newid+1);
		 */
		user.setUserName(username);
		user.setPassword(password);

		if (stuId != "") {
			List<Session> nnlist = new ArrayList<Session>();
			if (userService.queryStu_name(Integer.parseInt(stuId)).size()!=0) {
				nnlist = userService.queryStu_name(Integer.parseInt(stuId));

				String stu_name = nnlist.get(0).getStudent_name();

				if (stu_name != "" && stu_name.equals(stuName)) {
					userService.insertUser(user);
					userService.insertParent(Integer.parseInt(stuId), username, password);
					int role=3;
					List<User> nlist = new ArrayList<User>();
					nlist = userService.queryUser_id(user.getUser_name());
					userService.insertUser_role((int) nlist.get(0).getUser_id(), role);
					ModelAndView mav = new ModelAndView(new RedirectView("login.jsp"));
					return mav;

				}

			}
			return new ModelAndView("login", "info", "学生信息错误，注册失败");
		}
		return new ModelAndView("login", "info", "学生信息错误，注册失败");

	}
}
