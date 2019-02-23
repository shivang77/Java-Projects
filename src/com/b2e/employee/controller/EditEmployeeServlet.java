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

@WebServlet("/EditEmployeeServlet")
public class EditEmployeeServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession hs=request.getSession();
		String flag = (String) hs.getAttribute("flag");
		hs.removeAttribute("flag");
		int employeeid=Integer.parseInt(request.getParameter("employeeid"));
		String employeename=request.getParameter("employeename");
		String fathername=request.getParameter("fathername");
		String dob=request.getParameter("dob");
		String contact=request.getParameter("contact");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String maritalstatus=request.getParameter("maritalstatus");
		String pin=request.getParameter("pin");
		String qualification=request.getParameter("qualification");
		String previouscompany=request.getParameter("previouscompany");
		String aadhar=request.getParameter("aadhar");
		String hiredate=request.getParameter("hiredate");
		String category=request.getParameter("category");
		String type=request.getParameter("type");
		double salary=Double.parseDouble(request.getParameter("salary"));
		
		Employee employee=new Employee();
		employee.setEmployeeid(employeeid);
		employee.setEmployeename(employeename);
		employee.setFathername(fathername);
		employee.setDob(dob);
		employee.setContact(contact);
		employee.setEmail(email);
		employee.setAddress(address);
		employee.setCity(city);
		employee.setState(state);
		employee.setMaritalstatus(maritalstatus);
		employee.setPin(pin);
		employee.setQualification(qualification);
		employee.setPreviouscompany(previouscompany);
		employee.setAadhar(aadhar);
		employee.setHiredate(hiredate);
		employee.setCategory(category);
		employee.setType(type);
		employee.setSalary(salary);
		boolean status=new EmployeeDaoImpl().update(employee);
		
		String employeename1=request.getParameter("employeename");
		String contact1=request.getParameter("contact");
		String category1=request.getParameter("category");
		if(status && flag==null)
		{
			
			response.sendRedirect("employee/employee.jsp");
		}
		else if(status && flag.equals("searchid"))
		{
			HttpSession session=request.getSession();
		session.setAttribute("employee",employee);
		response.sendRedirect("employee/searchforid.jsp");
		
		}
		else if(status && flag.equals("searchname"))
		{
			HttpSession session=request.getSession();
			List<Employee> list=new EmployeeDaoImpl().searchEname(employeename1);
		session.setAttribute("list",list);
		response.sendRedirect("employee/searchforname.jsp");
			
		}
		else if(status && flag.equals("searchcontact"))
		{
			HttpSession session=request.getSession();
			Employee employee1=new EmployeeDaoImpl().searchContact(contact1);
			session.setAttribute("employee",employee1);
			response.sendRedirect("employee/searchforcontact.jsp");
			
		}
		else if(status && flag.equals("searchcategory"))
		{
			HttpSession session=request.getSession();
			List<Employee> list=new EmployeeDaoImpl().searchCategory(category1);
			session.setAttribute("list",list);
			response.sendRedirect("employee/searchforcategory.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
