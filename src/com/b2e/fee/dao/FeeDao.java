package com.b2e.fee.dao;

import java.util.List;

import com.b2e.fee.bean.Fee;

public interface FeeDao 
{
	public abstract List<Fee> searchstudentid(int studentid);
	public abstract List<Fee> searchdate(String date);
	public abstract List<Fee> searchreceiver(String receiver);
	public abstract Fee searchfeeid(int feeid);
	public abstract boolean insert(Fee fee);
	public abstract boolean update(Fee fee);
	public abstract int generateID();
	public abstract boolean delete(int feeid);
	public abstract List<Fee> getAll();
	public abstract List<String> getReceiver(String query);
}
