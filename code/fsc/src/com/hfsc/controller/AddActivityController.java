package com.hfsc.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.hfsc.model.Activity;
import com.hfsc.model.Session;
import com.hfsc.service.ActivityService;
import com.hfsc.service.impl.ActivityServiceImpl;

@Controller
public class AddActivityController {
	@RequestMapping("addActivity.do")

	protected ModelAndView execute(@RequestParam MultipartFile myfile, HttpServletRequest request) throws Exception {
		String type = request.getParameter("type");
		String activity_name = request.getParameter("activity_name");
		String activity_content = request.getParameter("activity_content");
		String class_id = request.getParameter("class_id");
		
	
		if ("add".equals(type)) {
			Activity activity = new Activity();
			//activity.setActivity_id(Integer.parseInt(activity_id));
			activity.setActivity_name(activity_name);
			activity.setActivity_content(activity_content);
			activity.setClass_id(Integer.parseInt(class_id));
			DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	        String datenow = sdf.format(new Date());  
			activity.setActivity_time(datenow);
			
			//Session session = new Session();
			//session.setRole_name(activity.getActivity_name());
			
			//httpsession.setAttribute("test", session);
			
			String oriFileName = myfile.getOriginalFilename();

			String fileName = UUID.randomUUID().toString()+"."+FilenameUtils.getExtension(oriFileName);
			//文件路径
			String fileDir = request.getServletContext().getRealPath("/")+"upload";
			
			File file = new File(fileDir, fileName);
			
			if(!file.getParentFile().exists()){
				file.getParentFile().mkdirs();

			}
			
			IOUtils.copy(myfile.getInputStream(),new FileOutputStream(file));
			String absfilePath =request.getScheme()+"://"+request.getServerName() + ":" + request.getServerPort() +request.getContextPath() + "/upload/" +fileName;
			
			System.out.println(absfilePath);
			
			activity.setPhoto_path(absfilePath);
			
			ActivityService activityService = new ActivityServiceImpl();
			activityService.insertActivity(activity);
			
			
			//System.out.println( httpsession.getAttribute("test")+"activity");

			ModelAndView mav = new ModelAndView(new RedirectView("activity.jsp"));
			return mav;
		}
		return null;
	}
}
