package com.hfsc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import com.hfsc.model.Honor;
import com.hfsc.model.Page;
import com.hfsc.service.HonorService;
import com.hfsc.service.impl.HonorServiceImpl;

import net.sf.json.JSONArray;

@Controller
public class HonorController {
	@RequestMapping("honor.do")

	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String student_id = request.getParameter("Student_id");
		Honor honor = new Honor();
		honor.setStudent_id(Integer.parseInt(student_id));;

		Page page = new Page();
		page.setPage(1);

		HonorService honorService = new HonorServiceImpl();
		List<Honor> nnlist = new ArrayList<Honor>();
		nnlist = honorService.queryHonor(honor.getStudent_id(), page);
		JSONArray nulist = JSONArray.fromObject(nnlist);

		System.out.println(nulist);

		ModelAndView mav = new ModelAndView("honor");
		mav.addObject("honor1", nulist);
		return mav;
	}
}
