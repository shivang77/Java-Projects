package com.b2e.fee.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.b2e.fee.bean.Fee;
import com.b2e.fee.dao.FeeDaoImpl;


@WebServlet("/UpdateFeeServlet")
public class UpdateFeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession hs=request.getSession();
		String flag = (String) hs.getAttribute("flag");
		hs.removeAttribute("flag");
		
		int feeid=Integer.parseInt(request.getParameter("feeid"));
		int studentid=Integer.parseInt(request.getParameter("studentid"));
		String date=request.getParameter("date");
		double submitfee=Double.parseDouble(request.getParameter("submitfee"));
		String receiver=request.getParameter("receiver");
		
		Fee fee=new Fee();
		fee.setFeeid(feeid);
		fee.setStudentid(studentid);
		fee.setDate(date);
		fee.setSubmitfee(submitfee);
		fee.setReceiver(receiver);
		boolean status=new FeeDaoImpl().update(fee);
		List<Fee> list=new ArrayList<>();
		list.add(fee);
		if(status && flag!=null)
		{
			hs.setAttribute("list",list);
			response.sendRedirect("fee/searchfeereceiver.jsp");
			request.setAttribute("list",list);
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
