<%@page import="com.b2e.branch.dao.BranchDaoImpl"%>
<%@page import="java.util.List"%>
<%
String branchname=request.getParameter("branchname");
String q="select branchname from branch where branchname like '"+branchname+"%'";
List<String> list=new BranchDaoImpl().getBranchname(q);
for(String a:list)
{
%>
<option><%= a %></option>
<%
}
%>
