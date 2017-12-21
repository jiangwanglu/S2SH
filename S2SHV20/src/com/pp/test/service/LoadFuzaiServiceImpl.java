package com.pp.test.service;


import com.myapp.common.service.BaseServiceImpl;
import com.pp.test.bo.Fuzai;
import com.pp.test.dao.LoadFuzaiDao;

public class LoadFuzaiServiceImpl extends BaseServiceImpl implements LoadFuzaiService{
	
	
	private LoadFuzaiDao loadFuzaiDao;                
	
	
	public void setLoadFuzaiDao(LoadFuzaiDao loadFuzaiDao) {
		this.loadFuzaiDao = loadFuzaiDao;
	}

	public Fuzai loadData() throws Exception {
		// TODO Auto-generated method stub 

		return  this.loadFuzaiDao.loadData();
		
	}
	

}
