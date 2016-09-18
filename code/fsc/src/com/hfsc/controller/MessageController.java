package com.hfsc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import com.hfsc.service.impl.MessageServiceImpl;
import com.hfsc.service.impl.MessageServiceImpl;
import com.hfsc.service.impl.MessageServiceImpl;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.hfsc.model.Message;
import com.hfsc.model.Session;
import com.hfsc.service.MessageService;
import com.hfsc.service.MessageService;
import com.hfsc.service.MessageService;
import com.hfsc.model.Message;
import com.hfsc.model.Message;
import com.hfsc.model.Session;
@Controller

public class MessageController {
	@RequestMapping(value={"message.do"})
	  protected ModelAndView handleRequestInternal(HttpServletRequest request,
	      HttpServletResponse response,HttpSession session) throws Exception {
		
		  String message_content  = request.getParameter("message_content");
		  String message_title  = request.getParameter("message_title");
		  String addressee_name = request.getParameter("addressee_name");	
		  String message_id = request.getParameter("message_id");
		  String type = request.getParameter("type");
		  String username = request.getParameter("user_name");
System.out.println("TYPE---"+type);
System.out.println("起始id---"+message_id);
		  //query=当前登陆账号名
		  String detail_id = request.getParameter("detail_id");
System.out.println("细节---"+detail_id);


		  
		  
		  
		//------------------------删除-----------------------
			if ("delete".equals(type)) {
				ModelAndView mav = new ModelAndView();
				mav.setViewName("message");
System.out.println("进入删除");
				Message message = new Message();
				MessageService messageService = new MessageServiceImpl();
				messageService.deleteMessage((long)Integer.parseInt(message_id));
System.out.println("----------------------");
				return mav;
			}
			
			
			
		//------------------------插入----------------------------
//System.out.println("charu"+addressee_name+"---");
		  if("insert".equals(type)) {
			  
			  ModelAndView mav = new ModelAndView();
			  mav.setViewName("message");
System.out.println("进入插入");
			  Message message = new Message();
			//message_content =message_content.replaceAll("\r\n","\\n");//内容实现换行
			  message.setAddresser_name(username );
			  message.setAddressee_name(addressee_name);
			  message.setMessage_title(message_title);
			  message.setMessage_content(message_content);
			  MessageService messageService = new MessageServiceImpl();
			  messageService.sendMessage(message);
System.out.println("----------------------");
			  return mav;
			  
		  }
		  
		
		  
		  
		  //---------------------展示---------------------------------		  
		  if ("query".equals(type)) {
			  ModelAndView mav = new ModelAndView();
			  mav.setViewName("message");
System.out.println("进入展示");
				Message message = new Message();					
				List<Message> nlist = new ArrayList<Message>();
				MessageService messageService = new MessageServiceImpl();
				nlist = messageService.queryMessage(username);	
				JSONArray nulist = JSONArray.fromObject(nlist); 
				mav.addObject("nulist",nulist );
//System.out.println("展示---"+message_query);
System.out.println("----------------------");		
				//Message message1 = new Message();
				List<Message> nlist1 = new ArrayList<Message>();
				MessageService messageService1 = new MessageServiceImpl();
				nlist1 = messageService1.query1Message(username);	
				JSONArray nulist1 = JSONArray.fromObject(nlist1); 
				mav.addObject("nulist1",nulist1 );
System.out.println("----------------------");
				return mav;
			}

		  
		  
//System.out.println("细节外");
		  //---------------------展示细节---------------------------------
		  if ("detail".equals(type)) {
			  ModelAndView mav1 = new ModelAndView();
			  mav1.setViewName("messageDetil"); 
System.out.println("进入细节");
				Message message = new Message();					
				List<Message> nlist = new ArrayList<Message>();
				MessageService messageService = new MessageServiceImpl();
				nlist = messageService.showDetil((long)Integer.parseInt(detail_id));	
				JSONArray nwlist = JSONArray.fromObject(nlist); 
				System.out.println(nwlist);
				mav1.addObject("nwlist",nwlist );
				
System.out.println("----------------------");
				return mav1;
				 
			}
			
		  
		  
		  return null;
	}

}

