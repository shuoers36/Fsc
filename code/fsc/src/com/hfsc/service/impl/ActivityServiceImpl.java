package com.hfsc.service.impl;

import java.util.List;

import com.hfsc.dao.ActivityDao;
import com.hfsc.dao.impl.ActivityDaoImpl;
import com.hfsc.model.Activity;
import com.hfsc.model.Page;
import com.hfsc.service.ActivityService;

public class ActivityServiceImpl implements ActivityService{
	@Override
    public void insertActivity(Activity activity) {
		ActivityDao activityDao = new ActivityDaoImpl();
		activityDao.insertActivity(activity);
    }
	@Override
    public void changeActivity(Activity activity) {
		ActivityDao activityDao = new ActivityDaoImpl();
		activityDao.changeActivity(activity);
    }

	@Override
    public void deleteActivity(int id) {
		ActivityDao activityDao = new ActivityDaoImpl();
		activityDao.deleteActivity(id);
        
    }
	@Override
    public List<Activity> queryActivity(int classid,Page page) {
		ActivityDao activityDao = new ActivityDaoImpl();
        return activityDao.queryActivity(classid,page);
        
    }
	@Override
	public Activity queryActivityById(int id, Page page) {
		ActivityDao activityDao = new ActivityDaoImpl();
        return activityDao.queryActivityById(id,page).get(0);
	}
}