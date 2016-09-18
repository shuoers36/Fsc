package com.hfsc.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.hfsc.dao.ScoreDao;
import com.hfsc.model.Page;
import com.hfsc.model.Score;
import com.hfsc.until.DBUntil;

public class ScoreDaoImpl implements ScoreDao {

	@Override
	public List<Score> queryScore(int StudentID, Page page) {
		List<Object> param = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append(" select * from score where 1=1 ");

		if (StudentID != -1) {
			sql.append("and Student_id = ");
			sql.append(StudentID);

		}
		sql.append(" limit ");
		sql.append(page.getPage() * 10 - 10);
		sql.append(" , ");
		sql.append(10);
		DBUntil db = new DBUntil();
		try {

			List<Score> list = db.quseryInfo(sql.toString(), param, Score.class);
			return list;
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public List<Score> queryScoreByTeacher(int Class_id, String Subject_name, Page page) {
		List<Object> param = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append(
				"select Student_name,Score,Score_time from student JOIN score  on student.Student_id=score.Student_id and score.Subject_name= ? ");

		param.add(Subject_name);

		if (Class_id != -1) {
			sql.append(" and student.Class_id = ? ");
			// sql.append(Class_id);
			param.add(Class_id);
		}
		sql.append(" limit ");
		sql.append(page.getPage() * 10 - 10);
		sql.append(" , ");
		sql.append(10);

		String sql1 = sql.toString();
		System.out.println(sql1);
		DBUntil db = new DBUntil();

		try {
			List<Score> list = db.quseryInfo(sql.toString(), param, Score.class);

			return list;

		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;

	}

}
