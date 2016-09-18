package com.hfsc.service;

import java.util.List;

import com.hfsc.model.Message;
import com.hfsc.model.User;

public interface  MessageService {
    
	public void sendMessage(Message message);
   
    public void deleteMessage(Long id);
   
    public List<Message> queryMessage(String name);

	public List<Message> showDetil(long parseInt);

	public List<Message> query1Message(String query);

}