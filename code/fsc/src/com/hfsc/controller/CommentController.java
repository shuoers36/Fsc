package com.hfsc.controller;

import java.util.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import com.hfsc.until.DBUntil;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import com.hfsc.model.Activity;
import com.hfsc.model.Comment;
import com.hfsc.model.Page;
import com.hfsc.model.User;
import com.hfsc.service.ActivityService;
import com.hfsc.service.CommentService;
import com.hfsc.service.UserService;
import com.hfsc.service.impl.ActivityServiceImpl;
import com.hfsc.service.impl.CommentServiceImpl;
import com.hfsc.service.impl.UserServiceImpl;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
	
@Controller
@RequestMapping("/Comment.do")
public class CommentController extends AbstractController {
  

@Override
  protected  ModelAndView handleRequestInternal(HttpServletRequest request,
      HttpServletResponse response) throws Exception {
	  String comment_id = request.getParameter("Comment_id");
	  String type = request.getParameter("type");
	  String page = request.getParameter("page");
	  String Student_id = request.getParameter("Student_id");
	  String Teacher_name = request.getParameter("Teacher_name");
	  String Message_content = request.getParameter("Comment_content");
	  String Class_id=request.getParameter("Class_id");
	  CommentService commentService = new CommentServiceImpl(); 
	
	 
	  
		if("delete".equals(type)){
			Comment comment = new Comment();
			Message_content=null;
			comment.setComment_id(Integer.parseInt(comment_id));
			commentService.deleteComment(comment);

			ModelAndView mav = new ModelAndView(new RedirectView("comment.jsp"));
			return mav;
		}
		if("add".equals(type)) {
			Comment  comment = new Comment();
			comment.setTeacher_name(Teacher_name);
			comment.setStudent_id(Integer.parseInt(Student_id));
			Date now = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			String Message_time = dateFormat.format( now ); 
			comment.setMessage_content(Message_content);
			comment.setMessage_time(Message_time);
			commentService.insertComment(comment);
			ModelAndView mav = new ModelAndView(new RedirectView("comment.jsp"));
			return mav;
	        
		}
		if("edit".equals(type)) {
			Comment comment = new Comment();
			comment.setComment_id(Integer.parseInt(comment_id));
			comment.setMessage_content(Message_content);
			//获取时间
			Date now = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			String Message_time = dateFormat.format( now ); 
			System.out.println(Message_time); 
			comment.setMessage_time(Message_time);
			commentService.updateComment(comment);

			ModelAndView mav = new ModelAndView(new RedirectView("comment.jsp"));
			return mav;
		}
		if("query".equals(type)) {
			
			ModelAndView mav = new ModelAndView();
			if(null!= Class_id){
				List<Comment> comment = new ArrayList<Comment>();
				comment = commentService.queryCommentByClass_id(Integer.parseInt(Class_id));
				JSONArray nulist = JSONArray.fromObject(comment);  
				
				System.out.println(nulist);
			    mav.setViewName("comment");
				mav.addObject("uu", nulist);
				return mav;
			}
	     
			return mav;
		}
        if("queryid".equals(type)) {
			
			ModelAndView mav = new ModelAndView();
			if(null!= Student_id){
				List<Comment> comment = new ArrayList<Comment>();
				comment = commentService.queryCommentByStudent_id(Integer.parseInt(Student_id));
				JSONArray nulist = JSONArray.fromObject(comment);  
				
				System.out.println(nulist);
			    mav.setViewName("stuComment");
				mav.addObject("uu", nulist);
				return mav;
			}
        }
        return null;
}
}

