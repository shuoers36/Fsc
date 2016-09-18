package com.hfsc.service.impl;

import java.util.List;

import com.hfsc.dao.HonorDao;
import com.hfsc.dao.impl.HonorDaoImpl;
import com.hfsc.model.Honor;
import com.hfsc.model.Page;
import com.hfsc.service.HonorService;

public class HonorServiceImpl implements HonorService{
	@Override
    public List<Honor> queryHonor(int name,Page page) {
		HonorDao honorDao = new HonorDaoImpl();
        return honorDao.queryHonor(name,page);
        
    }


}
