package com.hfsc.service.impl;

import java.util.List;

import com.hfsc.dao.MessageDao;
import com.hfsc.dao.MessageDao;
import com.hfsc.dao.impl.MessageDaoImpl;
import com.hfsc.dao.impl.MessageDaoImpl;
import com.hfsc.model.Message;
import com.hfsc.service.MessageService;

public class MessageServiceImpl implements MessageService {

	@Override
	public void sendMessage(Message message) {
		MessageDao messageDao = new MessageDaoImpl();
        messageDao.sendMessage(message);

	}

	@Override
	public void deleteMessage(Long id) {
		 MessageDao messageDao = new MessageDaoImpl();
	        messageDao.deleteMessage(id);

	}

	@Override
	public List<Message> queryMessage(String name) {
		MessageDao messageDao = new MessageDaoImpl();
        return messageDao.queryMessage(name);
 
	}

	@Override
	public List<Message> showDetil(long message_id) {
		MessageDao messageDao = new MessageDaoImpl();
        return messageDao.showDetil(message_id);
	}

	@Override
	public List<Message> query1Message(String query) {
		MessageDao messageDao = new MessageDaoImpl();
        return messageDao.query1Message(query);
	}

}