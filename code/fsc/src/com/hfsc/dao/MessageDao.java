package com.hfsc.dao;

import java.util.List;
import com.hfsc.model.Message;
import com.hfsc.model.User;
public interface MessageDao {
    
	   
    public void sendMessage(Message message);
    
  
    public List<Message> showDetil(Long id);
   
    public void deleteMessage(Long id);
   
    public List<Message> queryMessage(String name);  //查看已发送留言
    
    public List<Message> query1Message(String name); //查看已接受留言

   
    
    
}
