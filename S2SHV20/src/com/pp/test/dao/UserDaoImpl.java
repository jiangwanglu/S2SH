    package com.pp.test.dao;

import com.myapp.common.dao.BaseDaoImpl;
import com.pp.test.bo.User;
import com.pp.test.service.IUserService;

@SuppressWarnings("unchecked")
public class UserDaoImpl extends BaseDaoImpl implements IUserDao {


    public void addUser(User user) throws Exception { 
	
	System.out.println(this.queryForLong("select count(1) count from demo_user"));
	
	this.save(user); 
    }

}