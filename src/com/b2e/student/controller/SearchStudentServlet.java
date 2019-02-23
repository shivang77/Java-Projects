package com.b2e.student.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.b2e.student.bean.Student;
import com.b2e.student.dao.StudentDaoImpl;

@WebServlet("/SearchStudentServlet")
public class SearchStudentServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String studentid1=request.getParameter("studentid");
		String studentname = request.getParameter("studentname");
		String coursename = request.getParameter("coursename");
		String contactnumber = request.getParameter("contactnumber");
		String branchname=request.getParameter("branchname");
		HttpSession hs=request.getSession();
		if (studentid1!=null)

		{
			int studentid=Integer.parseInt(studentid1);
			List<Student> list =  new StudentDaoImpl().searchstudentid(studentid);
			hs.setAttribute("list", list);
			response.sendRedirect("student/searchforstudentid.jsp");
			
		}
		else if (studentname!=null)

		{
			List<Student> list = new StudentDaoImpl().searchstudentname(studentname);
			hs.setAttribute("list", list);
			response.sendRedirect("student/searchforstudentname.jsp");
		}
		else if (coursename!=null)

		{
			List<Student> list =  new StudentDaoImpl().searchcoursename(coursename);
			hs.setAttribute("list", list);
			response.sendRedirect("student/searchforstudentcoursename.jsp");
		}
		else if (contactnumber!=null)

		{
			List<Student> list =new StudentDaoImpl().searchcontactnumber(contactnumber);
			hs.setAttribute("list", list);
			response.sendRedirect("student/searchforstudentcontact.jsp");
		}
		else if (branchname!=null)

		{
			List<Student> list =   new StudentDaoImpl().searchbranchname(branchname);
			hs.setAttribute("list", list);
			response.sendRedirect("student/searchforstudentbranchname.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
