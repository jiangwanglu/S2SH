package com.pp.test.bo;

import java.io.Serializable;

public class xue implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -18911597267804229L;
	
	private String id;
	private String name;
	private String cla;
	private String sex;
	private String tel;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCla() {
		return cla;
	}
	public void setCla(String cla) {
		this.cla = cla;
	}
	
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	

}
