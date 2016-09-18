package com.hfsc.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.hfsc.dao.HomeworkDao;
import com.hfsc.model.Homework;
import com.hfsc.model.Page;
import com.hfsc.until.DBUntil;

public class HomeworkDaoImpl implements HomeworkDao {

	@Override
	public void insertHomework(Homework homework) {

		List<Object> param = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		
		sql.append(" insert into homework (Subject_name,Homework_content,Class_id,Homework_time) values (?,?,?,?) ");
		DBUntil db = new DBUntil();
		param.add(homework.getSubject_name());
		param.add(homework.getHomework_content());
		param.add(homework.getClass_id());
		param.add(homework.getHomework_time());
		db.insertUpdateDeleteExute(sql.toString(), param);

	}
	
    @Override
    public void changeHomework(Homework homework) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append(" update homework set Homework_content = ? where Homework_id = ? ");
        DBUntil db = new DBUntil();
        param.add(homework.getHomework_content());
        param.add(homework.getHomework_id());
        db.insertUpdateDeleteExute(sql.toString(), param);
        
    }
    
    @Override
    public void deleteHomework(int id) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append(" delete from homework where Homework_id = ? ");
        DBUntil db = new DBUntil();
        param.add(id);
        db.insertUpdateDeleteExute(sql.toString(), param);
        
    }
    @Override
    public List<Homework> queryHomework(int Class_id,Page page) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append(" select Subject_name,Homework_content,Homework_time from homework where Class_id = ? ");
        param.add(Class_id);
        sql.append(" limit ");
        sql.append(page.getPage()*10-10);
        sql.append(" , ");
        sql.append(10);
        DBUntil db = new DBUntil();
        try {

            List<Homework> list = db.quseryInfo(sql.toString(), param, Homework.class);
  
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
    public List<Homework> queryHomeworkByTeacher(String Subject_name,Page page) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append(" select * from homework where Subject_name = ? ");
        param.add(Subject_name);
        sql.append(" limit ");
        sql.append(page.getPage()*10-10);
        sql.append(" , ");
        sql.append(10);
        DBUntil db = new DBUntil();
        try {

            List<Homework> list = db.quseryInfo(sql.toString(), param, Homework.class);
  
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
