package com.b2e.branch.dao;

import java.util.List;

import com.b2e.branch.bean.Branch;
import com.b2e.course.bean.Course;

public interface BranchDao
{

	public abstract boolean insert(Branch branch);
	
	public abstract boolean delete(int branchid);
	
	public abstract Branch search(int branchid);
	
	public abstract boolean update(Branch branch);
	
	public abstract List<Branch> getAll();
	
	public abstract int generateId();
	
	public abstract Branch search(String branchname);
	
	public abstract List<String> getBranchname(String Query);
}
