package com.hfsc.dao;

import java.util.List;

import com.hfsc.model.Attendance;
import com.hfsc.model.Page;

public interface AttendanceDao {



	List<Attendance> queryAttendance(String name, Page page);

}
