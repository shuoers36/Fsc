package com.hfsc.model;

import java.text.DateFormat;
import java.util.Date;

public class Attendance {

	private int Attendance_id;
	
	private String Student_name;
	
	private String Attendance_content;
	
	private String Attendance_time;
	

	private int Student_id;

	public int getAttendance_id() {
		return Attendance_id;
	}

	public void setAttendance_id(int attendance_id) {
		Attendance_id = attendance_id;
	}

	public String getStudent_name() {
		return Student_name;
	}

	public void setStudent_name(String student_name) {
		Student_name = student_name;
	}

	public String getAttendance_content() {
		return Attendance_content;
	}

	public void setAttendance_content(String attendance_content) {
		Attendance_content = attendance_content;
	}

	

	public String getAttendance_time() {
		return Attendance_time;
	}

	public void setAttendance_time(String attendance_time) {
		Attendance_time = attendance_time;
	}

	public int getStudent_id() {
		return Student_id;
	}

	public void setStudent_id(int student_id) {
		Student_id = student_id;
	}
	
	
}