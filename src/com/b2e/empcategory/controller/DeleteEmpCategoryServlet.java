package com.b2e.empcategory.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.b2e.batch.dao.BatchDaoImpl;
import com.b2e.empcategory.bean.EmpCategory;
import com.b2e.empcategory.dao.EmpCategoryDaoImpl;

@WebServlet("/DeleteEmpCategoryServlet")
public class DeleteEmpCategoryServlet extends HttpServlet 
{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int categoryid=Integer.parseInt(request.getParameter("categoryid"));
		String flag=request.getParameter("flag");
		String category=request.getParameter("category");
		Boolean status=new EmpCategoryDaoImpl().delete(categoryid);
		if(status && flag!=null)
		{
			List<EmpCategory> list=new EmpCategoryDaoImpl().searchCategory(category);
			HttpSession hs=request.getSession();
			hs.setAttribute("list",list);
			response.sendRedirect("empcategory/searchempcategory.jsp");
	
		
		}
		else if(status)
		{
			response.sendRedirect("empcategory/empcategory.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
