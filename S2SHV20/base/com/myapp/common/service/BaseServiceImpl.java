package com.myapp.common.service;

import com.myapp.common.dao.IBaseDao;

/**
 * @author 刘文铭
 * @返回值
 * Mar 20, 2012
 */
public class BaseServiceImpl implements IBaseService {
    
    private IBaseDao baseDao;

    /**
     * @return the baseDao
     */
    public IBaseDao getBaseDao() {
        return baseDao;
    }

    /**
     * @param baseDao the baseDao to set
     */
    public void setBaseDao(IBaseDao baseDao) {
        this.baseDao = baseDao;
    }
    

}
