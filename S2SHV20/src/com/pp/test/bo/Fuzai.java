package com.pp.test.bo;

import java.io.Serializable;
import java.util.Date;

public class Fuzai implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int ID;
	private String dianliu;
	
	
	public int getID() {
		return ID;
		
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getDianliu() {
		return dianliu;
	}
	public void setDianliu(String dianliu) {
		this.dianliu = dianliu;
	}
	
	
	

}
