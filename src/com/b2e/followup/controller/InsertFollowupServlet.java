package com.b2e.followup.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.b2e.followup.bean.Followup;
import com.b2e.followup.dao.FollowupDaoImpl;


@WebServlet("/InsertFollowupServlet")
public class InsertFollowupServlet extends HttpServlet
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	int followupid=Integer.parseInt(request.getParameter("followupid"));
	int enquiryid=Integer.parseInt(request.getParameter("enquiryid"));
	String date=request.getParameter("date");
	String remark=request.getParameter("remark");
	Followup followup=new Followup();
	followup.setFollowupid(followupid);
	followup.setEnquiryid(enquiryid);
	followup.setDate(date);
	followup.setRemark(remark);
	boolean status=new FollowupDaoImpl().insert(followup);
	if(status)
	{
		
		response.sendRedirect("followup/followup.jsp");
	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
