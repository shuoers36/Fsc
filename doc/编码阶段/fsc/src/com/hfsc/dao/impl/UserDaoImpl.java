package com.hfsc.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

import com.hfsc.dao.UserDao;
import com.hfsc.model.User;
import com.hfsc.until.DBUntil;
public class UserDaoImpl implements UserDao {
    
    @Override
    public void insertUser(User user) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append(" insert into user (User_id2,User_name,User_password) values (?,?,?) ");
        DBUntil db = new DBUntil();
        db.mid++;
        param.add(user.getId());
        param.add(user.getUserName());
        param.add(user.getPassword());
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
    public List<User> queryUser(User user) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append(" select * from user where 1=1 ");
  
        if (0 != user.getId()) {
            sql.append("and User_id2 = ? ");
            param.add(user.getId());
        }
        if ("".equals(user.getUserName())) {
            sql.append(" and User_name like '%?%' ");
            param.add(user.getUserName());
        }
      
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
    
    

	}
