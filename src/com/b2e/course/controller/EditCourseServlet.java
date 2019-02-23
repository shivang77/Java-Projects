package com.b2e.course.controller;

import java.util.List;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.b2e.course.bean.Course;
import com.b2e.course.dao.CourseDaoImpl;



@WebServlet("/EditCourseServlet")
public class EditCourseServlet extends HttpServlet 
{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession hs=request.getSession();
		String flag = (String) hs.getAttribute("flag");
		
		int courseid=Integer.parseInt(request.getParameter("courseid"));
		String coursename=request.getParameter("coursename");
		double coursefee=Double.parseDouble(request.getParameter("coursefee"));
		String duration=request.getParameter("duration");
		String prerequisite=request.getParameter("prerequisite");
		String remark=request.getParameter("remark");
		Course course=new Course();
		course.setCourseid(courseid);
		course.setCoursename(coursename);
		course.setCoursefee(coursefee);
		course.setDuration(duration);
		course.setPrerequisite(prerequisite);
		course.setRemark(remark);
		String branch[]=request.getParameterValues("branch");
		String branchcontent="";
		for(String s:branch)
		{
		branchcontent=branchcontent+s+",";
		}
		branchcontent=branchcontent.substring(0,branchcontent.length()-1);
		course.setBranch(branchcontent);
		
		boolean status=new CourseDaoImpl().update(course);
		if(status && flag==null)
		{
			response.sendRedirect("course/course.jsp");
		}
		else if(status && flag.equals("search"))
		{
		hs.setAttribute("course",course);
		response.sendRedirect("course/searchforcourse.jsp");
		}
		else if(status && flag.equals("searchbranchcourse"))
		{

			List<Course> list=new ArrayList<>();
			list.add(course);
		hs.setAttribute("list",list);
		response.sendRedirect("course/searchbranchcourse.jsp");
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
