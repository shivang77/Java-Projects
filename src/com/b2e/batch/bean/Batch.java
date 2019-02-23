package com.b2e.batch.bean;

public class Batch 
{
private int batchid;
private String branchname;
private String course;
private String date;
private String time;
private String remark;
public int getBatchid() {
	return batchid;
}
public void setBatchid(int batchid) {
	this.batchid = batchid;
}
public String getBranchname() {
	return branchname;
}
public void setBranchname(String branchname) {
	this.branchname = branchname;
}
public String getCourse() {
	return course;
}
public void setCourse(String course) {
	this.course = course;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public String getTime() {
	return time;
}
public void setTime(String time) {
	this.time = time;
}
public String getRemark() {
	return remark;
}
public void setRemark(String remark) {
	this.remark = remark;
}

}
