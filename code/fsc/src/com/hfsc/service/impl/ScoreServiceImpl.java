package com.hfsc.service.impl;

import java.util.List;

import com.hfsc.dao.ScoreDao;
import com.hfsc.dao.impl.ScoreDaoImpl;
import com.hfsc.model.Page;
import com.hfsc.model.Score;
import com.hfsc.service.ScoreService;

public class ScoreServiceImpl implements ScoreService {
	
	@Override
    public List<Score> queryScore(int id,Page page) {
		ScoreDao scoreDao = new ScoreDaoImpl();
        return scoreDao.queryScore(id,page);
        
	}
	@Override
    public List<Score> queryScoreByTeacher(int Class_ID, String Subject_name, Page page) {
		ScoreDao scoreDao = new ScoreDaoImpl();
        return scoreDao.queryScoreByTeacher(Class_ID,Subject_name,page);
        
	}
}
