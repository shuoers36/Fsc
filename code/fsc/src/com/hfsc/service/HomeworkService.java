package com.hfsc.service;

import java.util.List;

import com.hfsc.model.Homework;
import com.hfsc.model.Page;

public interface HomeworkService {

	public void insertHomework(Homework homework);

	public void changeHomework(Homework homework);

	public void deleteHomework(int id);

	public List<Homework> queryHomework(int id, Page page);

	List<Homework> queryHomeworkByTeacher(String Subject_name, Page page);

}
