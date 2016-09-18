package com.hfsc.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.hfsc.dao.HonorDao;
import com.hfsc.model.Attendance;
import com.hfsc.model.Honor;
import com.hfsc.model.Page;
import com.hfsc.until.DBUntil;

public class HonorDaoImpl implements HonorDao{
	 @Override
	    public List<Honor> queryHonor(int student_id,Page page) {
	        List<Object> param = new ArrayList<Object>();
	        StringBuffer sql = new StringBuffer();
	        sql.append(" select Honor_content,Honor_time from honor where 1=1 ");
	  
	        
	            sql.append("and Student_id =?");
	          
	            param.add(student_id);

	        DBUntil db = new DBUntil();
	        try {

	            List<Honor> list = db.quseryInfo(sql.toString(), param, Honor.class);
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
