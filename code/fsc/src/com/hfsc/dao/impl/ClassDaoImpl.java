package com.hfsc.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.hfsc.dao.ClassDao;
import com.hfsc.model.Class;
import com.hfsc.model.Page;
import com.hfsc.until.DBUntil;

public class ClassDaoImpl implements ClassDao {

	@Override
	public void insertClass(Class alass) {

		List<Object> param = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		
		sql.append(" insert into class (Class_id,Class_num,Grade) values (?,?,?) ");
		DBUntil db = new DBUntil();
		param.add(alass.getClass_id());
		param.add(alass.getClass_num());
		param.add(alass.getGrade());
		db.insertUpdateDeleteExute(sql.toString(), param);

	}
	
   
    @Override
    public void deleteClass(int id) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append(" delete from class where Class_id = ? ");
        DBUntil db = new DBUntil();
        param.add(id);
        db.insertUpdateDeleteExute(sql.toString(), param);
        
    }
    @Override
    public List<Class> queryClass(Page page) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append(" select Class_id,Class_num,Grade from class");
        sql.append(" limit ");
        sql.append(page.getPage()*10-10);
        sql.append(" , ");
        sql.append(page.getPage()*10);
        DBUntil db = new DBUntil();
        try {

            List<Class> list = db.quseryInfo(sql.toString(), param, Class.class);
  
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
