package com.b2e.empcategory.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.b2e.empcategory.bean.EmpCategory;
import com.b2e.empcategory.dao.EmpCategoryDaoImpl;

@WebServlet("/AddEmpCategoryServlet")
public class AddEmpCategoryServlet extends HttpServlet 
{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int categoryid=Integer.parseInt(request.getParameter("categoryid"));
		String categoryname=request.getParameter("categoryname");
		String type=request.getParameter("type");
		EmpCategory empcategory=new EmpCategory();
		empcategory.setCategoryid(categoryid);
		empcategory.setCategoryname(categoryname);
		empcategory.setType(type);
		boolean status=new EmpCategoryDaoImpl().insert(empcategory);
		if(status)
		{
			response.sendRedirect("empcategory/empcategory.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		doGet(request, response);
	}

}
