package com.hfsc.controller;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import org.springframework.web.servlet.view.RedirectView;

import com.hfsc.model.Homework;
import com.hfsc.model.Page;
import com.hfsc.model.Activity;
import com.hfsc.service.HomeworkService;
import com.hfsc.service.impl.HomeworkServiceImpl;

import net.sf.json.JSONArray;

@Controller

public class HomeworkController {
	@RequestMapping("homework.do")
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpSession httpsession)
			throws Exception {
		String type = request.getParameter("type");
		String homework_id = request.getParameter("homework_id");
		String subject_name = request.getParameter("subject_name");
		String class_id = request.getParameter("class_id");
		String homework_content = request.getParameter("homework_content");
		
		
		
		
		
		Page page = new Page();
		page.setPage(1);
		if ("add".equals(type)) {
			Homework homework = new Homework();
			homework.setSubject_name(subject_name);
			homework.setClass_id(Integer.parseInt(class_id));
			homework.setHomework_content(homework_content);
			DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	        String datenow = sdf.format(new Date());  
	        homework.setHomework_time(datenow);
			
			HomeworkService homeworkService = new HomeworkServiceImpl();
			homeworkService.insertHomework(homework);

			ModelAndView mav = new ModelAndView(new RedirectView("homework.jsp"));
			return mav;
		}
		if ("edit".equals(type)) {
			Homework homework = new Homework();
			homework.setHomework_id(Integer.parseInt(homework_id));
			homework.setHomework_content(homework_content);
			HomeworkService homeworkService = new HomeworkServiceImpl();
			homeworkService.changeHomework(homework);

			ModelAndView mav = new ModelAndView(new RedirectView("homework.jsp"));
			return mav;
		}
		if ("delete".equals(type)) {
			System.out.println("ss");
			Homework homework = new Homework();
			homework.setHomework_id(Integer.parseInt(homework_id));
			HomeworkService homeworkService = new HomeworkServiceImpl();
			homeworkService.deleteHomework(homework.getHomework_id());

			ModelAndView mav = new ModelAndView(new RedirectView("homework.jsp"));
			return mav;
		}
		
		if ("querystu".equals(type)) {
			Homework homework = new Homework();
			homework.setClass_id(Integer.parseInt(class_id));
			HomeworkService homeworkService = new HomeworkServiceImpl();
			
			ModelAndView mav  = new ModelAndView();
			mav.setViewName("stu-homework"); 
			List<Homework> nnlist = new ArrayList<Homework>();
			nnlist = homeworkService.queryHomework(homework.getClass_id(),page);	
			JSONArray nulist = JSONArray.fromObject(nnlist);
			System.out.println(nulist);
			mav.addObject("homework1",nulist );  
			
			
			return mav;
		}
		if ("queryteacher".equals(type)) {
			Homework homework = new Homework();
			homework.setSubject_name(subject_name);
			HomeworkService homeworkService = new HomeworkServiceImpl();
			
			ModelAndView mav  = new ModelAndView();

			
			List<Homework> nnlist = new ArrayList<Homework>();
			nnlist = homeworkService.queryHomeworkByTeacher(homework.getSubject_name(), page);
			JSONArray nulist = JSONArray.fromObject(nnlist);
			System.out.println(nulist);
			mav.addObject("homework2",nulist );  
			
			
			
			return mav;
		}
		return null;
	}
}
