package com.b2e.followup.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.b2e.followup.bean.Followup;
import com.b2e.followup.dao.FollowupDaoImpl;


@WebServlet("/SearchFollowupServlet")
public class SearchFollowupServlet extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//int enquiryid=Integer.parseInt(request.getParameter("enquiryid"));
		HttpSession session=request.getSession();
		String enqid=(String)session.getAttribute("enqid");
		int enquiryid=Integer.parseInt(enqid);
		List<Followup> list=new FollowupDaoImpl().search2(enquiryid); 
		//Followup followup=new FollowupDaoImpl().search2(enquiryid);
		if(list!=null)
		{
			HttpSession hs=request.getSession();
			hs.setAttribute("list", list);
			response.sendRedirect("followup/searchfollowup.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
