package com.pp.test.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.myapp.common.service.BaseServiceImpl;
import com.pp.test.bo.AirSurveyelect;
import com.pp.test.bo.Alarmifo;
import com.pp.test.bo.Dianlang;
import com.pp.test.bo.Electric;
import com.pp.test.bo.Nownh;
import com.pp.test.bo.Power;
import com.pp.test.bo.Surveyelect;
import com.pp.test.bo.Test;
import com.pp.test.dao.LoadDataDao;
import com.pp.test.dao.LoadSurveyelectDao;

public class LoadSurveyelectServiceImpl extends BaseServiceImpl implements LoadSurveyelectService{
	
	               
	private LoadSurveyelectDao loadSurveyelectDao;


	public void setLoadSurveyelectDao(LoadSurveyelectDao loadSurveyelectDao) {
		this.loadSurveyelectDao = loadSurveyelectDao;
	}


	/*public ArrayList<AirSurveyelect> loadAirData(String date) throws Exception {
		// TODO Auto-generated method stub
		return this.loadSurveyelectDao.loadAirData(date);
	}*/


	public ArrayList<Surveyelect> loadData(String date, String flag)
			throws Exception {
		// TODO Auto-generated method stub
		return this.loadSurveyelectDao.loadData(date,flag);
	}


	public List<String> loadmacData(String req) throws Exception {
		// TODO Auto-generated method stub
		return this.loadSurveyelectDao.loadmac(req);
	}

	public List<Dianlang> loadnh(String proMonth, String lastMonth)
			throws Exception {
		// TODO Auto-generated method stub
		return this.loadSurveyelectDao.loadnh(proMonth,lastMonth);
	}


	public List<Nownh> loadnowng(String time) throws Exception {
		// TODO Auto-generated method stub
		return this.loadSurveyelectDao.loadnownh(time);
	}


	public List<Dianlang> loadyearnh(String format, String format2)
			throws Exception {
		// TODO Auto-generated method stub
		return this.loadSurveyelectDao.loadyearnh(format,format2);
	}


	public List loadAlarmData(String req) throws Exception {
		// TODO Auto-generated method stub
		return this.loadSurveyelectDao.loadalarmdata(req);
	}


	public List<String> loadairmacData(String req) throws Exception {
		// TODO Auto-generated method stub
		return this.loadSurveyelectDao.loadairmac(req);
	}


	public ArrayList<AirSurveyelect> loadAirData(String date, String flag)
			throws Exception {
		// TODO Auto-generated method stub
		return this.loadSurveyelectDao.loadAirData(date,flag);
	}


	public List<Power> loadpower(String month, String year) throws Exception {
		// TODO Auto-generated method stub
		return this.loadSurveyelectDao.loadPower(month,year);
	}


	public List<String>  baoj(String start, String end) throws Exception {
		return this.loadSurveyelectDao.baoj(start,end);
	}
	
	public List<Long>  baoj1(String start, String end) throws Exception {
		return this.loadSurveyelectDao.baoj1(start,end);
	}


	public int baos(String start, String end) throws Exception {
		return this.loadSurveyelectDao.baos(start,end);
	}


	public Test nh(String start,String end) throws Exception {
		return this.loadSurveyelectDao.nh(start,end);
	}
}