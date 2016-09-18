package com.hfsc.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.hfsc.dao.ActivityDao;
import com.hfsc.model.Activity;
import com.hfsc.model.Page;
import com.hfsc.until.DBUntil;

public class ActivityDaoImpl implements ActivityDao{
	
	@Override
	public void insertActivity(Activity activity) {

		List<Object> param = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		
		sql.append(" insert into activity (Activity_id,Activity_name,Activity_time,Activity_content,Class_id,Photo_path) values (?,?,?,?,?,?) ");
		DBUntil db = new DBUntil();
		param.add(activity.getActivity_id());
		param.add(activity.getActivity_name());
		param.add(activity.getActivity_time());
		param.add(activity.getActivity_content());
		param.add(activity.getClass_id());
		param.add(activity.getPhoto_path());
		db.insertUpdateDeleteExute(sql.toString(), param);

	}
	
    @Override
    public void changeActivity(Activity activity) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append(" update activity set Activity_content = ? where Activity_id = ? ");
        DBUntil db = new DBUntil();
        param.add(activity.getActivity_content());
        param.add(activity.getActivity_id());
        db.insertUpdateDeleteExute(sql.toString(), param);
        
    }
    
    @Override
    public void deleteActivity(int id) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append(" delete from activity where Activity_id = ? ");
        DBUntil db = new DBUntil();
        param.add(id);
        db.insertUpdateDeleteExute(sql.toString(), param);
        
    }
    @Override
    public List<Activity> queryActivity(int ClassID,Page page) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append(" select * from activity where 1=1 ");
  
        if (ClassID != -1) {
            sql.append("and Class_id = ");
            sql.append(ClassID);

        }
        sql.append(" limit ");
        sql.append(page.getPage()*3-3);
        sql.append(" , ");
        sql.append(3);
        DBUntil db = new DBUntil();
        System.out.println("到这了"+sql);
        try {

            List<Activity> list = db.quseryInfo(sql.toString(), param, Activity.class);
            return list;
        }
        catch (InstantiationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        catch (IllegalAccessException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        catch (NoSuchFieldException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        catch (SecurityException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return null;
    }
    
    @Override
    public List<Activity> queryActivityById(int id,Page page) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append(" select * from activity where 1=1 ");
  
        sql.append("and Activity_id = ");
        sql.append(id);
        sql.append(" limit ");
        sql.append(page.getPage()*6-6);
        sql.append(" , ");
        sql.append(6);
        DBUntil db = new DBUntil();
        try {

            List<Activity> list = db.quseryInfo(sql.toString(), param, Activity.class);
            return list;
        }
        catch (InstantiationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        catch (IllegalAccessException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        catch (NoSuchFieldException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        catch (SecurityException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return null;
    }

}
