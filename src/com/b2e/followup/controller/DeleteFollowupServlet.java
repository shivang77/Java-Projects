package com.b2e.followup.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.b2e.followup.bean.Followup;
import com.b2e.followup.dao.FollowupDaoImpl;
@WebServlet("/DeleteFollowupServlet")
public class DeleteFollowupServlet extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int followupid=Integer.parseInt(request.getParameter("followupid"));
		
		boolean status=new FollowupDaoImpl().delete(followupid);
		HttpSession hs=request.getSession();
		String flag=(String)hs.getAttribute("flag");
		hs.removeAttribute("flag");
	if(status && flag==null)
	{
		response.sendRedirect("followup/followup.jsp");
	}
	if(status && flag!=null)
	{
		response.sendRedirect("followup/searchfollowup.jsp");
		
	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
