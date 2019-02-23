package com.b2e.enquiry.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.b2e.branch.bean.Branch;
import com.b2e.branch.dao.BranchDaoImpl;
import com.b2e.enquiry.bean.Enquiry;
import com.b2e.enquiry.dao.EnquiryDaoImpl;


@WebServlet("/UpdateEnquiryServlet")
public class UpdateEnquiryServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession hs=request.getSession();
		String enqid = (String) hs.getAttribute("enquiryid");
		hs.removeAttribute("enquiryid");
		String tb = (String) hs.getAttribute("takenby");
		hs.removeAttribute("takenby");
		String flag = (String) hs.getAttribute("flag");
		hs.removeAttribute("flag");
		
		String name=request.getParameter("name");
		String searchcontact=request.getParameter("contact");
		
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
	boolean status=new EnquiryDaoImpl().update(enquiry);
	if(flag==null && enqid!=null && tb==null && name==null && searchcontact==null)
	{
		response.sendRedirect("enquiry/enquiry.jsp");
	}
	else if(flag==null && enqid!=null && tb!=null && name==null && searchcontact==null)
	{	
		List<Enquiry> list=new ArrayList<>();
		list=new EnquiryDaoImpl().searchTakenby(tb);
		//request.setAttribute("list", list);
		//RequestDispatcher rd=request.getRequestDispatcher("enquiry/searchenquirytakenby.jsp");
		//rd.forward(request, response);
		
		hs.setAttribute("list", list);
		response.sendRedirect("enquiry/searchenquirytakenby.jsp");
		
	}
	else if(flag!=null && enqid!=null && tb==null && name==null && searchcontact==null)
	{
		int enqid1=Integer.parseInt(enqid);
		Enquiry enquiry2=new EnquiryDaoImpl().search(enqid1);
		//request.setAttribute("enquiry", enquiry2);
		//RequestDispatcher rd=request.getRequestDispatcher("enquiry/searchenquiryid.jsp");
		//rd.forward(request, response);
		
		hs.setAttribute("enquiry", enquiry2);
		response.sendRedirect("enquiry/searchenquiryid.jsp");
	}
	
	else if(name!=null)
	{
		List<Enquiry> list=new ArrayList<>();
		list=new EnquiryDaoImpl().searchName(name);
		hs.setAttribute("list", list);
		response.sendRedirect("enquiry/searchenquiryname.jsp");
	}
	else if(searchcontact!=null)
	{
		List<Enquiry> list=new ArrayList<>();
		Enquiry enquiry1=new EnquiryDaoImpl().searchContact(searchcontact);
		list.add(enquiry1);
		hs.setAttribute("list", list);
		response.sendRedirect("enquiry/searchenquirycontact.jsp");
	}
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
