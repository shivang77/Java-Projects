package com.b2e.branch.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.b2e.branch.dao.BranchDaoImpl;



@WebServlet("/DeleteBranchServlet")
public class DeleteBranchServlet extends HttpServlet {

  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		 
			int branchid=Integer.parseInt(request.getParameter("branchid"));
			Boolean b=new BranchDaoImpl().delete(branchid);
			if(b)
			{
			response.sendRedirect("branch/branch.jsp");
			}
	}
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
		{
		doGet(request, response);
	}

}
