package com.b2e.followup.dao;

import java.util.List;


import com.b2e.followup.bean.Followup;

public interface FollowupDao 
{
	 public abstract boolean insert(Followup followup);
		
		public abstract boolean delete(int followupid);
				
		public abstract Followup search(int followupid);
		
		public abstract List<Followup> search2(int enquiryid);
		
		public abstract boolean update(Followup followup);
		
		public abstract List<Followup> getAll();
		
		public abstract int generateId();
}
