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

import com.b2e.empcategory.bean.EmpCategory;
import com.b2e.empcategory.dao.EmpCategoryDaoImpl;

@WebServlet("/SearchEmpCategoryServlet")
public class SearchEmpCategoryServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String categoryname=request.getParameter("categoryname");
		List<EmpCategory> list=new EmpCategoryDaoImpl().searchCategory(categoryname);
		if(list!=null)
		{
			HttpSession hs=request.getSession();
			hs.setAttribute("list", list);
			response.sendRedirect("empcategory/searchempcategory.jsp");
		
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
