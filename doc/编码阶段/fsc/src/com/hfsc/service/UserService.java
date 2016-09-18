package com.hfsc.service;

import java.util.List;

import com.hfsc.model.User;

public interface UserService {
    
   
    public void insertUser(User user);
    
    public void updateUser(User user);
    
   
    public void deleteUser(Long id);
    
   
    public List<User> queryUser(User user);
    
    
    public User queryUserByUserId(Long id);
    
}
