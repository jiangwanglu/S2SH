package com.pp.test.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.myapp.common.dao.BaseDaoImpl;
import com.pp.test.bo.Dianlang;
import com.pp.test.bo.Electric;

public class LoadDianDaoImpl extends BaseDaoImpl<Electric, Integer> implements LoadDianDao{

	public ArrayList<Dianlang> loadData(Date pro,Date nex) throws Exception {
		System.out.println("daodate:"+pro.toString()+"//"+nex.toString());
		System.out.println("count"+this.queryForLong("select count(1) count from dateElect"));
		String strsql="from Dianlang where date >?and date<?";
		Object[] values=new Date[]{pro,nex};
		return (ArrayList<Dianlang>) this.find(strsql, values);

	}
	
}
