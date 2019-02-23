package com.b2e.sms.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.b2e.sms.dao.SmsDaoImpl;


@WebServlet("/SendSmsServlet")
public class SendSmsServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String message=request.getParameter("message");
		String contact=request.getParameter("contact");
		boolean status=new SmsDaoImpl().sendSms(contact, message);
		if(status)
			response.sendRedirect("sms/sms.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
