package com.hfsc.model;
public class Activity {
	
	private int Activity_id;
	
	private String Activity_name;
	
	private String Activity_content;
	
	private String Activity_time;
	
	private int Class_id;
	
	private String Photo_path;
	
	

	public String getPhoto_path() {
		return Photo_path;
	}



	public void setPhoto_path(String photo_path) {
		Photo_path = photo_path;
	}



	public String getActivity_time() {
		return Activity_time;
	}



	public void setActivity_time(String activity_time) {
		Activity_time = activity_time;
	}




	public int getActivity_id() {
		return Activity_id;
	}

	public void setActivity_id(int activity_id) {
		Activity_id = activity_id;
	}

	public String getActivity_name() {
		return Activity_name;
	}

	public void setActivity_name(String activity_name) {
		Activity_name = activity_name;
	}

	public String getActivity_content() {
		return Activity_content;
	}

	public void setActivity_content(String activity_content) {
		Activity_content = activity_content;
	}



	public int getClass_id() {
		return Class_id;
	}



	public void setClass_id(int class_id) {
		Class_id = class_id;
	}
	
}
