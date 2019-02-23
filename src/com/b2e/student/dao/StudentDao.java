package com.b2e.student.dao;

import java.util.List;

import com.b2e.student.bean.Student;

public interface StudentDao 
{
public abstract boolean insert(Student student);

public abstract boolean delete(int studentid);

public abstract boolean update(Student student);

public abstract List<Student> getAll();

public abstract List<Student> searchstudentid(int studentid);

public abstract List<Student> searchstudentname(String studentname);

public abstract List<Student> searchbranchname(String branchname);

public abstract List<Student> searchcoursename(String coursename);

public abstract List<Student> searchcontactnumber(String contactnumber);

public abstract int generateid();

public abstract double getCourseFee(String courses[], String branchname); 
}

