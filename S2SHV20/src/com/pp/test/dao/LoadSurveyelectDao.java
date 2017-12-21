package com.pp.test.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.myapp.common.dao.IBaseDao;
import com.pp.test.bo.AirSurveyelect;
import com.pp.test.bo.Alarmifo;
import com.pp.test.bo.Dianlang;
import com.pp.test.bo.Nownh;
import com.pp.test.bo.Power;
import com.pp.test.bo.Surveyelect;
import com.pp.test.bo.Test;

public interface LoadSurveyelectDao extends IBaseDao{
	 ArrayList<Surveyelect> loadData(String date, String flag)throws Exception;
	 ArrayList<AirSurveyelect> loadAirData(String date, String flag)throws Exception;
	List<String> loadmac(String req)throws Exception;
	List<Dianlang> loadnh(String proMonth, String lastMonth)throws Exception;
	List<Nownh> loadnownh(String time)throws Exception;
	List<Dianlang> loadyearnh(String format, String format2)throws Exception;
	List loadalarmdata(String req)throws Exception;
	List<String> loadairmac(String req)throws Exception;
	List<Power> loadPower(String month, String year)throws Exception;
	//报警
	List<String> baoj(String start, String end) throws Exception;
	List<Long> baoj1(String start, String end)throws Exception;
	
	//数量
	int baos(String start, String end) throws Exception;
	Test nh(String start, String end) throws Exception;
}
