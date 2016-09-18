package com.hfsc.service.impl;

import java.util.List;

import com.hfsc.model.Announcement;
//import java.util.List;

import com.hfsc.dao.AnnouncementDao;
//import com.hfsc.dao.UserDao;
import com.hfsc.dao.impl.AnnouncementDaoImpl;
//import com.hfsc.dao.impl.UserDaoImpl;

import com.hfsc.service.AnnouncementService;


public class AnnouncementServiceImpl implements AnnouncementService{
	
	@Override
    public void insertAnnouncement(Announcement announcement) {
		AnnouncementDao announcementDao = new AnnouncementDaoImpl();
		announcementDao.insertAnnouncement(announcement);
    }

	@Override
	public void deleteAnnouncement(int id) {
		AnnouncementDao announcementDao = new AnnouncementDaoImpl();
		announcementDao.deleteAnnouncement(id);
		
	}
	@Override
	public List<Announcement> queryAnnouncement(int id) {
		AnnouncementDao homeworkDao = new AnnouncementDaoImpl();
	    return homeworkDao.queryAnnouncement(id);
	}
	@Override
	public List<Announcement> showAnnouncement() {
		AnnouncementDao homeworkDao = new AnnouncementDaoImpl();
	    return homeworkDao.showAnnouncement();
	}

  
}
