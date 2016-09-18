package com.hfsc.dao;

import java.util.List;

import com.hfsc.model.Homework;
import com.hfsc.model.Page;

public interface HomeworkDao {

	public void insertHomework(Homework homework);

	public void changeHomework(Homework homework);

	public void deleteHomework(int id);

	public List<Homework> queryHomework(int homeworkID, Page page);

	public List<Homework> queryHomeworkByTeacher(String Subject_name, Page page);

}
