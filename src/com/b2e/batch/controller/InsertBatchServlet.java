package com.b2e.batch.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.b2e.batch.bean.Batch;
import com.b2e.batch.dao.BatchDaoImpl;

@WebServlet("/InsertBatchServlet")
public class InsertBatchServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	int batchid=Integer.parseInt(request.getParameter("batchid"));
	String branchname=request.getParameter("branchname");
	String course=request.getParameter("course");
	String date=request.getParameter("date");
	
	String  time=request.getParameter("time");
	String remark=request.getParameter("remark");
	Batch batch=new Batch();
	batch.setBatchid(batchid);
	batch.setBranchname(branchname);
	batch.setCourse(course);
	batch.setDate(date);
	batch.setTime(time);
	batch.setRemark(remark);
	boolean status=new BatchDaoImpl().insert(batch);
	if(status)
	{
		response.sendRedirect("batch/batch.jsp");
	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
