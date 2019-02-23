package com.b2e.fee.bean;

public class Fee 
{
private int feeid;
private int studentid;
private String date;
private double submitfee;
private String receiver;
public int getFeeid() {
	return feeid;
}
public void setFeeid(int feeid) {
	this.feeid = feeid;
}
public int getStudentid() {
	return studentid;
}
public void setStudentid(int studentid) {
	this.studentid = studentid;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public double getSubmitfee() {
	return submitfee;
}
public void setSubmitfee(double submitfee) {
	this.submitfee = submitfee;
}
public String getReceiver() {
	return receiver;
}
public void setReceiver(String receiver) {
	this.receiver = receiver;
}


}
