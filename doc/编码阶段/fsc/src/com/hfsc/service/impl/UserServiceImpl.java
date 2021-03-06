package com.hfsc.service.impl;

import java.util.List;

import com.hfsc.dao.UserDao;
import com.hfsc.dao.impl.UserDaoImpl;
import com.hfsc.model.User;
import com.hfsc.service.UserService;

public class UserServiceImpl implements UserService {
    
    @Override
    public void insertUser(User user) {
        UserDao userDao = new UserDaoImpl();
        userDao.insertUser(user);
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
    public List<User> queryUser(User user) {
        UserDao userDao = new UserDaoImpl();
        return userDao.queryUser(user);
    }
    
    @Override
    public User queryUserByUserId(Long id) {
        UserDao userDao = new UserDaoImpl();
        User user = new User();
        user.setId(id);
        List<User> list = userDao.queryUser(user);
        return list.get(0);
    }
    
}
