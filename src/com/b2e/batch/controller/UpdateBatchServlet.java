package com.b2e.batch.controller;

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

import com.b2e.batch.bean.Batch;
import com.b2e.batch.dao.BatchDaoImpl;

@WebServlet("/UpdateBatchServlet")
public class UpdateBatchServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession hs=request.getSession();
		String flag = (String) hs.getAttribute("flag");
		hs.removeAttribute("flag");
		
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
		boolean status=new BatchDaoImpl().update(batch);
		List<Batch> list=new ArrayList<>();
		list.add(batch);
		if(status && flag!=null)
		{
			hs.setAttribute("list",list);
			response.sendRedirect("batch/searchforbatch.jsp");
			request.setAttribute("list",list);
		}
		else if(status)
		{
			response.sendRedirect("batch/batch.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
