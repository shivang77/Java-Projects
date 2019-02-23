package com.b2e.batch.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.b2e.batch.bean.Batch;
import com.b2e.batch.dao.BatchDaoImpl;

@WebServlet("/SearchBatchServlet")
public class SearchBatchServlet extends HttpServlet {
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String coursename=request.getParameter("coursename");
	List<Batch> list=new BatchDaoImpl().search(coursename);
	if(list!=null)
	{
		HttpSession hs=request.getSession();
		hs.setAttribute("list", list);
		response.sendRedirect("batch/searchforbatch.jsp");
	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
