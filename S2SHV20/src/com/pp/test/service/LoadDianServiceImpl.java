package com.pp.test.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.myapp.common.service.BaseServiceImpl;
import com.pp.test.bo.Dianlang;
import com.pp.test.bo.Electric;
import com.pp.test.dao.LoadDataDao;
import com.pp.test.dao.LoadDianDao;

public class LoadDianServiceImpl extends BaseServiceImpl implements LoadDianService{
	
	
	private LoadDianDao loadDianDao;



	public void setLoadDianDao(LoadDianDao loadDianDao) {
		this.loadDianDao = loadDianDao;
	}







	public ArrayList<Dianlang> loadData(Date pro,Date nex) throws Exception {
		// TODO Auto-generated method stub 

		return  this.loadDianDao.loadData(pro,nex);
		
	}
	
	

}
