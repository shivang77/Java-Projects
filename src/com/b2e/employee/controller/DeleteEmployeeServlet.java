package com.b2e.employee.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.b2e.course.bean.Course;
import com.b2e.course.dao.CourseDaoImpl;
import com.b2e.employee.bean.Employee;
import com.b2e.employee.dao.EmployeeDaoImpl;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
			String flag = request.getParameter("flag"); 
			int employeeid=Integer.parseInt(request.getParameter("employeeid"));
			String employeename=request.getParameter("employeename");
			String contact=request.getParameter("contact");
			String category=request.getParameter("category");
			Boolean status=new EmployeeDaoImpl().delete(employeeid);
			
			if(status && flag==null)
			{
				response.sendRedirect("employee/employee.jsp");
			}
			else if(status && flag.equals("searchid"))
			{
				response.sendRedirect("employee/employee.jsp");
		
			}
			else if(status && flag.equals("searchname"))
			{
				HttpSession session=request.getSession();
				List<Employee> list=new EmployeeDaoImpl().searchEname(employeename);
			session.setAttribute("list",list);
			response.sendRedirect("employee/searchforname.jsp");
			
			}
			else if(status && flag.equals("searchcontact"))
			{
				HttpSession session=request.getSession();
				Employee employee=new EmployeeDaoImpl().searchContact(contact);
				session.setAttribute("employee",employee);
				response.sendRedirect("employee/employee.jsp");
			}
			else if(status && flag.equals("searchcategory"))
			{
				HttpSession session=request.getSession();
				List<Employee> list=new EmployeeDaoImpl().searchCategory(category);
				session.setAttribute("list",list);
				response.sendRedirect("employee/searchforcategory.jsp");
			}
				
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
