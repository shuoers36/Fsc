package com.hfsc.dao;

import java.util.List;

import com.hfsc.model.Page;
import com.hfsc.model.Score;

public interface ScoreDao {

	
	public List<Score> queryScore(int StudentID, Page page);

	

	public List<Score> queryScoreByTeacher(int Class_ID, String Subject_name, Page page);

}
