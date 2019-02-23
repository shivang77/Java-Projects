package com.b2e.bean;

public class Course 
{
	private int courseid;
	private String coursename;
	private double coursefee;
	private String duration;
	private String prerequisite;
	private String remark;
	
	public Course()
	{
		
	}
	
	
	
	public Course(int courseid, String coursename, double coursefee, String duration, String prerequisite,
			String remark) {
		super();
		this.courseid = courseid;
		this.coursename = coursename;
		this.coursefee = coursefee;
		this.duration = duration;
		this.prerequisite = prerequisite;
		this.remark = remark;
	}



	public int getCourseid() {
		return courseid;
	}
	public void setCourseid(int courseid) {
		this.courseid = courseid;
	}
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	public double getCoursefee() {
		return coursefee;
	}
	public void setCoursefee(double coursefee) {
		this.coursefee = coursefee;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getPrerequisite() {
		return prerequisite;
	}
	public void setPrerequisite(String prerequisite) {
		this.prerequisite = prerequisite;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}
