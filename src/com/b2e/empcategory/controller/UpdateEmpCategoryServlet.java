package com.b2e.empcategory.controller;

import java.io.IOException;
import java.util.ArrayList;
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

@WebServlet("/UpdateEmpCategoryServlet")
public class UpdateEmpCategoryServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
		HttpSession hs=request.getSession();
		String flag = (String) hs.getAttribute("flag");
		hs.removeAttribute("flag");
		
		int categoryid=Integer.parseInt(request.getParameter("categoryid"));
		String categoryname=request.getParameter("categoryname");
		String type=request.getParameter("type");
		
		EmpCategory empcategory=new EmpCategory();
		empcategory.setCategoryid(categoryid);
		empcategory.setCategoryname(categoryname);
		empcategory.setType(type);
		
		boolean status=new EmpCategoryDaoImpl().update(empcategory);
		List<EmpCategory> list=new ArrayList<>();
		list.add(empcategory);
		if(status && flag!=null)
		{
			hs.setAttribute("list", list);
			response.sendRedirect("empcategory/searchempcategory.jsp");
		}
		else if(status )
		{
			response.sendRedirect("empcategory/empcategory.jsp");
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
