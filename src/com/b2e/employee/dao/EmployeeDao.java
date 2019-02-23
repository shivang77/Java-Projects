package com.b2e.employee.dao;

import java.util.List;

import com.b2e.employee.bean.Employee;

public interface EmployeeDao
{
	public abstract boolean insert(Employee employee);
	
	public abstract boolean update(Employee employee);
	
	public abstract boolean delete(int employeeid);
	
	public abstract List<Employee> getAll();
	
	public abstract int generateID();
	
	public abstract Employee searchEid(int employeeid);
	
	public abstract List<Employee> searchEname(String ename);
	
	public abstract Employee searchContact(String contact);
	
	public abstract List<String> searchContactAjax(String contact);
	
	public abstract List<Employee> searchCategory(String category);
	
	public abstract List<String> getEmpCategory();
	
	
}
