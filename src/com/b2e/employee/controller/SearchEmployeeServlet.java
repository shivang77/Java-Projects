package com.b2e.employee.controller;



import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.b2e.employee.bean.Employee;
import com.b2e.employee.dao.EmployeeDaoImpl;



@WebServlet("/SearchEmployeeServlet")
public class SearchEmployeeServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String employeeid=request.getParameter("employeeid");
		String employeename=request.getParameter("employeename");
		String contact=request.getParameter("employeecontact");
		String category=request.getParameter("employeecategory");
		
		
	
	if(employeeid!=null)
	{
		int employeeid1=Integer.parseInt(employeeid);
		Employee employee=new EmployeeDaoImpl().searchEid(employeeid1);
		HttpSession session=request.getSession();
		session.setAttribute("employee", employee);
		response.sendRedirect("employee/searchforid.jsp");
			
	}
	else if(employeename!=null)
	{
		HttpSession session=request.getSession();
		List<Employee> list=new EmployeeDaoImpl().searchEname(employeename);
		session.setAttribute("list",list);
		response.sendRedirect("employee/searchforname.jsp");
	}
	else if(contact!=null)
	{
		HttpSession session=request.getSession();
		Employee employee=new EmployeeDaoImpl().searchContact(contact);
		session.setAttribute("employee",employee);
		response.sendRedirect("employee/searchforcontact.jsp");
	}
	
	else if(category!=null)
	{
		HttpSession session=request.getSession();
		List<Employee> list=new EmployeeDaoImpl().searchCategory(category);
		session.setAttribute("list",list);
		response.sendRedirect("employee/searchforcategory.jsp");
	}
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doGet(request, response);
	}

}
