package com.b2e.enquiry.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.b2e.enquiry.bean.Enquiry;
import com.b2e.enquiry.dao.EnquiryDaoImpl;

@WebServlet("/InsertEnquiryServlet")
public class InsertEnquiryServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	int enquiryid=Integer.parseInt(request.getParameter("enquiryid"));
	String enquiryname=request.getParameter("enquiryname");
	String contact=request.getParameter("contact");
	String mailid=request.getParameter("mailid");
	String college=request.getParameter("college");
	String date=request.getParameter("date");
	String course[]=request.getParameterValues("course");
	String coursecontent="";
	for(String s:course)
	{
	coursecontent=coursecontent+s+",";
	}
	coursecontent=coursecontent.substring(0,coursecontent.length()-1);
	String takenby=request.getParameter("takenby");
	String reference=request.getParameter("reference");
	String remark=request.getParameter("remark");
	Enquiry enquiry=new Enquiry();
	enquiry.setEnquiryid(enquiryid);
	enquiry.setEnquiryname(enquiryname);
	enquiry.setContact(contact);
	enquiry.setMailid(mailid);
	enquiry.setCollege(college);
	enquiry.setDate(date);
	enquiry.setCourse(coursecontent);
	enquiry.setTakenby(takenby);
	enquiry.setReference(reference);
	enquiry.setRemark(remark);
	
	boolean status=new EnquiryDaoImpl().insert(enquiry);
	if(status)
	{
		response.sendRedirect("enquiry/enquiry.jsp");
	}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
