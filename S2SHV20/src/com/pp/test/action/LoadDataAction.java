package com.pp.test.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.util.TreeMap;

import javax.print.attribute.standard.DateTimeAtCompleted;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import sun.font.EAttribute;
import net.sf.json.JSONArray;
import com.opensymphony.xwork2.ActionContext;
import com.pp.test.bo.AirElectric;
import com.pp.test.bo.AirSurveyelect;
import com.pp.test.bo.Alarmifo;
import com.pp.test.bo.Dianlang;
import com.pp.test.bo.Electric;
import com.pp.test.bo.Fuzai;
import com.pp.test.bo.Nownh;
import com.pp.test.bo.Power;
import com.pp.test.bo.Surveyelect;
import com.pp.test.bo.Test;
import com.pp.test.bo.xue;
import com.pp.test.service.LoadDataService;
import com.pp.test.service.LoadFuzaiService;
import com.pp.test.service.LoadSurveyelectService;

public class LoadDataAction implements ServletRequestAware{
	
	private LoadDataService loadDataService;
	private LoadFuzaiService loadFuzaiService;
	private LoadSurveyelectService loadSurveyelectService;
	public String result;//ajax返回参数
	//private Electric electric;
	private HttpServletRequest request;
	
	
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.request = arg0;
	} 
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String open()throws Exception{
        return "success";  
    }
	public String loadmac()throws Exception{
		String req=request.getParameter("time");
    	SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	Date tempdate=format.parse(req);
    	String date1=format.format(new Date(tempdate.getTime()-30*1000));
    	String date2=format.format(new Date(tempdate.getTime()+30*1000));
    	List<String> ls=this.loadDataService.loadmacData(date1, date2);
    	result = JSONArray.fromObject(ls).toString();
		return "load_success";
	}
    public String load()throws Exception{
    	String req=request.getParameter("time");
    	String flag=request.getParameter("flag");
    	SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	Date tempdate=format.parse(req);
    	String date1=format.format(new Date(tempdate.getTime()-30*1000));
    	String date2=format.format(new Date(tempdate.getTime()+30*1000));
    	ArrayList<Electric> ls=new ArrayList<Electric>();
    	ls=this.loadDataService.loadData(date1, date2,flag);
    	result =JSONArray.fromObject(ls).toString();
        return "load_success";  
    }
    public String loadAir()throws Exception{
    	String req=request.getParameter("time");
    	String index=request.getParameter("flag");
    	SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	Date tempdate=format.parse(req);
    	String date1=format.format(new Date(tempdate.getTime()-30*1000));
    	String date2=format.format(new Date(tempdate.getTime()+30*1000));
    	List ls=new ArrayList<AirElectric>();
    	ls=this.loadDataService.loadAirData(date1, date2,index);
    	result =JSONArray.fromObject(ls).toString();
    	
        return "load_success";  
    }
    
    public String fuzai()throws Exception{
    	Fuzai e=new Fuzai();
    	e=this.loadFuzaiService.loadData();
    	result = "{\"x\":\"" + e.getDianliu()+"\"}";
		return "fuzai_success";
    	
    }
    public String surveymac()throws Exception{
		String req=request.getParameter("time");
    	List<String> ls=this.loadSurveyelectService.loadmacData(req);
    	result = JSONArray.fromObject(ls).toString();
		return "survey_success";
	}
    public String surveyairmac()throws Exception{
		String req=request.getParameter("time");
    	List<String> ls=this.loadSurveyelectService.loadairmacData(req);
    	result = JSONArray.fromObject(ls).toString();
		return "survey_success";
	}
    public String surveynh1() throws Exception{
    	SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
    	String timeindex=request.getParameter("timeindex");
    	String datetime = request.getParameter("datetime")+"-01";//获取到穿过来的日期 
    	Date da = format.parse(datetime);
    	Calendar calendar = Calendar.getInstance();
    	calendar.setTime(da);
    	calendar.add(Calendar.MONTH, Integer.parseInt(timeindex));
        Date m = calendar.getTime();
        String start = format.format(m);
        Calendar calendar1 = Calendar.getInstance();
        calendar1.setTime(m); 
        calendar1.add(Calendar.MONTH, 1);
        calendar1.add(Calendar.DAY_OF_MONTH, -1);
    	Date end = calendar1.getTime();
    	System.out.println(format.format(end));
    	Calendar   calendar3   =   new   GregorianCalendar(); 
    	calendar3.setTime(end); 
    	calendar3.add(calendar.DATE,1);
    	end=calendar3.getTime();
    	List<Dianlang> ls=this.loadSurveyelectService.loadnh(start,format.format(end));

    	Dianlang dianlan = new Dianlang();
    	Dianlang ends = ls.get(ls.size() - 1);
    	Dianlang starts = ls.get(0);
    	dianlan.setDate(starts.getDate());
    	dianlan.setNh(ends.getNh() - starts.getNh());
    	dianlan.setNhair(ends.getNhair() - starts.getNhair());
    	result = JSONArray.fromObject(dianlan).toString();
    	return "survey_success";
    }
    public String surveynh()throws Exception{
    	SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
    	String timeindex=request.getParameter("timeindex");
    	String datetime = request.getParameter("datetime")+"-01";//获取到穿过来的日期 
    	Date da = format.parse(datetime);
    	Calendar calendar = Calendar.getInstance();
    	calendar.setTime(da);
    	calendar.add(Calendar.MONTH, Integer.parseInt(timeindex));
        Date m = calendar.getTime();
        String start = format.format(m);
        Calendar calendar1 = Calendar.getInstance();
        calendar1.setTime(m); 
        calendar1.add(Calendar.MONTH, 1);
        calendar1.add(Calendar.DAY_OF_MONTH, -1);
    	Date end = calendar1.getTime();
    	
    	Calendar   calendar3   =   new   GregorianCalendar(); 
    	calendar3.setTime(end); 
    	calendar3.add(calendar.DATE,1);
    	end=calendar3.getTime();
    	List<Dianlang> ls=this.loadSurveyelectService.loadnh(start,format.format(end));
		for (int i = 0; i < ls.size()-1 ; i++) {
			Dianlang dl=ls.get(i);
			float allnh=ls.get(i+1).getNh()-dl.getNh();
			float airnh=ls.get(i+1).getNhair()-dl.getNhair();
			dl.setNh(allnh-airnh);
			dl.setNhair(airnh);
			ls.set(i, dl);
		}
		ls.remove(ls.size()-1);
		result = JSONArray.fromObject(ls).toString();
		return "survey_success";
    	
    }
    public String yearnh()throws Exception{
    	String timeindex=request.getParameter("timeindex");
    	Calendar ca = Calendar.getInstance();//得到一个Calendar的实例 
    	ca.setTime(new Date()); //设置时间为当前时间 
    	SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
    	Date last=new Date();
    	Date pro=new Date();
    	ca.add(Calendar.YEAR, Integer.parseInt(timeindex)); //年份减1 
    	last = ca.getTime(); //结果
    	ca.add(Calendar.YEAR, Integer.parseInt(timeindex)-1);
    	pro = ca.getTime(); 
    	List<Dianlang> ls=this.loadSurveyelectService.loadyearnh(format.format(pro),format.format(last));
		List<Dianlang> rls=new ArrayList<Dianlang>();
		if(ls.size()>=1){
		for (int i = 1; i < ls.size() ; i++) {
			Dianlang dl=new Dianlang();
			float allnh=ls.get(i).getNh()-ls.get(i-1).getNh();
			float airnh=ls.get(i).getNhair()-ls.get(i-1).getNhair();
			dl.setNh(allnh-airnh);
			dl.setNhair(airnh);
			dl.setDate(ls.get(i).getDate());
			rls.add(dl);
		}}
		result = JSONArray.fromObject(rls).toString();
		return "survey_success";
    	
    }
    public String yearnh1()throws Exception{
    	String timeindex=request.getParameter("timeindex");
    	Calendar ca = Calendar.getInstance();//得到一个Calendar的实例 
    	ca.setTime(new Date()); //设置时间为当前时间 
    	SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
    	Date last=new Date();
    	Date pro=new Date();
    	ca.add(Calendar.YEAR, Integer.parseInt(timeindex)); //年份减1 
    	last = ca.getTime(); //结果
    	ca.add(Calendar.YEAR, Integer.parseInt(timeindex)-1);
    	pro = ca.getTime(); 
    	List<Dianlang> ls=this.loadSurveyelectService.loadyearnh(format.format(pro),format.format(last));
    	Dianlang dianlan = new Dianlang();
    	Dianlang ends = ls.get(ls.size() - 1);
    	Dianlang starts = ls.get(0);
    	dianlan.setDate(ends.getDate());
    	dianlan.setNh(ends.getNh() - starts.getNh());
    	dianlan.setNhair(ends.getNhair() - starts.getNhair());
    	result = JSONArray.fromObject(dianlan).toString();
    	return "survey_success";
    }
    public String datenh()throws Exception{
    	String time=request.getParameter("time");
    	List<Nownh> ls= this.loadSurveyelectService.loadnowng(time); 		
		List<Nownh> rls=new ArrayList<Nownh>();
		
		if(ls.size()>0){
		for (int i = 1; i < ls.size() ; i++) {
			Nownh nh=new Nownh();
			float allnh=ls.get(i).getNh()-ls.get(i-1).getNh();
			float airnh=ls.get(i).getNhair()-ls.get(i-1).getNhair();
			nh.setNh(allnh-airnh);
			nh.setNhair(airnh);
			nh.setDate(ls.get(i).getDate());
			nh.setID(i);
			nh.setTime(ls.get(i).getTime());
			rls.add(nh);
		};};
		result = JSONArray.fromObject(rls).toString();
		return "survey_success";
    }
    public String survey()throws Exception{ 
    	String req=request.getParameter("time");
    	String flag=request.getParameter("flag");
    	List ls= new ArrayList<Surveyelect>();
    	ls=this.loadSurveyelectService.loadData(req,flag);
    	result =JSONArray.fromObject(ls).toString();
		return "survey_success";
    	
    }
	public String nh() throws Exception{
		String time = request.getParameter("time");
    	SimpleDateFormat dft = new SimpleDateFormat("yyyy-MM-dd");
		Date beginDate = new Date();
		Calendar date = Calendar.getInstance();
		date.setTime(beginDate);
		date.set(Calendar.DATE, date.get(Calendar.DATE) -1);
		Date endDate = dft.parse(dft.format(date.getTime()));
		Test test = loadSurveyelectService.nh(time,dft.format(endDate));
		result =JSONArray.fromObject(test).toString();
    	return "survey_success";
	}
    public String airsurvey()throws Exception{ 
    	String req=request.getParameter("time");
    	String flag=request.getParameter("flag");
    	List ls= new ArrayList<AirSurveyelect>();
    	ls=this.loadSurveyelectService.loadAirData(req,flag);
    	result =JSONArray.fromObject(ls).toString();
		return "survey_success";
    	
    }
    public String alarminfo()throws Exception{ 
    	String req=request.getParameter("time");
    	List<Alarmifo> ls= new ArrayList<Alarmifo>();
    	//List<Alarmifo> lsp= new ArrayList<Alarmifo>();
    	ls=this.loadSurveyelectService.loadAlarmData(req);
    	/*SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	Date date=null;
    	Calendar ca=Calendar.getInstance();
    	for(int i=0;i<ls.size();i++){
    		Alarmifo a=ls.get(i);
    		date = sdf.parse(a.getEventTime());
    		ca.setTime(date);
    		ca.add(Calendar.HOUR_OF_DAY, 8);
    		a.setEventTime(sdf.format(ca.getTime()));
    		lsp.add(a);
    	}*/
    	result =JSONArray.fromObject(ls).toString();
		return "survey_success"; 
    	
    }
    
    public String realnh()throws Exception{
    	Date d=new Date();
    	SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
    	List<Nownh> ls= this.loadSurveyelectService.loadnowng(format.format(d)); 		
		float znh = 0,jnh = 0;
		if(ls.size()>0){
			znh=ls.get(ls.size()-1).getNh();
			jnh=ls.get(ls.size()-1).getNh()-ls.get(0).getNh();
		};
		result = "{\"x\":\"" + Math.round(znh)+"\",\"y\":\""+Math.round(jnh)+"\"}";
		return "survey_success";
    	
    }
    
    public String power()throws Exception{
    	String temp=request.getParameter("month");
    	String year=temp.substring(0, 4);
    	String month=temp.substring(5);
    	
    	List<Power> ls=this.loadSurveyelectService.loadpower(month,year);
		result = JSONArray.fromObject(ls).toString();
		return "survey_success";
    	
    }
    


	public void setLoadDataService(LoadDataService loadDataService) {
		this.loadDataService = loadDataService;
		
	}

	public void setLoadFuzaiService(LoadFuzaiService loadFuzaiService) {
		this.loadFuzaiService = loadFuzaiService;
	}

	public void setLoadSurveyelectService(
		LoadSurveyelectService loadSurveyelectService) {
		this.loadSurveyelectService = loadSurveyelectService;
	}
	public static void main(String[] args) throws Exception {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String j = "-2";
		Calendar c = Calendar.getInstance(); 
		c.setTime(date);
		c.add(Calendar.MONTH, Integer.parseInt(j));
		c.set(Calendar.DAY_OF_MONTH, 1);
		Date start = c.getTime();
		
		Calendar a=Calendar.getInstance();
		a.setTime(start);
		a.set(Calendar.DATE, 1);//把日期设置为当月第一天
		a.roll(Calendar.DATE, -1);//日期回滚一天，也就是最后一天
		Date end = a.getTime();
		System.out.println("该月最大天数:"+format.format(end));
		
	}
	public String baoj() throws Exception{
		String date = request.getParameter("date");
		String date1 = request.getParameter("date1");
		String index = request.getParameter("index");
		Date da = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		if(date.equals("0")){
			String end = format.format(da);	//当前日期
	    	Calendar c = Calendar.getInstance();  
			c.add(Calendar.DATE, - 7);  
			Date monday = c.getTime();
			String start = format.format(monday);//七天的日期;
			if(date1.equals("0")){
				result = JSONArray.fromObject(this.loadSurveyelectService.baoj(start,end)).toString(); 
			}else{
				result = JSONArray.fromObject(this.loadSurveyelectService.baoj1(start,end)).toString(); 
			}
		}else if(date.equals("1")){
			Calendar c = Calendar.getInstance(); 
			c.setTime(da);
			c.add(Calendar.MONTH, Integer.parseInt(index));
			c.set(Calendar.DAY_OF_MONTH, 1);
			Date sta = c.getTime();
			String start = format.format(sta);
			
			Calendar a=Calendar.getInstance();
			a.setTime(sta);
			a.set(Calendar.DATE, 1);//把日期设置为当月第一天
			a.roll(Calendar.DATE, -1);//日期回滚一天，也就是最后一天
			Date en = a.getTime();
			String end = format.format(en);
			

		    if(date1.equals("0")){
		    	List<String> list = this.loadSurveyelectService.baoj(start,end);
		    	list.add(end.split("-")[0]+"-"+end.split("-")[1]);
				result = JSONArray.fromObject(list).toString(); 
			}else{
				result = JSONArray.fromObject(this.loadSurveyelectService.baoj1(start,end)).toString(); 
			}
		}else if(date.equals("2")){
			Calendar c = Calendar.getInstance(); 
	        Date now = null; 
	        c.set(Calendar.MONTH, 0); 
	        c.set(Calendar.DATE, 1); 
	        now = format.parse(format.format(c.getTime())); 
	        Calendar d = Calendar.getInstance(); 
	        Date now1 = null; 
	        c.set(Calendar.MONTH, 11); 
	        c.set(Calendar.DATE, 31); 
	        now1 = format.parse(format.format(c.getTime()) + " 23:59:59"); 
	        if(date1.equals("0")){
	        	List<String> list = this.loadSurveyelectService.baoj(format.format(now),format.format(now1));
		    	list.add(format.format(now).split("-")[0]);
				result = JSONArray.fromObject(list).toString(); 
			}else{
				result = JSONArray.fromObject(this.loadSurveyelectService.baoj1(format.format(now),format.format(now1))).toString(); 
			}
		}
		return "survey_success";
	}
	
	public String bao1j() throws Exception{
		String date = request.getParameter("date");
		
		String index = request.getParameter("index");
		Date da = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		if(date.equals("0")){
			String end = format.format(da);	//当前日期
	    	Calendar c = Calendar.getInstance();  
			c.add(Calendar.DATE, - 7);  
			Date monday = c.getTime();
			String start = format.format(monday);//七天的日期;
			result = Integer.toString(this.loadSurveyelectService.baos(start,end));
		}else if(date.equals("1")){
			Calendar c = Calendar.getInstance(); 
			c.setTime(da);
			c.add(Calendar.MONTH, Integer.parseInt(index));
			c.set(Calendar.DAY_OF_MONTH, 1);
			Date sta = c.getTime();
			String start = format.format(sta);
			
			Calendar a=Calendar.getInstance();
			a.setTime(sta);
			a.set(Calendar.DATE, 1);//把日期设置为当月第一天
			a.roll(Calendar.DATE, -1);//日期回滚一天，也就是最后一天
			Date en = a.getTime();
			String end = format.format(en);
		    result = Integer.toString(this.loadSurveyelectService.baos(start,end));
		}else if(date.equals("2")){
			Calendar c = Calendar.getInstance(); 
	        Date now = null; 
	        c.set(Calendar.MONTH, 0); 
	        c.set(Calendar.DATE, 1); 
	        now = format.parse(format.format(c.getTime())); 
	        Calendar d = Calendar.getInstance(); 
	        Date now1 = null; 
	        c.set(Calendar.MONTH, 11); 
	        c.set(Calendar.DATE, 31); 
	        now1 = format.parse(format.format(c.getTime()) + " 23:59:59"); 
	        result = Integer.toString(this.loadSurveyelectService.baos(format.format(now),format.format(now1)));
		}
		return "survey_success";
	}
}