<%@page import="com.b2e.course.dao.CourseDaoImpl"%>
<%@page import="java.util.List"%>
<%
String coursename=request.getParameter("coursename");
String q="select coursename from course where coursename like '"+coursename+"%'";

List<String> list=new CourseDaoImpl().getCoursename(q);

for(String a:list)
{
%>
<option><%= a %></option>
<%
}
%>
