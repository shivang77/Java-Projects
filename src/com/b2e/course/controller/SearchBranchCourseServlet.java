package com.b2e.course.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.b2e.course.bean.Course;
import com.b2e.course.dao.CourseDaoImpl;

@WebServlet("/SearchBranchCourseServlet")
public class SearchBranchCourseServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	
		HttpSession hs=request.getSession();
		String branchname=request.getParameter("branchname");
		 if(!branchname.equals(""))
		{
			
			 List<Course> list=new CourseDaoImpl().searchBranchesName(branchname);
			 request.setAttribute("list",list);
			 hs.setAttribute("list",list);
			 response.sendRedirect("course/searchbranchcourse.jsp");
			
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
