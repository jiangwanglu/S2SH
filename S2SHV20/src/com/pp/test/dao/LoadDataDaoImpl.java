package com.pp.test.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import com.myapp.common.dao.BaseDaoImpl;
import com.pp.test.bo.AirElectric;
import com.pp.test.bo.Electric;
import com.pp.test.bo.Power;

public class LoadDataDaoImpl extends BaseDaoImpl<Electric, Integer> implements LoadDataDao{

	public ArrayList<Electric> loadData(String pro,String nex,String flag) throws Exception {
		String strsql="from Electric where time >=?and time<=? and machine=?";
		Object[] values=new String[]{pro,nex,flag};
		return (ArrayList<Electric>) this.find(strsql, values);

	}
	public List<String> loadmacData(String pro, String nex) throws Exception{
		// TODO Auto-generated method stub
		String strsql="select machine from electricalcurrent where time >=?and time<=? group by machine";
		
		return (List<String>) this.queryForList(strsql, new String[]{pro,nex}, String.class);
	}
	public ArrayList<AirElectric> loadAirData(String pro, String nex,
			String index) throws Exception {
		// TODO Auto-generated method stub
		String strsql="from AirElectric where time >=?and time<=? and machine=?"; 
		Object[] values=new String[]{pro,nex,index};
		return (ArrayList<AirElectric>) this.find(strsql, values);
	}
	public List loadpower() throws Exception {
		// TODO Auto-generated method stub
		String strsql="from Power";
		return (ArrayList<Power>)this.find(strsql);
	}
	
}
