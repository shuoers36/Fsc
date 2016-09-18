package com.hfsc.service.impl;

import java.util.List;

import com.hfsc.dao.HomeworkDao;
import com.hfsc.dao.UserDao;
import com.hfsc.dao.impl.HomeworkDaoImpl;
import com.hfsc.dao.impl.UserDaoImpl;
import com.hfsc.model.Homework;
import com.hfsc.model.Page;
import com.hfsc.service.HomeworkService;

public class HomeworkServiceImpl implements HomeworkService{
	
	@Override
    public void insertHomework(Homework homework) {
        HomeworkDao homeworkDao = new HomeworkDaoImpl();
        homeworkDao.insertHomework(homework);
    }
	@Override
    public void changeHomework(Homework homework) {
        HomeworkDao homeworkDao = new HomeworkDaoImpl();
        homeworkDao.changeHomework(homework);
    }

	@Override
    public void deleteHomework(int id) {
        HomeworkDao homeworkDao = new HomeworkDaoImpl();
        homeworkDao.deleteHomework(id);
        
    }
	@Override
    public List<Homework> queryHomework(int id,Page page) {
        HomeworkDao homeworkDao = new HomeworkDaoImpl();
        return homeworkDao.queryHomework(id,page);
        
    }
	@Override
    public List<Homework> queryHomeworkByTeacher(String Subject_name,Page page) {
        HomeworkDao homeworkDao = new HomeworkDaoImpl();
        return homeworkDao.queryHomeworkByTeacher(Subject_name, page);
        
    }
}