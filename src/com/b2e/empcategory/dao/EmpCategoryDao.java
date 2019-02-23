package com.b2e.empcategory.dao;

import java.util.List;

import com.b2e.empcategory.bean.EmpCategory;

public interface EmpCategoryDao 
{
	public abstract boolean insert(EmpCategory empcategory);
	public abstract boolean update(EmpCategory empcategory);
	public abstract boolean delete(int empcategoryid);
	public abstract List<EmpCategory> getAll();
	public abstract int generateID();
	public abstract List<EmpCategory> searchCategory(String category);
	public abstract EmpCategory search(int categoryid);
	public abstract List<String> searchType(String category);
	
}
