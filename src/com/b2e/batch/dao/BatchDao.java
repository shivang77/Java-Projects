package com.b2e.batch.dao;

import java.util.List;

import com.b2e.batch.bean.Batch;

public interface BatchDao 
{

	public abstract boolean insert(Batch batch);
	
	public abstract boolean delete(int batchid);
	
	public abstract List<Batch> search(String coursename);
	
	public abstract List<Batch> searchBranch(String branchname);
	
	public abstract Batch search(int branchid);
	
	public abstract boolean update(Batch batch);
	
	public abstract List<Batch> getAll();
	
	public abstract int generateId();
	
	public abstract List<String> getCoursename(String Query);

	public abstract List<String> getBranchname(String Query);
}
