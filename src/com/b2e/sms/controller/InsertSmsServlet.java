package com.b2e.sms.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.b2e.sms.bean.Sms;
import com.b2e.sms.dao.SmsDaoImpl;

@WebServlet("/InsertSmsServlet")
public class InsertSmsServlet extends HttpServlet {
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int id=Integer.parseInt(request.getParameter("id"));
		String contact=request.getParameter("contact");
		String message=request.getParameter("message");
		String date=request.getParameter("date");
		Sms sms=new Sms();
		sms.setContact(contact);
		sms.setMessage(message);
		sms.setDate(date);
		sms.setId(id);
		boolean status=new SmsDaoImpl().insert(sms);
		
		if(status)
			response.sendRedirect("sms/sms.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
