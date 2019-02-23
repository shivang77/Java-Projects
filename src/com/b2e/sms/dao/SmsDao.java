package com.b2e.sms.dao;

import java.util.List;

import com.b2e.sms.bean.Sms;

public interface SmsDao
{
	public abstract boolean insert(Sms sms);
	
	public abstract List<Sms> getAll();
	
	public abstract int generateId();
	
	public abstract boolean sendSms(String contact,String message);
}
