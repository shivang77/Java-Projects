<%@page import="com.b2e.batch.dao.BatchDaoImpl"%>
<%@page import="java.util.List"%>
<%
String coursename=request.getParameter("coursename");
String q="select course from batch where course like '"+coursename+"%'";

List<String> list=new BatchDaoImpl().getCoursename(q);

for(String a:list)
{
%>
<option><%= a %></option>
<%
}
%>
