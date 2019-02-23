

<%@page import="com.b2e.student.dao.StudentDaoImpl"%>
<%@page import="com.b2e.course.dao.CourseDaoImpl"%>
<%
double coursefee=0;
String coursename=request.getParameter("coursename");
String branchname=request.getParameter("branchname");
coursename.substring(1,coursename.length());
String[] courses=coursename.split(",");

coursefee=new StudentDaoImpl().getCourseFee(courses,branchname);	

%>

<%= coursefee%>