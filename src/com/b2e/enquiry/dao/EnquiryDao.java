package com.b2e.enquiry.dao;

import java.util.List;

import com.b2e.batch.bean.Batch;
import com.b2e.enquiry.bean.Enquiry;

public interface EnquiryDao 
{
    public abstract boolean insert(Enquiry enquiry);
	
	public abstract boolean delete(int enquiryid);
	
	public abstract List<String> search(String takenby);
	
	public abstract Enquiry search(int enquiryid);
	
	public abstract List<Enquiry> searchEnquire(String takenby);
	
	public abstract boolean update(Enquiry enquiry);
	
	public abstract List<Enquiry> getAll();
	
	public abstract int generateId();
	
	public abstract List<Enquiry> searchTakenby(String takenby);
	
	public abstract List<Enquiry> searchName(String searchname);
	
	public abstract Enquiry searchContact(String contact);

}
