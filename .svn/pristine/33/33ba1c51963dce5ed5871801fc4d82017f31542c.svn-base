package com.hfsc.service.impl;

import java.util.List;

import com.hfsc.dao.AttendanceDao;
import com.hfsc.dao.impl.AttendanceDaoImpl;
import com.hfsc.model.Attendance;
import com.hfsc.model.Page;
import com.hfsc.service.AttendanceService;

public class AttendanceServiceImpl implements AttendanceService{
	@Override
    public List<Attendance> queryAttendance(String name,Page page) {
		AttendanceDao attendanceDao = new AttendanceDaoImpl();
        return attendanceDao.queryAttendance(name,page);
        
    }


}
