package com.pp.test.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.myapp.common.dao.IBaseDao;
import com.pp.test.bo.Dianlang;
import com.pp.test.bo.Electric;

public interface LoadDianDao extends IBaseDao{
	 ArrayList<Dianlang> loadData(Date pro,Date nex)throws Exception;
}
