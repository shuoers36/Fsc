package com.hfsc.service;

import java.util.List;

import com.hfsc.model.Activity;
import com.hfsc.model.Page;

public interface ActivityService {

	public void deleteActivity(int id);

	public void changeActivity(Activity activity);

	public void insertActivity(Activity activity);

	public List<Activity> queryActivity(int id, Page page);
	
	public Activity queryActivityById(int id, Page page);

}
