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


@WebServlet("/UpdateFollowupServlet")
public class UpdateFollowupServlet extends HttpServlet 
{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int followupid=Integer.parseInt(request.getParameter("followupid"));
		//int enquiryid=Integer.parseInt(request.getParameter("enquiryid"));
		HttpSession session=request.getSession();
		String enqid=(String)session.getAttribute("enqid");
		
		int enquiryid=Integer.parseInt(enqid);
		String date=request.getParameter("date");
		String remark=request.getParameter("remark");
		HttpSession hs=request.getSession();
		String flag=(String)hs.getAttribute("flag");
		hs.removeAttribute("flag");
		Followup followup=new Followup();
		followup.setFollowupid(followupid);
		followup.setEnquiryid(enquiryid);
		followup.setDate(date);
		followup.setRemark(remark);
		boolean status=new FollowupDaoImpl().update(followup);
		if(status && flag==null)
		{
			response.sendRedirect("followup/followup.jsp");
		}
		if(status && flag!=null)
		{
			List<Followup> list=new FollowupDaoImpl().search2(enquiryid);
			hs.setAttribute("list", list);
			response.sendRedirect("followup/searchfollowup.jsp");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
