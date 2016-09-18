package com.hfsc.dao.impl;

import java.util.ArrayList;
import java.util.List;


import com.hfsc.dao.CommentDao;
import com.hfsc.model.Comment;
import com.hfsc.model.Page;
import com.hfsc.model.User;
import com.hfsc.until.DBUntil;
import com.mysql.jdbc.PreparedStatement;
import com.sun.jmx.snmp.Timestamp;

public class CommentDaoImpl  implements CommentDao{

	@Override
	//插入
	public void insertComment(Comment comment){
		List<Object> param=new ArrayList<Object>();
		StringBuffer sql=new StringBuffer();
		sql.append("insert into comment(Teacher_name,Student_id,Message_content,Message_time) values(?,?,?,?)");
	
	DBUntil db=new DBUntil();
	param.add(comment.getTeacher_name());
	param.add(comment.getStudent_id());
	param.add(comment.getMessage_content());
	param.add(comment.getMessage_time());
    
	db.insertUpdateDeleteExute(sql.toString(),param);

}
	
	
	@Override
	//修改
	public void updateComment(Comment comment){
		List<Object> param=new ArrayList<Object>();
		StringBuffer sql=new StringBuffer();
		sql.append("update comment set Message_content= ? ,Message_time=? where Comment_id=?");
		DBUntil db=new DBUntil();	
		param.add(comment.getMessage_content());
		param.add(comment.getMessage_time());
		param.add(comment.getComment_id());
		System.out.println(sql);
		db.insertUpdateDeleteExute(sql.toString(), param);
	}
	
	@Override
	//删除
	public void deleteComment(Comment comment){
		List<Object> param=new ArrayList<Object>();
		StringBuffer sql=new StringBuffer();
		sql.append("delete from comment where Comment_id =?");
		DBUntil db=new DBUntil();
		param.add(comment.getComment_id());
		System.out.println(sql);
		db.insertUpdateDeleteExute(sql.toString(), param);
	}
	//查询
	 @Override
	    public List<Comment> queryComment(Comment comment,Page page) {
	        List<Object> param = new ArrayList<Object>();
	        StringBuffer sql = new StringBuffer();
	    	sql.append(
					"select Comment_id,Student_name,comment.Student_id,Message_content,Message_time from student JOIN comment  on student.Student_id=comment.Student_id and student.Class_id= ? ");

			param.add(comment.getClass_id());

		
			sql.append(" limit ");
			sql.append(page.getPage() * 10 - 10);
			sql.append(" , ");
			sql.append(10);

	        System.out.println(sql);
	        DBUntil db = new DBUntil();
	        try {
	            List<Comment> list = db.quseryInfo(sql.toString(), param, Comment.class);
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
		//查询单一学生
	 @Override
	    public List<Comment> squeryComment(Comment comment,Page page) {
	        List<Object> param = new ArrayList<Object>();
	        StringBuffer sql = new StringBuffer();
	    	sql.append(
					"select  Student_name, Teacher_name,comment.Student_id,Message_content,Message_time from student JOIN comment  on student.Student_id=comment.Student_id and student.Student_id= ? ");

			param.add(comment.getStudent_id());
			System.out.print(sql);
		
			sql.append(" limit ");
			sql.append(page.getPage() * 10 - 10);
			sql.append(" , ");
			sql.append(10);

	        System.out.println(sql);
	        DBUntil db = new DBUntil();
	        try {
	            List<Comment> list = db.quseryInfo(sql.toString(), param, Comment.class);
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
	
	
