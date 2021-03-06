package com.hfsc.dao.impl;

import java.util.ArrayList;
import java.util.List;


import com.hfsc.dao.MessageDao;
import com.hfsc.model.Message;
import com.hfsc.model.User;
import com.hfsc.service.MessageService;
import com.hfsc.until.DBUntil;

public class MessageDaoImpl implements MessageDao {

	@Override
	public void sendMessage(Message message) {
		List<Object> param = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into Message (Message_id,Addresser_name,Addressee_name,Message_title,Message_content,Message_time) values (null,?,?,?,?,now()) ");
		DBUntil db = new DBUntil();
		param.add(message.getAddresser_name());
		param.add(message.getAddressee_name());
		param.add(message.getMessage_title());
		param.add(message.getMessage_content());
		db.insertUpdateDeleteExute(sql.toString(), param);


	}


	@Override
	public void deleteMessage(Long id) {
		List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append(" delete from Message where Message_id = ? ");
        DBUntil db = new DBUntil();
        param.add(id);
        db.insertUpdateDeleteExute(sql.toString(), param);

	}

	@Override
	public List<Message> queryMessage(String name) {
		List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append("select * from message where Addresser_name = '"+name+"'");
        System.out.println("heha");
        DBUntil db = new DBUntil();
        try {

            List<Message> list = db.quseryInfo(sql.toString(), param, Message.class);
            
            //System.out.println(list.get(0));
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


	@Override
	public List<Message> showDetil(Long id) {
		List<Object> param = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append("select * from message where message_id=?");
		DBUntil db = new DBUntil();
		param.add(id);
		try {

            List<Message> list = db.quseryInfo(sql.toString(), param, Message.class);
            
            //System.out.println(list.get(0));
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


	@Override
	public List<Message> query1Message(String name) {
		List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append("select * from message where Addressee_name = '" +name+"'");
        System.out.println("hehe");
        DBUntil db = new DBUntil();
        try {

            List<Message> list = db.quseryInfo(sql.toString(), param, Message.class);
            
            //System.out.println(list.get(0));
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

