package com.b2e.branch.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.b2e.branch.bean.Branch;
import com.b2e.branch.dao.BranchDaoImpl;


@WebServlet("/UpdateBranchServlet")
public class UpdateBranchServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession hs=request.getSession();
		String flag = (String) hs.getAttribute("flag");
		hs.removeAttribute("flag");
		
		int branchid=Integer.parseInt(request.getParameter("branchid"));
		String branchname=request.getParameter("branchname");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String pin=request.getParameter("pin");
		String branchmanager=request.getParameter("branchmanager");
		String managercontact=request.getParameter("managercontact");
		String branchcontact=request.getParameter("branchcontact");
		Branch branch=new Branch();
		branch.setBranchid(branchid);
		branch.setBranchname(branchname);
		branch.setCity(city);
		branch.setState(state);
		branch.setPin(pin);
		branch.setBranchmanager(branchmanager);
		branch.setManagercontact(managercontact);
		branch.setBranchcontact(branchcontact);
		boolean status=new BranchDaoImpl().update(branch);
	if(status && flag!=null)
	{
		hs.setAttribute("branch",branch);
		response.sendRedirect("branch/searchforbranch.jsp");

	}
	else if(status)
	{
		response.sendRedirect("branch/branch.jsp");
	}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
