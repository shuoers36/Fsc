package com.hfsc.dao;

import java.util.List;

import com.hfsc.model.Activity;
import com.hfsc.model.Page;

public interface ActivityDao {

	public void insertActivity(Activity activity);

	public void changeActivity(Activity activity);

	public void deleteActivity(int id);

	public List<Activity> queryActivity(int ActivityID, Page page);
	
	public List<Activity> queryActivityById(int id,Page page);
	
}
