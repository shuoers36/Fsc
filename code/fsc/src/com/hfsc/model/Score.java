package com.hfsc.model;

import java.text.DateFormat;
import java.util.Date;

public class Score {

	private int Score_id;
	
	private int Student_id;
	
	private String Subject_name;
	
	private String Student_name;
		
	public  String getStudent_name() {
		return Student_name;
	}

	public void setStudent_name(String student_name) {
		Student_name = student_name;
	}

	private float Score;
	
	private String Score_time;
	
	

	public int getScore_id() {
		return Score_id;
	}

	public void setScore_id(int score_id) {
		Score_id = score_id;
	}

	public int getStudent_id() {
		return Student_id;
	}

	public void setStudent_id(int student_id) {
		Student_id = student_id;
	}

	public String getSubject_name() {
		return Subject_name;
	}

	public void setSubject_name(String subject_name) {
		Subject_name = subject_name;
	}

	public float getScore() {
		return Score;
	}

	public void setScore(float score) {
		Score = score;
	}

	public String getScore_time() {
		return Score_time;
	}

	public void setScore_time(String score_time) {
		Score_time = score_time;
	}

}
