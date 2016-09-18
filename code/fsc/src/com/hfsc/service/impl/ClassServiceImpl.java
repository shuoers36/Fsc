package com.hfsc.service.impl;

import java.util.List;

import com.hfsc.dao.ClassDao;
import com.hfsc.dao.impl.ClassDaoImpl;
import com.hfsc.model.Class;
import com.hfsc.model.Page;
import com.hfsc.service.ClassService;

public class ClassServiceImpl implements ClassService{
	
	@Override
    public void insertClass(Class alass) {
        ClassDao classDao = new ClassDaoImpl();
        classDao.insertClass(alass);
    }

	@Override
    public void deleteClass(int id) {
        ClassDao classDao = new ClassDaoImpl();
        classDao.deleteClass(id);
        
    }
	@Override
    public List<Class> queryClass(Page page) {
        ClassDao classDao = new ClassDaoImpl();
        return classDao.queryClass(page);
        
    }
	
}
