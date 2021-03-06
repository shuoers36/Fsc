package com.hfsc.dao.impl;


import java.util.ArrayList;
import java.util.List;




import com.hfsc.dao.AnnouncementDao;
import com.hfsc.model.Announcement;

//import com.hfsc.model.User;
//import com.hfsc.service.AnnouncementService;
import com.hfsc.until.DBUntil;

public class AnnouncementDaoImpl implements AnnouncementDao {

	@Override
	public void insertAnnouncement(Announcement announcement) {
		List<Object> param = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append("insert into Announcement (Announcement_id,User_id,Announcement_title,Announcement_content,Announcement_time)values (null,2333,?,?,now())");
		DBUntil db = new DBUntil();
		//param.add(announcement.getAnnouncement_id());
		//getClass().param.add(announcement.getUser_id());
		param.add(announcement.getAnnouncement_title());
		param.add(announcement.getAnnouncement_content());
		db.insertUpdateDeleteExute(sql.toString(),param);
		
	}

	/**@Override
	public void changeAnnouncement(Announcement announcement) {
		List<Object> param = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append(" update announcement set announcement_content = ? where announcement_id = ? ");
		DBUntil db = new DBUntil();
		param.add(announcement.getAnnouncement_id());
		param.add(announcement.getAnnouncement_content());
		param.add(announcement.getHomework_content());
		db.insertUpdateDeleteExute(sql.toString(), param);

		
	}**/
	
	
	

	@Override
	public void deleteAnnouncement(int id) {
		List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append(" delete from Announcement where Announcement_id = ? ");
        DBUntil db = new DBUntil();
        param.add(id);
        db.insertUpdateDeleteExute(sql.toString(), param);
		
	}

	@Override
	public List<Announcement> queryAnnouncement(int AnnouncementID) {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append("select * from announcement where 1=1 ");
 System.out.println("我就问你DAO层sql语句动不动");// 
        if (AnnouncementID!= -1) {
            sql.append("and announcement_id = ");
            sql.append(AnnouncementID);//连接语句
System.out.println("我就问你DAO层宣布选择announcement——id");  

        }
        
        
        
   
      
        DBUntil db = new DBUntil();
        try {

            List<Announcement> list = db.quseryInfo(sql.toString(), param, Announcement.class);
            
            System.out.println(list.get(0));//测试
            return list;
        } catch (InstantiationException e) {
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
	public List<Announcement> showAnnouncement() {
        List<Object> param = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append("select * from announcement");
 System.out.println("全部来嘛");
      
        DBUntil db = new DBUntil();
        try {

            List<Announcement> list = db.quseryInfo(sql.toString(), param, Announcement.class);
            
            //System.out.println(list.get(0));//测试
            return list;
        } catch (InstantiationException e) {
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
