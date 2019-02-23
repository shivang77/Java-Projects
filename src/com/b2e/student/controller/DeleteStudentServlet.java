package com.b2e.student.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.b2e.student.bean.Student;
import com.b2e.student.dao.StudentDaoImpl;

@WebServlet("/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int studentid=Integer.parseInt(request.getParameter("studentid"));
		String flag1=request.getParameter("flag1");
		HttpSession hs=request.getSession();
		boolean status=new StudentDaoImpl().delete(studentid);
		if(flag1.equals("studentid"))
		{
			List<Student> list =  new StudentDaoImpl().searchstudentid(studentid);
			hs.setAttribute("list", list);
			hs.removeAttribute("flag1");
			hs.removeAttribute("flag");
			response.sendRedirect("student/searchforstudentid.jsp");
		}
		else if(flag1.equals("studentname"))
		{
			String studentname=request.getParameter("flag");
			List<Student> list = new StudentDaoImpl().searchstudentname(studentname);
			hs.removeAttribute("flag1");
			hs.removeAttribute("flag");
			hs.setAttribute("list", list);
			response.sendRedirect("student/searchforstudentname.jsp");
		}
		else if(flag1.equals("studentcourse"))
		{
			String coursename=request.getParameter("flag");
			List<Student> list =  new StudentDaoImpl().searchcoursename(coursename);
			hs.removeAttribute("flag1");
			hs.removeAttribute("flag");
			hs.setAttribute("list", list);
			response.sendRedirect("student/searchforstudentcoursename.jsp");
		}
		else if(flag1.equals("studentbranch"))
		{
			String branchname=request.getParameter("flag");
			List<Student> list =   new StudentDaoImpl().searchbranchname(branchname);
			hs.removeAttribute("flag1");
			hs.removeAttribute("flag");
			hs.setAttribute("list", list);
			response.sendRedirect("student/searchforstudentbranchname.jsp");
		}
		else if(flag1.equals("studentcontact"))
		{
			String contactnumber=request.getParameter("flag");
			List<Student> list =new StudentDaoImpl().searchcontactnumber(contactnumber);
			hs.removeAttribute("flag1");
			hs.removeAttribute("flag");
			hs.setAttribute("list", list);
			response.sendRedirect("student/searchforstudentcontact.jsp");

		}
		else
		{
			response.sendRedirect("student/student.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
