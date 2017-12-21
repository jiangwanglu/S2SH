package com.pp.test.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import net.sf.json.JSONArray;
import com.pp.test.bo.Electric;
import com.pp.test.service.LoadDianService;

public class LoadDianliangAction {
	
	private LoadDianService loadDianService;
	public String result;
	//private Electric electric;
	 
    public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
	
	public String open()throws Exception{
        return "success";  
    }
    public String load()throws Exception{
    	List ls=new ArrayList<Electric>();
    	
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	Date date1 = sdf.parse("2016-10-8");
    	Date date2 = sdf.parse("2016-11-8");
    	System.out.println("date:"+date1);
    	ls=this.loadDianService.loadData(date1,date2);
    	result =JSONArray.fromObject(ls).toString();
    	System.out.println("result:"+result);
        return "loaddianliang_success";  
    }
	public void setLoadDianService(LoadDianService loadDianService) {
		this.loadDianService = loadDianService;
	}
}
