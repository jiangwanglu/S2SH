package com.pp.test.service;

import java.util.ArrayList;
import java.util.Date;

import com.pp.test.bo.Dianlang;
import com.pp.test.bo.Electric;


public interface LoadDianService {
	
	ArrayList<Dianlang> loadData(Date pro,Date nex) throws Exception;

}
