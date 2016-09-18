package com.hfsc.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.hfsc.dao.AttendanceDao;
import com.hfsc.model.Activity;
import com.hfsc.model.Attendance;
import com.hfsc.model.Page;
import com.hfsc.until.DBUntil;

public class AttendanceDaoImpl implements AttendanceDao{
	
	 @Override
	    public List<Attendance> queryAttendance(String name,Page page) {
	        List<Object> param = new ArrayList<Object>();
	        StringBuffer sql = new StringBuffer();
	        sql.append(" select * from attendance where 1=1 ");
	  
	        
	            sql.append("and Student_name =?");
	            sql.append(" order by Attendance_time asc");
	            param.add(name);

	        DBUntil db = new DBUntil();
	        try {

	            List<Attendance> list = db.quseryInfo(sql.toString(), param, Attendance.class);
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
