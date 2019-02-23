package com.b2e.student.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.b2e.student.bean.Student;
import com.b2e.student.dao.StudentDaoImpl;


@WebServlet("/UpdateStudentServlet")
public class UpdateStudentServlet extends HttpServlet 
{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession hs=request.getSession();
		String flag1 = (String) hs.getAttribute("flag1");
		
		
		int studentid=Integer.parseInt(request.getParameter("studentid"));
		String branchname=request.getParameter("branchname");
		String dateofregistration=request.getParameter("dateofregistration");
		String coursename=request.getParameter("coursename");
		Double coursefee=Double.parseDouble(request.getParameter("coursefee"));
		String studentname=request.getParameter("studentname");
		String fathersname=request.getParameter("fathersname");
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String pincode=request.getParameter("pincode");
		String contactnumber=request.getParameter("contactnumber");
		Double discount=Double.parseDouble(request.getParameter("discount"));
		String dob=request.getParameter("dob");
		String gender=request.getParameter("gender");
		String qualification=request.getParameter("qualification");
		String currentinstitute=request.getParameter("currentinstitute");
		String persuingyear=request.getParameter("persuingyear");
		String discounttype=request.getParameter("discounttype");
		double finalfee=Double.parseDouble(request.getParameter("finalfee"));
		Student student=new Student();
		student.setStudentid(studentid);
		student.setBranchname(branchname);
		student.setDateofregistration(dateofregistration);
		student.setCoursename(coursename);
		student.setCoursefee(coursefee);
		student.setStudentname(studentname);
		student.setFathersname(fathersname);
		student.setAddress(address);
		student.setCity(city);
		student.setState(state);
		student.setDiscount(discount);
		student.setPincode(pincode);
		student.setContactnumber(contactnumber);
		student.setDob(dob);
		student.setGender(gender);
		student.setQualification(qualification);
		student.setCurrentinstitute(currentinstitute);
		student.setPersuingyear(persuingyear);
		student.setDiscounttype(discounttype);
		student.setFinalfee(finalfee);
		
		boolean status=new StudentDaoImpl().update(student);
		
		if(flag1!=null)
		{
		if(flag1.equals("studentid"))
		{
			List<Student> list =  new StudentDaoImpl().searchstudentid(studentid);
			hs.setAttribute("list", list);
			hs.removeAttribute("flag1");
			hs.removeAttribute("flag");
			response.sendRedirect("student/searchforstudentid.jsp");
		}
		else if(flag1.equals("studentname"))
		{
			String studentname1=(String)hs.getAttribute("flag");
			
			List<Student> list = new StudentDaoImpl().searchstudentname(studentname1);
			System.out.print(list.size());
			hs.removeAttribute("flag1");
			hs.removeAttribute("flag");
			hs.setAttribute("list", list);
			response.sendRedirect("student/searchforstudentname.jsp");
		}
		else if(flag1.equals("course"))
		{
			String coursename1=(String)hs.getAttribute("flag");
			List<Student> list =  new StudentDaoImpl().searchcoursename(coursename1);
			hs.removeAttribute("flag1");
			hs.removeAttribute("flag");
			hs.setAttribute("list", list);
			response.sendRedirect("student/searchforstudentcoursename.jsp");
		}
		else if(flag1.equals("studentbranch"))
		{
			String branchname1=(String)hs.getAttribute("flag");
			List<Student> list =   new StudentDaoImpl().searchbranchname(branchname1);
			hs.removeAttribute("flag1");
			hs.removeAttribute("flag");
			hs.setAttribute("list", list);
			response.sendRedirect("student/searchforstudentbranchname.jsp");
		}
		else if(flag1.equals("studentcontact"))
		{
			String contactnumber1=(String)hs.getAttribute("flag");
			List<Student> list =new StudentDaoImpl().searchcontactnumber(contactnumber1);
			hs.removeAttribute("flag1");
			hs.removeAttribute("flag");
			hs.setAttribute("list", list);
			response.sendRedirect("student/searchforstudentcontact.jsp");

		}
		}
		else
		{
			response.sendRedirect("student/student.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
