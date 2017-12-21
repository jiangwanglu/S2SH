package com.pp.test.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.myapp.common.dao.BaseDaoImpl;
import com.pp.test.bo.Electric;
import com.pp.test.bo.Fuzai;

public class LoadFuzaiDaoImpl extends BaseDaoImpl<Fuzai, Integer> implements LoadFuzaiDao{

	public Fuzai loadData() throws Exception {
		return (Fuzai) this.get(2); 

	}
	
}
