package com.b2e.DAO;

import java.util.List;

import com.b2e.bean.Course;

public interface CourseDAO 
{
	public abstract boolean insert(Course course);
	public abstract boolean update(Course course);
	public abstract boolean delete(Course course);
	public abstract Course search(int courseid);
	public abstract List<Course> getAll();
	public abstract int generateID();
}
