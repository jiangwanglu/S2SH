package com.pp.test.bo;

import java.io.Serializable;
import java.util.Date;

public class AirElectric implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8280846003742985910L;
	
	private int ID;
	private String dianliuA;
	private String dianliuB;
	private String dianliuC;
	private String time;
	private String machine;
	
	public int getID() {
		return ID;
		
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getDianliuA() {
		return dianliuA;
	}
	public void setDianliuA(String dianliuA) {
		this.dianliuA = dianliuA;
	}
	public String getDianliuB() {
		return dianliuB;
	}
	public void setDianliuB(String dianliuB) {
		this.dianliuB = dianliuB;
	}
	public String getDianliuC() {
		return dianliuC;
	}
	public void setDianliuC(String dianliuC) {
		this.dianliuC = dianliuC;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getMachine() {
		return machine;
	}
	public void setMachine(String machine) {
		this.machine = machine;
	}
	
	
	
}
