package com.b2e.course.controller;

import java.io.IOException;
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



@WebServlet("/DeleteCourseServlet")
public class DeleteCourseServlet extends HttpServlet 
{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String flag = request.getParameter("flag"); 
		int courseid=Integer.parseInt(request.getParameter("courseid"));
		Boolean b=new CourseDaoImpl().delete(courseid);
		
		if(b && flag!=null)
		{	
			List<Course> list=new CourseDaoImpl().getAll();
			HttpSession hs=request.getSession();
			hs.setAttribute("list",list);
			response.sendRedirect("course/searchbranchcourse.jsp");
		}
		else if(b)
		{
			response.sendRedirect("course/course.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
