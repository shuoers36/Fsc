package com.hfsc.dao;

import java.util.List;

import com.hfsc.model.Attendance;
import com.hfsc.model.Honor;
import com.hfsc.model.Page;

public interface HonorDao {

	
	List<Honor> queryHonor(int student_id, Page page);

}
