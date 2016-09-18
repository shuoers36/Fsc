package com.hfsc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import com.hfsc.model.Page;
import com.hfsc.model.Score;
import com.hfsc.service.ScoreService;
import com.hfsc.service.impl.ScoreServiceImpl;

import net.sf.json.JSONArray;

@Controller

public class ScoreController {
	@RequestMapping("score.do")
	protected ModelAndView handleRequestInternal(HttpServletRequest request,HttpSession session)throws Exception{
		String Student_id = request.getParameter("Student_id");
		Page page = new Page();
		page.setPage(1);
		Score score = new Score();
		score.setStudent_id(Integer.parseInt(Student_id));
		session.setAttribute("test", score);
		ScoreService scoreService = new ScoreServiceImpl();
		List<Score> nnlist = new ArrayList<Score>();
		nnlist = scoreService.queryScore(score.getStudent_id(),page);		
		JSONArray nulist = JSONArray.fromObject(nnlist);
		System.out.println( session.getAttribute("test"));
		ModelAndView mav = new ModelAndView();
		mav.setViewName("stu-score"); 
		mav.addObject("score1",nulist );
		return mav;
	}
	/*@RequestMapping(value = "score.do",method = RequestMethod.GET)
	public String logout(HttpSession httpSession){
		httpSession.getAttribute("test");
		return "success";
	}*/
	@RequestMapping("scoreByTeacher.do")
	protected ModelAndView TeacherhandleRequestInternal(HttpServletRequest request,HttpSession session)throws Exception{
		String Class_id = request.getParameter("Class_id");
		String Subject_name = request.getParameter("Subject_name");
		int class_id = Integer.parseInt(Class_id);
		String page1 = request.getParameter("page");
		Page page = new Page();
		page.setPage(Integer.parseInt(page1));
	/*	Score score = new Score();
		score.setStudent_id(1);
		session.setAttribute("test", score);*/
		
		ScoreService scoreService = new ScoreServiceImpl();
		List<Score> nnlist = new ArrayList<Score>();
		
		nnlist = scoreService.queryScoreByTeacher(class_id, Subject_name, page);	
		
		JSONArray nulist = JSONArray.fromObject(nnlist);
		System.out.println( nulist);
		ModelAndView mav = new ModelAndView("score");
		mav.addObject("score2",nulist );
		return mav;
	}
}
