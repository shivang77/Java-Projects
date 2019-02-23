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

import com.b2e.enquiry.bean.Enquiry;
import com.b2e.enquiry.dao.EnquiryDaoImpl;

@WebServlet("/SearchEnquiryServlet")
public class SearchEnquiryServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String takenby=request.getParameter("takenby");
		String contact=request.getParameter("enquirycontact");
		String name=request.getParameter("enquiryname");
		
		HttpSession hs=request.getSession();
	if(takenby!=null)
	{
		
		List<Enquiry> list=(List<Enquiry>)new EnquiryDaoImpl().searchEnquire(takenby);
		
		hs.setAttribute("list", list);
		response.sendRedirect("enquiry/searchenquirytakenby.jsp");
		
	}
	else if(name!=null)
	{
		
		List<Enquiry> list=(List<Enquiry>)new EnquiryDaoImpl().searchName(name);
		
		hs.setAttribute("list", list);
		response.sendRedirect("enquiry/searchenquiryname.jsp");
		
	}
	else if(contact!=null)
	{
		Enquiry enquiry=(Enquiry)new EnquiryDaoImpl().searchContact(contact);
		List<Enquiry> list=new ArrayList<>();
		list.add(enquiry);
		hs.setAttribute("list", list);
		response.sendRedirect("enquiry/searchenquirycontact.jsp");
		
	}
		
	else
	{
		int enquiryid=Integer.parseInt(request.getParameter("enquiryid"));
		Enquiry enquiry=new EnquiryDaoImpl().search(enquiryid);
		if(enquiry!=null)
		{
		hs.setAttribute("enquiry", enquiry);
		response.sendRedirect("enquiry/searchenquiryid.jsp");
		
		}
		else
		{
			response.sendRedirect("enquiry/searchenquiryid.jsp");
		}
	}
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doGet(request, response);
	}

}
