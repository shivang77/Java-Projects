package com.b2e.student.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.b2e.student.bean.Student;
import com.b2e.student.dao.StudentDaoImpl;


@WebServlet("/InsertStudentServlet")
public class InsertStudentServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int studentid=Integer.parseInt(request.getParameter("studentid"));
		String branchname=request.getParameter("branchname");
		String dateofregistration=request.getParameter("dateofregistration");
		String course[]=request.getParameterValues("coursename");
		String coursecontent="";
		for(String s:course)
		{
		coursecontent=coursecontent+s+",";
		}
		coursecontent=coursecontent.substring(0,coursecontent.length()-1);
		
		Double coursefee=Double.parseDouble(request.getParameter("coursefee"));
		String studentname=request.getParameter("studentname");
		String fathersname=request.getParameter("fathersname");
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String pincode=request.getParameter("pincode");
		String contactnumber=request.getParameter("contactnumber");
		String dob=request.getParameter("dob");
		double discount=Double.parseDouble(request.getParameter("discount"));
		String gender=request.getParameter("gender");
		String qualification=request.getParameter("qualification");
		String currentinstitute=request.getParameter("currentinstitute");
		String persuingyear=request.getParameter("persuingyear");
		String discounttype=request.getParameter("discounttype");
		double finalfee=Double.parseDouble(request.getParameter("finalfee"));
		
		Student student=new Student();
		student.setStudentid(studentid);
		student.setBranchname(branchname);
		student.setDateofregistration(dateofregistration);
		student.setCoursename(coursecontent);
		student.setCoursefee(coursefee);
		student.setStudentname(studentname);
		student.setFathersname(fathersname);
		student.setAddress(address);
		student.setCity(city);
		student.setState(state);
		student.setPincode(pincode);
		student.setContactnumber(contactnumber);
		student.setDob(dob);
		student.setDiscount(discount);
		student.setGender(gender);
		student.setQualification(qualification);
		student.setCurrentinstitute(currentinstitute);
		student.setPersuingyear(persuingyear);
		student.setDiscounttype(discounttype);
		student.setFinalfee(finalfee);
		
		HttpSession hs=request.getSession();
		hs.setAttribute("student",student);
		response.sendRedirect("student/image.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
