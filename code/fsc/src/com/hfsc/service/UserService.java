package com.hfsc.service;

import java.util.List;

import com.hfsc.model.User;

import com.hfsc.model.Page;
import com.hfsc.model.Session;

public interface UserService {
    
   
    public void insertUser(User user);
    
    public void updateUser(User user);
    
   
    public void deleteUser(Long id);
    
   
    public List<User> queryUser(User user,Page page);
    
    
    public User queryUserByUserId(Long id);
    
    public User queryUserByName(String name);

	List<User> queryRole(User user);

	List<User> queryResource(String role_name);

	List<Session> queryClass_id(String teacher_name);

	List<Session> querySubject_name(String teacher_name);

	List<Session> queryClass_idByStu(String student_name);

	List<Session> queryStu_idByParent(String parent_name);

	List<Session> queryClass_idByStu_id(int stu_id);

	List<Session> queryStu_name(int stu_id);

	void insertParent(int stu_id, String user_name, String password);

	void insertLeader(User user);

	void insertTeacher(User user, int Class_id);

	void insertStudent(User user, int Class_id);

	List<User> queryUser_id(String user_name);

	void insertUser_role(int User_id, int Role_id);

	List<User> queryUserForLogin(User user);

	List<Session> queryTeacher_id(String teacher_name);

	void insertTeacher_subject(int Teacher_id, String subject_name);

	List<Session> queryStu_idByStu_name(String student_name);
    
    /*public Long getNowId(User user);*/
    
}
