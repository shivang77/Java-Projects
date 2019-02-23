<%@page import="com.b2e.batch.dao.BatchDaoImpl"%>
<%@page import="java.util.List"%>
<%
String branchname=request.getParameter("branchname");
String q="select branchname from batch where branchname like '"+branchname+"%'";

List<String> list=new BatchDaoImpl().getBranchname(q);

for(String a:list)
{
%>
<option><%= a %></option>
<%
}
%>
