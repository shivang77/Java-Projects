package com.b2e.branch.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.b2e.branch.bean.Branch;
import com.b2e.branch.dao.BranchDaoImpl;

@WebServlet("/InsertBranchServlet")
public class InsertBranchServlet extends HttpServlet 
{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
	 int branchid=Integer.parseInt(request.getParameter("branchid"));
	 String branchname=(String)request.getParameter("branchname");
	 String city=request.getParameter("city");
	 String state=request.getParameter("state");
	 String pin=(String)request.getParameter("pin");
	 String branchmanager=request.getParameter("branchmanager");
	 String managercontact=(String)request.getParameter("managercontact");
	 String branchcontact=(String)request.getParameter("branchcontact");
	 
	 Branch branch=new Branch();
	 branch.setBranchid(branchid);
	 branch.setBranchname(branchname);
	 branch.setCity(city);
	 branch.setState(state);
	 branch.setPin(pin);
	 branch.setBranchmanager(branchmanager);
	 branch.setManagercontact(managercontact);
	 branch.setBranchcontact(branchcontact);
	 
	 boolean b=new BranchDaoImpl().insert(branch);
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
