package com.b2e.sms.bean;

public class Sms
{
private int id;
private String message;
private String contact;
private String date;

public String getMessage() {
	return message;
}
public void setMessage(String message) {
	this.message = message;
}
public String getContact() {
	return contact;
}
public void setContact(String contact) {
	this.contact = contact;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}


}
