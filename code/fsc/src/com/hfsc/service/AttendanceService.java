package com.hfsc.service;

import java.util.List;

import com.hfsc.model.Attendance;
import com.hfsc.model.Page;

public interface AttendanceService {



	List<Attendance> queryAttendance(String name, Page page);

}
