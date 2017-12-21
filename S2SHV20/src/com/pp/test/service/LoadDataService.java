package com.pp.test.service;

import java.util.ArrayList;
import java.util.List;
import com.pp.test.bo.AirElectric;
import com.pp.test.bo.Electric;

public interface LoadDataService {
	ArrayList<AirElectric> loadAirData(String pro,String nex, String index) throws Exception;
	List<String> loadmacData(String pro, String nex) throws Exception;
	ArrayList<Electric> loadData(String pro, String nex, String flag) throws Exception;
	List loadPower()throws Exception;
}
