package com.pp.test.bo;

import java.io.Serializable;
import java.util.Date;

public class Alarmifo implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String TagName;
	private String AlarmValue;
	private String LimitValue;
	private String EventTime;
	private String EventType;
	private String AlarmText;
	public String getTagName() {
		return TagName;
	}
	public void setTagName(String tagName) {
		TagName = tagName;
	}
	public String getAlarmValue() {
		return AlarmValue;
	}
	public void setAlarmValue(String alarmValue) {
		AlarmValue = alarmValue;
	}
	public String getLimitValue() {
		return LimitValue;
	}
	public void setLimitValue(String limitValue) {
		LimitValue = limitValue;
	}
	public String getEventTime() {
		return EventTime;
	}
	public void setEventTime(String eventTime) {
		EventTime = eventTime;
	}
	public String getEventType() {
		return EventType;
	}
	public void setEventType(String eventType) {
		EventType = eventType;
	}
	public String getAlarmText() {
		return AlarmText;
	}
	public void setAlarmText(String alarmText) {
		AlarmText = alarmText;
	}
	
	
	
	
	
	
	
	

}
