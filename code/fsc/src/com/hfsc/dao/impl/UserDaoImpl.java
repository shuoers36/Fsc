package com.hfsc.dao.impl;

import java.util.ArrayList;
import java.util.List;


import com.hfsc.dao.UserDao;
import com.hfsc.model.User;
import com.hfsc.model.Page;
import com.hfsc.model.Session;
import com.hfsc.until.DBUntil;
public class UserDaoImpl implements UserDao {
    
    @Override
    public void insertUser(User user) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append(" insert into user (User_name,User_password) values (?,?) ");
        DBUntil db = new DBUntil();
        param.add(user.getUserName());
        param.add(user.getPassword());
        db.insertUpdateDeleteExute(sql.toString(), param);
    }
    @Override
    public void insertLeader(User user) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append(" insert into leader (Leader_name,Leader_password) values (?,?) ");
        DBUntil db = new DBUntil();
        param.add(user.getUserName());
        param.add(user.getPassword());
        db.insertUpdateDeleteExute(sql.toString(), param);
    }
    @Override
    public void insertTeacher(User user,int Class_id) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append(" insert into teacher (Teacher_name,Teacher_password,Class_id) values (?,?,?) ");
        DBUntil db = new DBUntil();
        param.add(user.getUserName());
        param.add(user.getPassword());
        param.add(Class_id);
        db.insertUpdateDeleteExute(sql.toString(), param);
    }
    @Override
    public void insertTeacher_subject(int Teacher_id,String subject_name) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append(" insert into subject (Teacher_id,Subject_name) values (?,?) ");
        DBUntil db = new DBUntil();
        param.add(Teacher_id);
        param.add(subject_name);
        db.insertUpdateDeleteExute(sql.toString(), param);
    }
    @Override
    public void insertStudent(User user,int Class_id) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append(" insert into student (Student_name,Student_password,Class_id) values (?,?,?) ");
        DBUntil db = new DBUntil();
        param.add(user.getUserName());
        param.add(user.getPassword());
        param.add(Class_id);
        db.insertUpdateDeleteExute(sql.toString(), param);
    }
    @Override
    public List<User> queryUser_id(String User_name) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append("SELECT User_id FROM `user` WHERE User_name = ? ");
        param.add(User_name);
       
     
        DBUntil db = new DBUntil();
        try {
            List<User> list = db.quseryInfo(sql.toString(), param, User.class);
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
    public List<Session> queryTeacher_id(String teacher_name) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append("SELECT Teacher_id FROM teacher WHERE Teacher_name = ? ");
        param.add(teacher_name);
       
     
        DBUntil db = new DBUntil();
        try {
            List<Session> list = db.quseryInfo(sql.toString(), param, Session.class);
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
    public void insertUser_role(int User_id,int Role_id) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append(" insert into user_role (User_id,Role_id) values (?,?) ");
        DBUntil db = new DBUntil();
        param.add(User_id);
        param.add(Role_id);
        db.insertUpdateDeleteExute(sql.toString(), param);
    }
    @Override
    public void insertParent(int stu_id,String user_name,String password) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append(" insert into parent (Student_id,Parent_name,Parent_password) values (?,?,?) ");
        DBUntil db = new DBUntil();
        param.add(stu_id);
        param.add(user_name);
        param.add(password);
        db.insertUpdateDeleteExute(sql.toString(), param);
    }
    
    @Override
    public void updateUser(User user) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append(" update user set User_name = ? ,User_password = ? where User_id = ? ");
        DBUntil db = new DBUntil();
        param.add(user.getUserName());
        param.add(user.getPassword());
        param.add(user.getId());
        db.insertUpdateDeleteExute(sql.toString(), param);
        
    }
    
    @Override
    public void deleteUser(Long id) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append(" delete from user where User_id = ? ");
        DBUntil db = new DBUntil();
        param.add(id);
        db.insertUpdateDeleteExute(sql.toString(), param);
        
    }
    @Override
    public List<User> queryUserForLogin(User user) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append(" select * from user where 1=1 ");
  
        if (0 != user.getId()) {
            sql.append("and User_id = ? ");
            param.add(user.getId());
        }
        String username = user.getUserName();
        if(null !=username && 0 !=username.length() ) {
            sql.append(" and User_name = ?");
            param.add(user.getUserName());
        }
      
      //  System.out.println(sql);
        DBUntil db = new DBUntil();
        try {
            List<User> list = db.quseryInfo(sql.toString(), param, User.class);
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
    public List<User> queryUser(User user,Page page) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append(" SELECT `user`.*,role.Role_name from (`user`,user_role,role) WHERE  `user`.User_id=user_role.User_id and user_role.Role_id=role.Role_id ");
  
        if (0 != user.getId()) {
            sql.append("and User_id = ? ");
            param.add(user.getId());
        }
        String username = user.getUserName();
        if(null !=username && 0 !=username.length() ) {
            sql.append(" and User_name = ?");
            param.add(user.getUserName());
        }
        sql.append(" limit ?,?");
        param.add(page.getPage()*10-10);
        param.add(10);
       // System.out.println(sql);
        DBUntil db = new DBUntil();
        try {
            List<User> list = db.quseryInfo(sql.toString(), param, User.class);
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
    public List<User> queryRole(User user) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append(" SELECT role.Role_name from (`user`,user_role,role) WHERE  `user`.User_id=user_role.User_id and user_role.Role_id=role.Role_id and `user`.User_name = ? ");
        param.add(user.getUserName());
       
     
        DBUntil db = new DBUntil();
        try {
            List<User> list = db.quseryInfo(sql.toString(), param, User.class);
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
    public List<User> queryResource(String role_name) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append("SELECT resource.Resource_name FROM role,resource,resource_role WHERE role.Role_id=resource_role.Role_id and resource_role.Resource_id=resource.Resource_id and role.Role_name = ? ");
  
        param.add(role_name);
       
        DBUntil db = new DBUntil();
        try {
            List<User> list = db.quseryInfo(sql.toString(), param, User.class);
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
    public List<Session> queryClass_id(String teacher_name) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append("SELECT Class_id FROM teacher where Teacher_name = ?");
  
        param.add(teacher_name);
       
        DBUntil db = new DBUntil();
        try {
            List<Session> list = db.quseryInfo(sql.toString(), param, Session.class);
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
    public List<Session> querySubject_name(String teacher_name) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append("SELECT `subject`.Subject_name FROM teacher,`subject` where Teacher_name = ? and teacher.Teacher_id = `subject`.Teacher_id");
  
        param.add(teacher_name);
       
        DBUntil db = new DBUntil();
        try {
            List<Session> list = db.quseryInfo(sql.toString(), param, Session.class);
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
    public List<Session> queryClass_idByStu(String student_name) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append("SELECT Class_id FROM student where Student_name = ? ");
  
        param.add(student_name);
       
        DBUntil db = new DBUntil();
        try {
            List<Session> list = db.quseryInfo(sql.toString(), param, Session.class);
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
    public List<Session> queryStu_idByStu_name(String student_name) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append("SELECT Student_id FROM student where Student_name = ? ");
  
        param.add(student_name);
       
        DBUntil db = new DBUntil();
        try {
            List<Session> list = db.quseryInfo(sql.toString(), param, Session.class);
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
    public List<Session> queryStu_idByParent(String parent_name) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append("SELECT Student_id FROM parent where Parent_name = ? ");
  
        param.add(parent_name);
       
        DBUntil db = new DBUntil();
        try {
            List<Session> list = db.quseryInfo(sql.toString(), param, Session.class);
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
    public List<Session> queryClass_idByStu_id(int stu_id) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append("SELECT Class_id FROM student where Student_id = ? ");
  
        param.add(stu_id);
       
        DBUntil db = new DBUntil();
        try {
            List<Session> list = db.quseryInfo(sql.toString(), param, Session.class);
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
    public List<Session> queryStu_name(int stu_id) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append("SELECT Student_name FROM student where Student_id = ? ");
  
        param.add(stu_id);
       
        DBUntil db = new DBUntil();
        try {
            List<Session> list = db.quseryInfo(sql.toString(), param, Session.class);
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
