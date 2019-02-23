package com.b2e.employee.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.b2e.employee.bean.Employee;
import com.b2e.employee.dao.EmployeeDaoImpl;

@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
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
		
		HttpSession hs=request.getSession();
		hs.setAttribute("employee",employee);
		response.sendRedirect("employee/image.jsp");
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
