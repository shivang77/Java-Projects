package com.b2e.course.dao;

import java.util.List;

import com.b2e.course.bean.Course;

public interface CourseDao 
{
public abstract boolean insert(Course course);
public abstract boolean update(Course course);
public abstract Course search(String coursename);
public abstract Course search(int courseid);
public abstract boolean delete(int courseid);
public abstract List<Course> getAll();
public abstract List<String> getAllBranch();
public abstract int generateID();
public abstract List<String> getCoursename(String Query);
}
