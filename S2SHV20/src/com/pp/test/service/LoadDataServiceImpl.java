package com.pp.test.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.myapp.common.service.BaseServiceImpl;
import com.pp.test.bo.AirElectric;
import com.pp.test.bo.Electric;
import com.pp.test.dao.LoadDataDao;

public class LoadDataServiceImpl extends BaseServiceImpl implements LoadDataService{
	
	
	private LoadDataDao loadDataDao;                
	
	

	public void setLoadDataDao(LoadDataDao loadDataDao) {
		this.loadDataDao = loadDataDao;
	}



	public List<String> loadmacData(String pro, String nex) throws Exception{
		// TODO Auto-generated method stub
		return this.loadDataDao.loadmacData(pro, nex);
	}



	public ArrayList<Electric> loadData(String pro, String nex, String flag) throws Exception{
		// TODO Auto-generated method stub
		return this.loadDataDao.loadData(pro, nex,flag);
	}



	public ArrayList<AirElectric> loadAirData(String pro, String nex,
			String index) throws Exception {
		// TODO Auto-generated method stub
		return this.loadDataDao.loadAirData(pro, nex,index);
	}



	public List loadPower() throws Exception {
		// TODO Auto-generated method stub
		return this.loadDataDao.loadpower();
	}




	
	

}
