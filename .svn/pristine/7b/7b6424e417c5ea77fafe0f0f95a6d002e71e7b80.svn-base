package com.hfsc.controller;

//import java.sql.Date;
//import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.*;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
@RequestMapping("announcementDetail.do")

public class AnnouncementDetailController extends AbstractController {
	
	
	
	

	
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		
		System.out.println("handleRequestInternal");
		
		String announcement_id = request.getParameter("announcement_id");
System.out.println("细节get it");
		
			
			Announcement announcement = new Announcement();
			announcement.setAnnouncement_id(Integer.parseInt(announcement_id));
			AnnouncementService announcementService = new AnnouncementServiceImpl();
			

			List<Announcement> nlist = new ArrayList<Announcement>();
			nlist = announcementService.queryAnnouncement(announcement.getAnnouncement_id());
			ModelAndView mav = new ModelAndView();
			mav.setViewName("announcementDetail");
			mav.addObject("announcement1", nlist); 
			
			List<Announcement> nnlist = new ArrayList<Announcement>();
			nnlist = announcementService.queryAnnouncement(announcement.getAnnouncement_id());	
			JSONArray nulist = JSONArray.fromObject(nnlist);
			System.out.println(nulist);
			mav.addObject("announcement3",nulist );  
			
			
			
			return mav;
		
		
	}

	}
