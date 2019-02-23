package com.b2e.course.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.b2e.course.bean.Course;
import com.b2e.course.dao.CourseDaoImpl;



@WebServlet("/AddCourseServlet")
public class AddCourseServlet extends HttpServlet 
{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		int courseid=Integer.parseInt(request.getParameter("courseid"));
		String coursename=request.getParameter("coursename");
		double coursefee=Double.parseDouble(request.getParameter("coursefee"));
		String duration=request.getParameter("duration");
		String prerequisite=request.getParameter("prerequisite");
		String remark=request.getParameter("remark");
		String branch[]=request.getParameterValues("branch");
		String branchcontent="";
		for(String s:branch)
		{
		branchcontent=branchcontent+s+",";
		}
		branchcontent=branchcontent.substring(0,branchcontent.length()-1);
		Course course=new Course();
		course.setCourseid(courseid);
		course.setCoursename(coursename);
		course.setCoursefee(coursefee);
		course.setDuration(duration);
		course.setPrerequisite(prerequisite);
		course.setRemark(remark);
		course.setBranch(branchcontent);
		boolean b=new CourseDaoImpl().insert(course);
		if(b)
		{
		response.sendRedirect("course/course.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
