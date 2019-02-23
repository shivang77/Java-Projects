package com.b2e.fee.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.b2e.fee.bean.Fee;
import com.b2e.fee.dao.FeeDaoImpl;

@WebServlet("/SearchFeeDateServlet")
public class SearchFeeDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String date=request.getParameter("date");
		List<Fee> list=new FeeDaoImpl().searchdate(date);
		if(list!=null)
		{
			HttpSession hs=request.getSession();
			hs.setAttribute("list", list);
			response.sendRedirect("fee/searchfeedate.jsp");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
