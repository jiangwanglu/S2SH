package com.pp.test.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.myapp.common.dao.IBaseDao;
import com.pp.test.bo.Electric;
import com.pp.test.bo.Fuzai;

public interface LoadFuzaiDao extends IBaseDao{
	 Fuzai loadData()throws Exception;
}
