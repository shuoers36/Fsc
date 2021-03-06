package com.hfsc.service.impl;

import java.util.List;

import com.hfsc.dao.UserDao;
import com.hfsc.dao.impl.UserDaoImpl;
import com.hfsc.model.User;
import com.hfsc.model.Page;
import com.hfsc.model.Session;
import com.hfsc.service.UserService;

public class UserServiceImpl implements UserService {
    
    @Override
    public void insertUser(User user) {
        UserDao userDao = new UserDaoImpl();
        userDao.insertUser(user);
    }
    @Override
    public void insertLeader(User user) {
        UserDao userDao = new UserDaoImpl();
        userDao.insertLeader(user);
    }
    @Override
    public void insertUser_role(int User_id, int Role_id) {
        UserDao userDao = new UserDaoImpl();
        userDao.insertUser_role(User_id, Role_id);
    }
    @Override
    public void insertTeacher_subject(int Teacher_id, String subject_name) {
        UserDao userDao = new UserDaoImpl();
        userDao.insertTeacher_subject(Teacher_id, subject_name);
    }
    @Override
    public void insertTeacher(User user,int Class_id) {
        UserDao userDao = new UserDaoImpl();
        userDao.insertTeacher(user, Class_id);
    }
    @Override
    public List<User> queryUser_id(String user_name) {
        UserDao userDao = new UserDaoImpl();
        return userDao.queryUser_id(user_name);
    }
    @Override
    public List<Session> queryTeacher_id(String teacher_name) {
        UserDao userDao = new UserDaoImpl();
        return userDao.queryTeacher_id(teacher_name);
    }
    @Override
    public void insertStudent(User user,int Class_id) {
        UserDao userDao = new UserDaoImpl();
        userDao.insertStudent(user, Class_id);
    }
    @Override
    public void insertParent(int stu_id, String user_name, String password) {
        UserDao userDao = new UserDaoImpl();
        userDao.insertParent(stu_id, user_name, password);
    }
    
    @Override
    public void updateUser(User user) {
        UserDao userDao = new UserDaoImpl();
        userDao.updateUser(user);
        
    }
    
    @Override
    public void deleteUser(Long id) {
        UserDao userDao = new UserDaoImpl();
        userDao.deleteUser(id);
        
    }
    
    @Override
    public List<User> queryUser(User user,Page page) {
        UserDao userDao = new UserDaoImpl();
        return userDao.queryUser(user,page);
    }
    @Override
    public List<User> queryRole(User user) {
        UserDao userDao = new UserDaoImpl();
        return userDao.queryRole(user);
    }
    @Override
    public List<Session> queryClass_id(String teacher_name) {
        UserDao userDao = new UserDaoImpl();
        return userDao.queryClass_id(teacher_name);
    }
    @Override
    public List<Session> querySubject_name(String teacher_name) {
        UserDao userDao = new UserDaoImpl();
        return userDao.querySubject_name(teacher_name);
    }
    @Override
    public List<Session> queryClass_idByStu(String student_name) {
        UserDao userDao = new UserDaoImpl();
        return userDao.queryClass_idByStu(student_name);    
    }
    @Override
    public List<Session> queryStu_idByStu_name(String student_name) {
        UserDao userDao = new UserDaoImpl();
        return userDao.queryStu_idByStu_name(student_name);    
    }
    @Override
    public List<Session> queryClass_idByStu_id(int stu_id) {
        UserDao userDao = new UserDaoImpl();
        return userDao.queryClass_idByStu_id(stu_id);
    }
    @Override
    public List<Session> queryStu_idByParent(String parent_name) {
        UserDao userDao = new UserDaoImpl();
        return userDao.queryStu_idByParent(parent_name);
        
    }
    @Override
    public List<Session> queryStu_name(int stu_id) {
        UserDao userDao = new UserDaoImpl();
        return userDao.queryStu_name(stu_id);
    }
    @Override
    public List<User> queryResource(String role_name) {
        UserDao userDao = new UserDaoImpl();
        return userDao.queryResource(role_name);
    }
    @Override
    public List<User> queryUserForLogin(User user) {
        UserDao userDao = new UserDaoImpl();
        return userDao.queryUserForLogin(user);
    }
    
    @Override
    public User queryUserByUserId(Long id) {
        UserDao userDao = new UserDaoImpl();
        User user = new User();
        Page page = new Page();
        user.setId(id);
        page.setPage(1);
        List<User> list = userDao.queryUser(user,page);
        if (0 == list.size()) {
        	user = new User();
        	return user;
        }
        else {
        	return list.get(0);
        }
    }
    @Override
    public User queryUserByName(String name) {
        UserDao userDao = new UserDaoImpl();
        User user = new User();
        Page page = new Page();
        page.setPage(1);
        user.setUserName(name);
        List<User> list = userDao.queryUser(user,page);
        if (0 == list.size()) {
        	user = new User();
        	return user;
        }
        else {
        	return list.get(0);
        }
        
    }
    /* @Override
    public Long getNowId(User user) {
    	UserDao userDao = new UserDaoImpl();
    	Page page = new Page();
        page.setPage(1);
        List<User> list = userDao.queryUser(user,page);
        return  list.get(list.size()-1).getId(); 
    }*/
}
