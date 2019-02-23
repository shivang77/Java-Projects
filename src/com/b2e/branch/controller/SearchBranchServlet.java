package com.b2e.branch.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.b2e.branch.bean.Branch;
import com.b2e.branch.dao.BranchDaoImpl;

@WebServlet("/SearchBranchServlet")
public class SearchBranchServlet extends HttpServlet {
	
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String branchid=request.getParameter("branchid");
		String branchname=request.getParameter("branchname");
		HttpSession hs=request.getSession();
		if(branchname!=null)
		{
			 Branch branch=new BranchDaoImpl().search(branchname);
			 hs.setAttribute("branch",branch);
			 response.sendRedirect("branch/searchforbranch.jsp");
			 
		}
		if(branchid!=null)
		{

			int branchid1=Integer.parseInt(branchid);
			Branch branch=new BranchDaoImpl().search(branchid1);
			hs.setAttribute("branch",branch);
			 response.sendRedirect("branch/searchforbranch.jsp");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
