package com.hfsc.controller;

//import java.sql.Date;
//import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.*;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import org.springframework.web.servlet.view.RedirectView;

import com.hfsc.model.Announcement;
import com.hfsc.model.User;
import com.hfsc.service.AnnouncementService;
import com.hfsc.service.impl.AnnouncementServiceImpl;

import org.springframework.web.servlet.view.json.MappingJacksonJsonView;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;



@Controller
@RequestMapping("announcement.do")
@Scope("prototype")
public class AnnouncementController {
	
	
	@RequestMapping(params = "method=all")
	protected ModelAndView getall(HttpServletRequest request, HttpServletResponse response) throws Exception { 
		
		//Announcement announcement = new Announcement();
		AnnouncementService announcementService = new AnnouncementServiceImpl();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("announcementindex");
		/*mav.setViewName("announcement");*/

		
		List<Announcement> nnlist = new ArrayList<Announcement>();
		nnlist = announcementService.showAnnouncement();	
		JSONArray nulist = JSONArray.fromObject(nnlist);
		System.out.println(nulist);
		mav.addObject("announcement2",nulist );  
		
		/*String announcement_delid=request.getParameter("announcement_delid");
        System.out.println(announcement_delid);
		if (announcement_delid != "") {
			
			System.out.println("method=all删除启动");//
						Announcement announcement = new Announcement();
						announcement.setAnnouncement_id(Integer.parseInt(announcement_delid));
						AnnouncementService announcementService1 = new AnnouncementServiceImpl();
						announcementService1.deleteAnnouncement(announcement.getAnnouncement_id());
					    ModelAndView mav1 = new ModelAndView("redirect:announcement.do?method=all", null);
						return mav1;
		}*/
		
		return mav;	
		
		
		
	}
	

	@RequestMapping(params = "method=normal")
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String announcement_id = request.getParameter("announcement_id");
System.out.println("get it");
		//String user_id =request.getParameter("user_id");
		String announcement_title = request.getParameter("announcement_title");
		String announcement_content = request.getParameter("announcement_content");
		
		//String announcement_time = request.getParameter("announcement_time");
		String announcement_delid = request.getParameter("announcement_delid");
		String announcement_query = request.getParameter("announcement_query");
		
		
		
		
		
//		Announcement announcement = new Announcement();
//		AnnouncementService announcementService = new AnnouncementServiceImpl();
//		List<Announcement> nlist = new ArrayList<Announcement>();
//		nlist = announcementService.showAnnouncement();
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("announcement");
//		mav.addObject("announcement1", nlist); 
//		
//		List<Announcement> nnlist = new ArrayList<Announcement>();
//		nnlist = announcementService.showAnnouncement();	
//		JSONArray nulist = JSONArray.fromObject(nnlist);
//		System.out.println(nulist);
//		mav.addObject("announcement2",nulist );  
//		return mav;
		
		
		
		
		
		
		
		
		
		
		
		if (announcement_id != "") {
			Announcement announcement = new Announcement();
			announcement.setAnnouncement_id(Integer.parseInt(announcement_id));
System.out.println("转换成功");//
			//announcement.setUser_id(Integer.parseInt(user_id));
			announcement.setAnnouncement_title(announcement_title);
			announcement.setAnnouncement_content(announcement_content);
			AnnouncementService announcementkService = new AnnouncementServiceImpl();
			announcementkService.insertAnnouncement(announcement);
			ModelAndView mav = new ModelAndView(new RedirectView("announcement.jsp"));
			
			return mav;
		}
		
		
		if (announcement_delid != "") {
			
System.out.println("删除启动");//
			Announcement announcement = new Announcement();
			announcement.setAnnouncement_id(Integer.parseInt(announcement_delid));
			AnnouncementService announcementService = new AnnouncementServiceImpl();
			announcementService.deleteAnnouncement(announcement.getAnnouncement_id());

			ModelAndView mav = new ModelAndView(new RedirectView("announcementindex.jsp"));
			return mav;
		}
		
		/**
		if (announcement_query != "") {
			System.out.println("查询启动");
			Announcement announcement = new Announcement();
			announcement.setAnnouncement_id(Integer.parseInt(announcement_query));
System.out.println("查询语句转换成功");//		
			AnnouncementService announcementService = new AnnouncementServiceImpl();
			
			/**
			List<Announcement> nlist = new ArrayList<Announcement>();
			nlist = announcementService.queryAnnouncement(announcement.getAnnouncement_id());

			ModelAndView mav = new ModelAndView();
			mav.setViewName("announcement");
			mav.addObject("announcement1", nlist); 
			
			return mav;
		
		
			
			List<Announcement> nlist = new ArrayList<Announcement>();
			nlist = announcementService.queryAnnouncement(Integer.parseInt(announcement_query));
			JSONArray nulist = new JSONObject();
			nulist = JSONArray.fromObject(nlist);
			ModelAndView mav = new ModelAndView();
			mav.setViewName("announcement");
			mav.addObject("announcement1", nulist); 
System.out.println("塞到announcement1");
			return mav;
			
			
			
		}
		if(announcement_query != ""){
			Announcement announcement=new Announcement();
			
			List<Announcement> nlist = new ArrayList<Announcement>();
			AnnouncementService announcementService = new AnnouncementServiceImpl();
			nlist=announcementService.queryAnnouncement(Integer.parseInt(announcement_query));
			JSONArray nulist = JSONArray.fromObject(nlist);
			ModelAndView mav = new ModelAndView();
			mav.setViewName("announcement");
			mav.addObject("nulist", nulist); 
			return mav;
		}
		
		*/
		
		
		
		
		
		
		

		if (announcement_query != "") {
			System.out.println("查询启动");			
			Announcement announcement = new Announcement();
			announcement.setAnnouncement_id(Integer.parseInt(announcement_query));
			AnnouncementService announcementService = new AnnouncementServiceImpl();
			

			List<Announcement> nlist = new ArrayList<Announcement>();
			nlist = announcementService.queryAnnouncement(announcement.getAnnouncement_id());
			ModelAndView mav = new ModelAndView();
			mav.setViewName("announcement");
			mav.addObject("announcement1", nlist); 
			
			List<Announcement> nnlist = new ArrayList<Announcement>();
			nnlist = announcementService.queryAnnouncement(announcement.getAnnouncement_id());	
			JSONArray nulist = JSONArray.fromObject(nnlist);
			System.out.println(nulist);
			mav.addObject("announcement2",nulist );  
			return mav;
			
		}
		
	
		return null;
	}
	
	
	
	@RequestMapping(params = "method=query")
	protected ModelAndView query(HttpServletRequest request, HttpServletResponse response) throws Exception { 
		
		System.out.println("进入");
		
		String announcement_query = request.getParameter("announcement_query");
		
				
		if (announcement_query != "") {
			System.out.println("查询启动");			
			Announcement announcement = new Announcement();
			announcement.setAnnouncement_id(Integer.parseInt(announcement_query));
			AnnouncementService announcementService = new AnnouncementServiceImpl();
			

			List<Announcement> nlist = new ArrayList<Announcement>();
			nlist = announcementService.queryAnnouncement(announcement.getAnnouncement_id());
			ModelAndView mav = new ModelAndView();
			mav.setViewName("announcement");
			mav.addObject("announcement1", nlist); 
			
			List<Announcement> nnlist = new ArrayList<Announcement>();
			nnlist = announcementService.queryAnnouncement(announcement.getAnnouncement_id());	
			JSONArray nulist = JSONArray.fromObject(nnlist);
			System.out.println(nulist);
			mav.addObject("announcement2",nulist );  
			return mav;
			
		}
		return null;
		
	}
	
	
	
	
	
	
	@RequestMapping(params = "method=insert")
	protected ModelAndView insert(HttpServletRequest request, HttpServletResponse response) throws Exception { 
		System.out.println("进入insert方法");
		//String announcement_id = request.getParameter("announcement_id");
		//System.out.println("announcement_id是"+announcement_id);
				String announcement_title = request.getParameter("announcement_title");
				System.out.println("announcement_title是"+announcement_title);
				String announcement_content = request.getParameter("announcement_content");
				
		//if (announcement_id != ""&&announcement_id != null) {
	    if (announcement_title != ""&&announcement_content != null) {
			Announcement announcement = new Announcement();
			//System.out.println("announcement_id是"+announcement_id);//
			//announcement.setAnnouncement_id(Integer.parseInt(announcement_id));
System.out.println("转换成功");//
			announcement.setAnnouncement_title(announcement_title);
			announcement.setAnnouncement_content(announcement_content);
			AnnouncementService announcementkService = new AnnouncementServiceImpl();
			announcementkService.insertAnnouncement(announcement);
			/*ModelAndView mav = new ModelAndView(new RedirectView("announcementindex.jsp"));*/
			ModelAndView mav = new ModelAndView("redirect:announcement.do?method=all", null);
			return mav;
		}
		return null;
		
	}
	
	
	@RequestMapping(params = "method=delete")
	protected ModelAndView delete(HttpServletRequest request, HttpServletResponse response) throws Exception { 
	String announcement_delid=request.getParameter("announcement_delid");
	System.out.println("get announcement_delid"+announcement_delid);	
	
	if (announcement_delid != "") {
		
		System.out.println("删除启动");
					Announcement announcement = new Announcement();
					announcement.setAnnouncement_id(Integer.parseInt(announcement_delid));
					AnnouncementService announcementService1 = new AnnouncementServiceImpl();
					announcementService1.deleteAnnouncement(announcement.getAnnouncement_id());
				    ModelAndView mav = new ModelAndView("redirect:announcement.do?method=all", null);
					return mav;
				}
	return null;
	}

	}
