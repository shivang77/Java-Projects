package com.b2e.followup.bean;

public class Followup
{
	private int followupid;
	private int enquiryid;
	private String date;
	private String remark;
	public int getFollowupid() {
		return followupid;
	}
	public void setFollowupid(int followupid) {
		this.followupid = followupid;
	}
	public int getEnquiryid() {
		return enquiryid;
	}
	public void setEnquiryid(int enquiryid) {
		this.enquiryid = enquiryid;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
