package com.b2e.fee.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.b2e.fee.bean.Fee;
import com.b2e.fee.dao.FeeDaoImpl;

@WebServlet("/InsertFeeServlet")
public class InsertFeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
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
		boolean status=new FeeDaoImpl().insert(fee);
		if(status)
		{
			response.sendRedirect("fee/fee.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
