package com.pp.test.dao;

import java.util.ArrayList;
import java.util.List;
import com.myapp.common.dao.IBaseDao;
import com.pp.test.bo.AirElectric;
import com.pp.test.bo.Electric;

public interface LoadDataDao extends IBaseDao{
	ArrayList<AirElectric> loadAirData(String pro,String nex, String index)throws Exception;
	List<String> loadmacData(String pro, String nex) throws Exception;
	ArrayList<Electric> loadData(String pro, String nex, String flag)throws Exception;
	List loadpower()throws Exception;
}
