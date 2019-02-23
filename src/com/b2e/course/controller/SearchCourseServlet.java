package com.b2e.course.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.b2e.course.bean.Course;
import com.b2e.course.dao.CourseDaoImpl;

@WebServlet("/SearchCourseServlet")
public class SearchCourseServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String courseid=request.getParameter("courseid");
		String coursename=request.getParameter("coursename");
		HttpSession hs=request.getSession();
		if(coursename!=null)
		{
			
			 Course course=new CourseDaoImpl().search(coursename);
			 hs.setAttribute("course",course);
			 response.sendRedirect("course/searchforcourse.jsp");
			
		}
		if(courseid!=null)
		{
			
			int courseid1=Integer.parseInt(courseid);
			Course course=new CourseDaoImpl().search(courseid1);
			hs.setAttribute("course",course);
			 response.sendRedirect("course/searchforcourse.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
