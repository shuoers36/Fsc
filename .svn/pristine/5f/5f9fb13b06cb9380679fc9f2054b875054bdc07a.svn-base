package com.hfsc.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sun.java.swing.plaf.motif.resources.motif;
@Controller
public class UploadController {


	@RequestMapping("upload.do")
	protected ModelAndView execute(@RequestParam MultipartFile myfile,HttpServletRequest request) throws Exception{	
		String username = request.getParameter("username");
		System.out.println(username);
		String oriFileName = myfile.getOriginalFilename();

		String fileName = UUID.randomUUID().toString()+"."+FilenameUtils.getExtension(oriFileName);
		//文件路径
		String fileDir = request.getServletContext().getRealPath("/upload");
		System.out.println(fileDir);
		File file = new File(fileDir, fileName);
		
		if(!file.getParentFile().exists()){
			file.getParentFile().mkdirs();
			System.out.println("bucunz ");
		}
		
		IOUtils.copy(myfile.getInputStream(),new FileOutputStream(file));
		String absfilePath = fileDir+"\\"+fileName;
		System.out.println(absfilePath);
		ModelAndView mav = new ModelAndView("upload");
		mav.addObject("absfilePath1",absfilePath);
		return mav;
	}
}
