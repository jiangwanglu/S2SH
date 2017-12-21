package com.pp.test.service;

import com.myapp.common.service.BaseServiceImpl;
import com.pp.test.bo.User;
import com.pp.test.dao.IUserDao;

public class UserServiceImpl extends BaseServiceImpl implements IUserService {
    
    private IUserDao userDao ;

    /**
     * @param userDao the userDao to set
     */
    public void setUserDao(IUserDao userDao) {
        this.userDao = userDao;
    }

    public void addUser(User user) throws Exception {
	this.userDao.addUser(user);
	
    }
    
    

}
