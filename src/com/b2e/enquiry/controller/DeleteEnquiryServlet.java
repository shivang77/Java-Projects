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

@WebServlet("/DeleteEnquiryServlet")
public class DeleteEnquiryServlet extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		 
		String tb=request.getParameter("takenby");
		String enqid=request.getParameter("enquiryid");
		String flag=request.getParameter("flag");
		String name=request.getParameter("name");
		String contact=request.getParameter("searchcontact");
		if(enqid!=null && flag!=null)
		{
			int enquiryid=Integer.parseInt(request.getParameter("enquiryid"));
			Boolean status=new EnquiryDaoImpl().delete(enquiryid);
			int enqid1=Integer.parseInt(enqid);
			Enquiry enquiry2=new EnquiryDaoImpl().search(enqid1);

			HttpSession hs=request.getSession();
			hs.setAttribute("enquiry", enquiry2);
			response.sendRedirect("enquiry/searchenquiryid.jsp");

		}
		else if(enqid!=null && name!=null)
		{
			int enquiryid=Integer.parseInt(request.getParameter("enquiryid"));
			Boolean status=new EnquiryDaoImpl().delete(enquiryid);
			List<Enquiry> list=new EnquiryDaoImpl().searchName(name);

			HttpSession hs=request.getSession();
			hs.setAttribute("list", list);
			response.sendRedirect("enquiry/searchenquiryname.jsp");

		}
		else if(enqid!=null && contact!=null)
		{
			int enquiryid=Integer.parseInt(request.getParameter("enquiryid"));
			Boolean status=new EnquiryDaoImpl().delete(enquiryid);
			Enquiry enquiry=new EnquiryDaoImpl().searchContact(contact);
			
			List<Enquiry> list=new ArrayList<>();
			if(enquiry!=null)
			list.add(enquiry);
			
			HttpSession hs=request.getSession();
			hs.setAttribute("list", list);
			response.sendRedirect("enquiry/searchenquirycontact.jsp");

		}
		else if(enqid!=null && tb!=null)
		{
			int enquiryid=Integer.parseInt(request.getParameter("enquiryid"));
			Boolean status=new EnquiryDaoImpl().delete(enquiryid);
			List<Enquiry> list=new ArrayList<>();
			list=new EnquiryDaoImpl().searchTakenby(tb);
			//request.setAttribute("list", list);
			//RequestDispatcher rd=request.getRequestDispatcher("enquiry/searchenquirytakenby.jsp");
			//rd.forward(request, response);
			
			HttpSession hs=request.getSession();
			hs.setAttribute("list", list);
			response.sendRedirect("enquiry/searchenquirytakenby.jsp");
		}
		else if(enqid!=null)
			{
				int enquiryid=Integer.parseInt(request.getParameter("enquiryid"));
				
				Boolean status=new EnquiryDaoImpl().delete(enquiryid);
				response.sendRedirect("enquiry/enquiry.jsp");
			
			}
			
	}
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
		{
		doGet(request, response);
	}

}
	