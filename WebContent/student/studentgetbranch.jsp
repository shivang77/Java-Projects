<%@page import="com.b2e.branch.bean.Branch"%>
<%@page import="com.b2e.branch.dao.BranchDaoImpl"%>
<%@page import="java.util.List"%>
<%
String branchname=request.getParameter("branchname");
List<Branch> list=new BranchDaoImpl().getAll();

for(Branch a:list)
{
%>
<option><%= a.getBranchname() %></option>
<%
}
%>
