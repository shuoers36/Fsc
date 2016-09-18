package com.hfsc.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import com.hfsc.model.Activity;
import com.hfsc.model.Page;
import com.hfsc.model.Session;
//import com.hfsc.model.Session;
import com.hfsc.service.ActivityService;
import com.hfsc.service.impl.ActivityServiceImpl;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller

public class ActivityController {
	@RequestMapping("activity.do")
	
	protected ModelAndView handleRequestInternal(HttpServletRequest request,HttpSession httpsession)
			throws Exception {
		
		//String activity_id = "1";//
		String activity_id = request.getParameter("activity_id");
		System.out.println(activity_id+"-----");
		String activity_name = request.getParameter("activity_name");
		String activity_content = request.getParameter("activity_content");
		String class_id = request.getParameter("class_id");
		System.out.println(class_id+"--");
		String type = request.getParameter("type");
		String page1 = request.getParameter("page");
		Page page = new Page();
		page.setPage(1);
		
		/*if ("add".equals(type)) {
			Activity activity = new Activity();
			activity.setActivity_id(Integer.parseInt(activity_id));
			activity.setActivity_name(activity_name);
			activity.setActivity_content(activity_content);
			activity.setClass_id(Integer.parseInt(class_id));
			DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	        String datenow = sdf.format(new Date());  
			activity.setActivity_time(datenow);
			
			Session session = new Session();
			//session.setRole_name(activity.getActivity_name());
			
			httpsession.setAttribute("test", session);
			
			
			ActivityService activityService = new ActivityServiceImpl();
			activityService.insertActivity(activity);
			
			
			System.out.println( httpsession.getAttribute("test")+"activity");

			ModelAndView mav = new ModelAndView(new RedirectView("activity.jsp"));
			return mav;
		}*/
		if ("edit".equals(type)) {
			Activity activity = new Activity();
			activity.setActivity_id(Integer.parseInt(activity_id));
			activity.setActivity_content(activity_content);
			ActivityService activityService = new ActivityServiceImpl();
			activityService.changeActivity(activity);

			ModelAndView mav = new ModelAndView(new RedirectView("activity.jsp"));
			return mav;
		}
		if ("delete".equals(type)) {
			System.out.println("delete---"+activity_id+"-----");
			Activity activity = new Activity();
			activity.setActivity_id(Integer.parseInt(activity_id));
			ActivityService activityService = new ActivityServiceImpl();
			activityService.deleteActivity(activity.getActivity_id());

			ModelAndView mav = new ModelAndView(new RedirectView("activity.jsp"));
			return mav;
		}
		if ("query".equals(type)) {
			page.setPage(Integer.parseInt(page1));
			Activity activity = new Activity();
			ModelAndView mav = new ModelAndView();
			
			if(null!= class_id){
				mav.setViewName("activity"); 
				activity.setClass_id(Integer.parseInt(class_id));
				ActivityService activityService = new ActivityServiceImpl();
			

		/*	List<Activity> nlist1 = new ArrayList<Activity>();
			nlist1 = activityService.queryActivity(activity.getActivity_id());
			ModelAndView mav = new ModelAndView();
			mav.setViewName("activity");
			mav.addObject("activity1", nlist1); 
			*/
			List<Activity> nnlist = new ArrayList<Activity>();
			 
			nnlist = activityService.queryActivity(activity.getClass_id(),page);	
			JSONArray nulist = JSONArray.fromObject(nnlist);
			System.out.println(nulist);
			mav.addObject("activity2",nulist );  
			return mav;
		}
			else {
				mav.setViewName("activityDetail"); 
				ActivityService activityService = new ActivityServiceImpl();
				activity.setActivity_id(Integer.parseInt(activity_id));
				Activity act = new Activity();
				act = activityService.queryActivityById(activity.getActivity_id(),page);
				JSONObject result = new JSONObject();
				result = JSONObject.fromObject(act);
				mav = new ModelAndView(new MappingJacksonJsonView());	
				System.out.println(result);
				mav.addObject("uu", result);
				return mav;
			}
			
			
			
		}
		return null;
	}
}