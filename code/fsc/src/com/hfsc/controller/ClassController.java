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

import com.hfsc.model.Class;
import com.hfsc.model.Page;
import com.hfsc.service.ClassService;
import com.hfsc.service.impl.ClassServiceImpl;

import net.sf.json.JSONArray;

@Controller

public class ClassController {
	@RequestMapping("class.do")
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpSession httpsession)
			throws Exception {
		String type = request.getParameter("type");
		String class_id = request.getParameter("class_id");
		String class_num = request.getParameter("class_num");
		String grade = request.getParameter("grade");
		
		
		
		
		
		Page page = new Page();
		page.setPage(1);
		if ("add".equals(type)) {
			Class alass = new Class();
			alass.setClass_id(Integer.parseInt(class_id));
			alass.setClass_num(class_num);
			alass.setGrade(grade);
			
			ClassService classService = new ClassServiceImpl();
			classService.insertClass(alass);

			ModelAndView mav = new ModelAndView(new RedirectView("class.jsp"));
			return mav;
		}
		
		if ("delete".equals(type)) {
			Class alass = new Class();
			alass.setClass_id(Integer.parseInt(class_id));
			ClassService classService = new ClassServiceImpl();
			classService.deleteClass(alass.getClass_id());

			ModelAndView mav = new ModelAndView(new RedirectView("class.jsp"));
			return mav;
		}
		
		if ("query".equals(type)) {
			Class alass = new Class();
			ClassService classService = new ClassServiceImpl();
			System.out.println("ss");
			ModelAndView mav  = new ModelAndView();
			mav.setViewName("class"); 
			List<Class> nnlist = new ArrayList<Class>();
			nnlist = classService.queryClass(page);	
			JSONArray nulist = JSONArray.fromObject(nnlist);
			System.out.println(nulist);
			mav.addObject("class1",nulist );  
			
			
			return mav;
		}
		
		return null;
	}
}
