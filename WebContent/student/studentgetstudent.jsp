<%@page import="com.b2e.student.dao.StudentDaoImpl"%>
<%@page import="com.b2e.student.bean.Student"%>
<%@page import="java.util.List"%>
<%
String studentname=request.getParameter("studentname");

List<Student> list=new StudentDaoImpl().searchstudentname(studentname);

for(Student a:list)
{
%>
<option><%= a.getStudentname() %></option>
<%
}
%>
