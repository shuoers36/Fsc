package com.hfsc.model;

import java.sql.Date;

public class Homework {
	private int Homework_id;
	
	private String Subject_name;
	
	public String getSubject_name() {
		return Subject_name;
	}

	public void setSubject_name(String subject_name) {
		Subject_name = subject_name;
	}

	private int Class_id;
	
	private String Homework_content;
	
	private String Homework_time;
	
	
	public int getHomework_id() {
		return Homework_id;
	}

	public void setHomework_id(int homework_id) {
		Homework_id = homework_id;
	}

	

	public int getClass_id() {
		return Class_id;
	}

	public void setClass_id(int class_id) {
		Class_id = class_id;
	}

	public String getHomework_content() {
		return Homework_content;
	}

	public void setHomework_content(String homework_content) {
		Homework_content = homework_content;
	}

	

	public String getHomework_time() {
		return Homework_time;
	}

	public void setHomework_time(String homework_time) {
		Homework_time = homework_time;
	}

	
	
	
}
