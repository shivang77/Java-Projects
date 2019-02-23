package com.b2e.fee.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.b2e.fee.bean.Fee;
import com.b2e.fee.dao.FeeDaoImpl;

@WebServlet("/DeleteFeeServlet")
public class DeleteFeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int feeid=Integer.parseInt(request.getParameter("feeid"));
		String flag=request.getParameter("flag");
		Boolean status=new FeeDaoImpl().delete(feeid);
		if(status && flag!=null)
		{
			List<Fee> list=new FeeDaoImpl().getAll();
			HttpSession hs=request.getSession();
			hs.setAttribute("list",list);
			response.sendRedirect("fee/searchfeereceiver.jsp");
		}
		else if(status)
		{
			response.sendRedirect("fee/fee.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
