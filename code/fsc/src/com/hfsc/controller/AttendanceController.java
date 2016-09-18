package com.hfsc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import com.hfsc.model.Attendance;
import com.hfsc.model.Page;
import com.hfsc.service.AttendanceService;
import com.hfsc.service.impl.AttendanceServiceImpl;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("attendance.do")
public class AttendanceController extends AbstractController{
	 
	protected ModelAndView handleRequestInternal(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String studentname = request.getParameter("Student_name");
		Attendance attendance = new Attendance();
		attendance.setStudent_name(studentname);
		
		Page page = new Page();
		page.setPage(1);
		
		AttendanceService attendanceService = new AttendanceServiceImpl();
		List<Attendance> nnlist = new ArrayList<Attendance>();
		nnlist = attendanceService.queryAttendance(attendance.getStudent_name(),page);
		JSONArray nulist = JSONArray.fromObject(nnlist);
		
		System.out.println(nulist);
		
		ModelAndView mav = new ModelAndView(new MappingJacksonJsonView());
		mav.addObject("attendance1",nulist );
		return mav;
	}
}
